#!/bin/bash

shell="/bin/bash"
if [ $# -eq 1 ]; then
    shell="$1"
    if ! [[ "$shell" =~ ^(/[a-z]+)+$ ]]; then
        echo "Error: $shell no es una ruta válida" >&2
        exit 1
    fi
elif [ $# -gt 1 ]; then
    echo "Error: Demasiados parámetros" >&2
    exit 1
fi

contador=0
uid_mayores=0

while IFS=':' read -r usuario x uid gid desc home sh; do
    if [ "$sh" = "$shell" ]; then
        echo "$usuario:$uid:$home:$sh"
        contador=$((contador + 1))
        if [ "$uid" -ge 1000 ]; then
            uid_mayores=$((uid_mayores + 1))
        fi
    fi
done < /etc/passwd

echo "Cuentas listadas: $contador"
echo "Con UID >= 1000: $uid_mayores"