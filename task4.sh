grep -oE '\b[A-Za-z_][A-Za-z0-9_]*\b' "$1" | sort -u
# Результат работы (для файла hello.c):
# h
# hello
# include
# int
# main
# n
# printf
# return
# stdio
# void
# world
