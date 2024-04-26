#!/bin/bash

# Array de directorios a montar y sus recursos compartidos correspondientes
declare -a DIRECTORIES=("/mnt/rgg-lenovo" "/mnt/truenas")
declare -a SHARE_PATHS=("\\\\rgg-lenovo\\compartida" "\\\\truenas\\backup")

# Array para almacenar los resultados de los montajes
declare -a MOUNT_RESULTS=()

# Verificar y montar cada directorio
for ((i=0; i<${#DIRECTORIES[@]}; i++)); do
    DIRECTORY="${DIRECTORIES[i]}"
    SHARE_PATH="${SHARE_PATHS[i]}"

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
