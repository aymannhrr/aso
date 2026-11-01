#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 fichero"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero no existe"
    exit 1
fi

sed 's/@gmail\.com\|@hotmail\.com/@alu.edu.gva.es/g' "$1"
