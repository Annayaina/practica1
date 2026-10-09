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
