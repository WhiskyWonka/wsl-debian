#!/bin/bash

# Verificar si jq está instalado
if ! command -v jq &> /dev/null; then
    echo "Error: 'jq' no está instalado."
    echo "Por favor, instala 'jq' para continuar."
    echo "Puedes instalarlo usando uno de los siguientes comandos:"
    echo "  - Debian/Ubuntu: sudo apt-get install jq"
    echo "  - Red Hat/CentOS: sudo yum install jq"
    echo "  - macOS (con Homebrew): brew install jq"
    exit 1
fi

# Ruta al archivo JSON
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/config.json"
# CONFIG_FILE="config.json"

# Verificar si el archivo JSON existe
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: El archivo de configuración '$CONFIG_FILE' no existe."
    exit 1
fi

# Leer el archivo JSON y extraer los directorios y recursos compartidos
DIRECTORIES=($(jq -r '.directories[].local_path' "$CONFIG_FILE"))
DIRECTORIES=($(jq -r '.directories[].local_path' "$CONFIG_FILE"))
MOUNTS=($(jq -r '.directories[].mount' "$CONFIG_FILE"))

# Array para almacenar los resultados de los montajes
declare -a MOUNT_RESULTS=()

# Verificar y montar cada directorio
for ((i=0; i<${#DIRECTORIES[@]}; i++)); do
    DIRECTORY="${DIRECTORIES[i]}"
    SHARE_PATH="${SHARE_PATHS[i]}"
    MOUNT="${MOUNTS[i]}"

    # Verificar si MOUNT es true
    if [ "$MOUNT" != "true" ]; then
        MOUNT_RESULTS+=("$DIRECTORY mount_skipped")
        continue
    fi
    # Verificar si el directorio ya existe
    if [ ! -d "$DIRECTORY" ]; then
        # Capturar el error al intentar crear el directorio
        # Intentar crear el directorio
        if ! mkdir "$DIRECTORY" 2>/dev/null; then
            MOUNT_RESULTS+=("$DIRECTORY directory_error")
        fi
    fi
    
    # Verificar si el directorio ya existe o crearlo
    if [ -d "$DIRECTORY" ]; then
        # Si se crea correctamente, intentar montar el recurso compartido
        if sudo mount -t drvfs "$SHARE_PATH" "$DIRECTORY" 2>/dev/null; then
            MOUNT_RESULTS+=("$SHARE_PATH"_"[mounted_in]"_"$DIRECTORY mounted_ok")
        else
            MOUNT_RESULTS+=("$SHARE_PATH"_"[mounted_in]"_"$DIRECTORY mounting_error")
        fi
    fi
done

# Imprimir los resultados de los montajes
for result in "${MOUNT_RESULTS[@]}"; do
    echo "$result"
done