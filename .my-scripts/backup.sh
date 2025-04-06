#!/bin/bash

# Script para git add/commit/push usando clave .pem
set -e  # Detiene el script si hay errores

# Configuración (personaliza estos valores)
KEY_FILE="$HOME/.ssh/backup.github.pem"
REPO_DIR=$HOME/configs/wsl-debian  # Directorio del repositorio Git
REMOTE="origin"                 # Nombre del remote (usualmente origin)
BRANCH="master"                   # Rama objetivo
COMMIT_MSG="$1"        # Mensaje de commit
LOG_FILE="$HOME/logs/backup.git_push_errors.log"  # Archivo de registro de errores

# Redirigir todos los errores al log
exec 2>>"$LOG_FILE"


# Función para registrar errores con timestamp
log_error() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG_FILE"
}

# Verificaciones de seguridad
if [ ! -f "$KEY_FILE" ]; then
    log_error "Archivo .pem no encontrado en $KEY_FILE"
    exit 1
fi

# Verificar permisos del archivo .pem
PERMISSIONS=$(stat -c "%a" "$KEY_FILE")
if [ "$PERMISSIONS" != "600" ] && [ "$PERMISSIONS" != "400" ]; then
    log_error "Permisos inseguros para $KEY_FILE (actual: $PERMISSIONS)"
    exit 1
fi

# Configurar SSH
export GIT_SSH_COMMAND="ssh -i '$KEY_FILE' -o IdentitiesOnly=yes -F /dev/null"

# Navegar al repositorio
cd "$REPO_DIR" || { log_error "No se pudo acceder a $REPO_DIR"; exit 1; }

if git diff-index --quiet HEAD --; then
    # No hay cambios para commitear
    exit 0
fi

# Operaciones Git
git add . || log_error "Fallo en git add"

git commit -m "$COMMIT_MSG" || log_error "Fallo en git commit"

git push "$REMOTE" "$BRANCH" || log_error "Fallo en git push"