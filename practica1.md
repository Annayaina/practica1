## Задание 1

Вывести имена всех пользователей из `/etc/passwd` в алфавитном порядке.

**План:** перейти в `/etc` — отбросить строки-комментарии — взять первое поле — отсортировать.

```bash
cd /etc
grep -v '^#' passwd | cut -d: -f1 | sort
```

`grep -v '^#'` убирает комментарии, `cut -d: -f1` берёт первый столбец (разделитель `:`), `sort` сортирует.

**Вывод:**

```
bin
cron
daemon
ftp
games
guest
halt
klogd
lp
mail
news
nobody
ntp
root
shutdown
sshd
sync
uucp
```

---

## Задание 2

Вывести 5 наибольших портов из `/etc/protocols`.

**План:** отбросить комментарии — поменять местами номер и имя — отсортировать по убыванию — взять 5.

```bash
grep -v '^#' /etc/protocols | awk '{print $2, $1}' | sort -rn | head -5
```

**Вывод:**

```
262 mptcp
143 ethernet
142 rohc
141 wesp
140 shim6
```

---

## Задание 3

Написать программу `banner` для вывода текста в рамке.

**План:** взять аргумент — посчитать длину — построить линию из `-` — вывести рамку.

```bash
#!/bin/bash
text="$1"
len=${#text}
line=$(printf '+%*s+' "$((len+2))" | tr ' ' '-')
echo "$line"
echo "| $text |"
echo "$line"
```

**Вывод (запуск с `Hello from RTU MIREA!`):**

```
+-----------------------+
| Hello from RTU MIREA! |
+-----------------------+
```

---

## Задание 4

Вывести все идентификаторы из файла без повторений.

**План:** найти все слова по правилам C/C++ — убрать повторы — отсортировать.

```bash
grep -oE '\b[A-Za-z_][A-Za-z0-9_]*\b' "$1" | sort -u
```

**Вывод (для `hello.c`):**

```
h
hello
include
int
main
n
printf
return
stdio
void
world
```
## Задание 5

Написать программу для регистрации пользовательской команды (правильные права доступа и копирование в `/usr/local/bin`).

**План:** взять файл — задать права `755` — скопировать в `/usr/local/bin/`.

**Создание тестового файла `banner`:**

```bash
cat > banner << 'EOF'
#!/bin/bash
echo "Hello from banner!"
EOF
```

**Создание скрипта `reg`:**

```bash
cat > reg << 'EOF'
#!/bin/bash
chmod 755 "$1"
cp "$1" /usr/local/bin/
EOF
```

**Запуск:**

```bash
sh reg banner
```

**Проверка:**

```bash
ls -l /usr/local/bin/banner
```

**Вывод:**

```
-rwxr-xr-x    1 root     root            38 Oct 10 08:56 /usr/local/bin/banner
```

`chmod 755` задаёт права: владелец — чтение/запись/выполнение, остальные — чтение/выполнение. `cp` копирует файл в `/usr/local/bin/`, откуда его можно запускать по имени из любого места.

---

## Задание 6

Написать программу для проверки наличия комментария в первой строке файлов с расширением `.c`, `.js` и `.py`.

**План:** пройти по всем файлам с этими расширениями — взять первую строку — проверить, начинается ли она с `//`, `#` или `/*`.

**Создание тестовых файлов:**

```bash
cat > hello.c << 'EOF'
// комментарий
int main() { return 0; }
EOF

cat > script.js << 'EOF'
// комментарий
console.log("hi");
EOF

cat > test.py << 'EOF'
# комментарий
print("hi")
EOF

cat > no_comment.c << 'EOF'
int main() { return 0; }
EOF
```

**Код (task6.sh):**

```bash
#!/bin/bash
for file in *.{c,js,py}; do
    [ -f "$file" ] || continue
    first=$(head -n1 "$file")
    case "$first" in
        //*|#*|/\**) echo "$file: есть комментарий" ;;
        *) echo "$file: нет комментария" ;;
    esac
done
```

**Вывод:**

```
hello.c: есть комментарий
no_comment.c: нет комментария
script.js: есть комментарий
test.py: есть комментарий
```

`head -n1` берёт первую строку файла. `case` проверяет, начинается ли она с `//` (C/JS), `#` (Python) или `/*` (C).
