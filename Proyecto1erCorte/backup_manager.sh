#!/bin/bash

#!/bin/bash

# Pedir al usuario el directorio a respaldar y el destino

#read -p "Ingrese el directorio que desea respaldar: " SOURCE_DIR
SOURCE_DIR="/home/paula/Digitales"  # Cambia esto por el directorio a respaldar
BACKUP_DIR="/home/paula/Backups"

# Verificar si los directorios existen
if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "El directorio de origen no existe. Saliendo..."
    exit 1
fi

if [[ ! -d "$BACKUP_DIR" ]]; then
    mkdir -p "$BACKUP_DIR"
fi

# Definir variables
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Crear el respaldo
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Mensaje de éxito
echo "Respaldo creado: $BACKUP_FILE"


 


