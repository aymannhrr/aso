#!/bin/bash

fichero=${1:-/etc/login.defs}

if [ ! -f "$fichero" ]; then
    echo "Error: el fichero no existe."
    exit 1
fi

total=0
utiles=0

while read -r linea || [ -n "$linea" ]; do
    total=$((total + 1))

    if [[ $linea =~ ^[[:space:]]*# ]] || [[ $linea =~ ^[[:space:]]*$ ]]; then
        continue
    fi

    echo "$linea"
    utiles=$((utiles + 1))

done < "$fichero"

echo "----"
echo "Líneas totales: $total"
echo "Líneas útiles: $utiles"

# PASS_MAX_DAYS indica el número máximo de días que una contraseña puede utilizarse.
# Un valor de 99999 no me parece seguro, porque permite mantener la misma contraseña
# durante demasiado tiempo sin obligar al usuario a cambiarla.
