#!/bin/bash


# Definir variables
SOURCE_DIR="/home/paula/Digitales"  # Cambia esto por el directorio a respaldar
BACKUP_DIR="/home/paula"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Verificar si el directorio de backups existe, si no, crearlo
if [[ ! -d "$BACKUP_DIR" ]]; then
    mkdir -p "$BACKUP_DIR"
fi

# Crear el respaldo
sudo tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Mensaje de éxito
echo "Respaldo creado: $BACKUP_FILE"



