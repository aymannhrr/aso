#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 fichero"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero no existe"
    exit 1
fi

sed -E 's/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/X.X.X.X/g' "$1" > "$1.anonimo"

echo "Fichero anonimizado: $1.anonimo"
