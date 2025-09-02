LOG_FILE_PATH=$(find . -type f -name "nginx-access.log" -print -quit)

if [ -z "$LOG_FILE_PATH" ]; then
    echo "Ошибка: Файл лога nginx-access.log не найден."
    exit 1
fi

echo "Найден файл лога: $LOG_FILE_PATH"

echo "Top 5 IP adresses with the most requests:"
awk '{print $1}' "$LOG_FILE_PATH" | sort | uniq -c | sort -nr | head -n 5| awk '{print $2 " - " $1 " requests"}' 
echo ""

echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG_FILE_PATH" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}' 
echo ""

echo "Top 5 response status codes:"
awk '{print $9}' "$LOG_FILE_PATH" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo ""

echo "Top 5 user agents:"
awk '{print $12}' "$LOG_FILE_PATH" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'
echo





