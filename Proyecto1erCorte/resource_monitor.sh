#!/bin/bash

LOG_FILE="/var/log/system_stats.log"
sudo chmod +rwx $LOG_FILE

# Crear el archivo de log si no existe

if [[ -f "$LOG_FILE" ]]; then
	sudo chmod o+rwx $LOG_FILE
    echo "El archivo de log ya existe, se sobrescribirá." > $LOG_FILE
else
	touch $LOG_FILE
    echo "Creando el archivo de log." > $LOG_FILE
fi

echo "Monitor de Recursos del Sistema - $(date)" | sudo tee -a $LOG_FILE
echo "para deterner el monitor presionar CTRL + C"
tiempo=5  # Tiempo de actualización en segundos

while true; do
    echo "----- $(date) -----" | sudo tee -a $LOG_FILE
    
    top -bn1 | grep "Cpu(s)" | awk '{print "Uso de CPU: " 100 - $8 "%"}' | sudo tee -a $LOG_FILE
    
    free -h | awk '/Mem:/ {print "Memoria Usada: " $3 " / " $2}' | sudo tee -a $LOG_FILE
    
    df -h | awk '$NF=="/"{print "Disco Usado: "$3" / "$2}' | sudo tee -a $LOG_FILE
    
    ifstat 1 1| awk 'NR==3 {print "Subida: "$3" KB/s, Bajada: "$4" KB/s"}' | sudo tee -a $LOG_FILE
    
    echo "-------------------------" | sudo tee -a $LOG_FILE
    
    sleep $tiempo
done
