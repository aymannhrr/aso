#!/bin/bash

contador=0
re='bash$'

while read -r linea; do
    if [[ $linea =~ $re ]]; then
        usuario=${linea%%:*}
        echo "$usuario"
        contador=$((contador + 1))
    fi
done < /etc/passwd

echo "----"
echo "Usuarios con bash: $contador"
