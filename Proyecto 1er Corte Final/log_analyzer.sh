#!/bin/bash

# Pedir al usuario el patrón a buscar
read -p "Ingrese el patrón a buscar en los logs: " PATTERN

# Definir el archivo de logs a analizar
LOG_FILE="/var/log/syslog"

# Verificar si el archivo de log existe
if [[ ! -f "$LOG_FILE" ]]; then
    echo "El archivo de log $LOG_FILE no existe. Saliendo..."
    exit 1
fi

# Buscar el patrón en el log y resaltar con color
echo "Buscando '$PATTERN' en $LOG_FILE..."
grep --color=always -i "$PATTERN" "$LOG_FILE" | awk '{print "\033[1;32mFecha: "$1, $2, $3 "\033[0m - Mensaje: " substr($0, index($0,$4))}'

# Mensaje final
echo "Búsqueda completada."
