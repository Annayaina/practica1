#!/bin/bash
grep -o '^[^:]*' /etc/passwd | sort
# Результат работы:
# bin
# daemon
# root
# sys
