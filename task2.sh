#!/bin/bash
grep -v '^#' /etc/protocols | awk '{print $2, $1}' | sort -rn | head -5
