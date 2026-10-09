text="$1"
len=${#text}
line=$(printf '+%*s+' "$((len+2))" | tr ' ' '-')
echo "$line"
echo "| $text |"
echo "$line
# Результат работы (запуск с аргументом "Hello from RTU MIREA!"):
# +-----------------------+
# | Hello from RTU MIREA! |
# +-----------------------+
