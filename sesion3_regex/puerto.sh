#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: ./puerto.sh numero"
    exit 1
fi

puerto=$1
re='^[0-9][0-9]*$'

if [[ $puerto =~ $re ]]; then
    if [ "$puerto" -ge 1 ] && [ "$puerto" -le 65535 ]; then
        echo "$puerto es un puerto válido"
    else
        echo "$puerto está fuera de rango (1-65535)"
    fi
else
    echo "$puerto no es un número"
fi
