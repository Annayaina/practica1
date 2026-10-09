Практическое занятие №1

Задача 1

Код:
#!/bin/bash
grep -o '^[^:]*' /etc/passwd | sort
<img width="295" height="55" alt="image" src="https://github.com/user-attachments/assets/e4d50ec7-e3d3-4a4a-b14b-57671c7a0e5f" />

Результат:
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


Задача 2

Код:
grep -v '^#' /etc/protocols | awk '{print $2, $1}' | sort -rn | head -5

Результат:
262 mptcp
143 ethernet
142 rohc
141 wesp
140 shim6


Задача 3

Код:
text="$1"
len=${#text}
line=$(printf '+%*s+' "$((len+2))" | tr ' ' '-')
echo "$line"
echo "| $text |"
echo "$line"

Результат:
+-----------------------+
| Hello from RTU MIREA! |
+-----------------------+

Задача 4

Код:
grep -oE '\b[A-Za-z_][A-Za-z0-9_]*\b' "$1" | sort -u

Результат:
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
