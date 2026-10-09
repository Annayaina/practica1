grep -v '^#' /etc/protocols | awk '{print $2, $1}' | sort -rn | head -5
# Результат работы:
# 262 mptcp
# 143 ethernet
# 142 rohc
# 141 wesp
# 140 shim6
