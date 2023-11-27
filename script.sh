SERVICE_NAME="httpd"
NFS_DIR="/mnt/joao"
LOG_DIR="/home/joao"

DATE_TIME=$(date +"%Y-%m-%d %H:%M:%S")

if systemctl is-active --quiet "$SERVICE_NAME"; then
    STATUS="ONLINE"
    MESSAGE="O serviço está online."
    OUTPUT_FILE="$NFS_DIR/serviceonline.txt"
else
    STATUS="OFFLINE"
    MESSAGE="O serviço não está em execução."
    OUTPUT_FILE="$NFS_DIR/serviceoffline.txt"
fi

LOG_FILE="$LOG_DIR/service_status_log.txt"
echo "$DATE_TIME - $SERVICE_NAME - Status: $STATUS - $MESSAGE" >> "$LOG_FILE"

echo "Data e Hora: $DATE_TIME" > "$OUTPUT_FILE"
echo "Serviço: $SERVICE_NAME" >> "$OUTPUT_FILE"
echo "Status: $STATUS" >> "$OUTPUT_FILE"
echo "Mensagem: $MESSAGE" >> "$OUTPUT_FILE"
