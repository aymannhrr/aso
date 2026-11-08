#!/bin/bash

destino="/var/backups"
max_copias=7

if [ $# -ge 1 ]; then
    destino="$1"
fi

if [ $# -ge 2 ]; then
    max_copias="$2"
    if ! [[ "$max_copias" =~ ^[0-9]+$ ]]; then
        echo "Error: $max_copias no es un número" >&2
        exit 1
    fi
    if [ "$max_copias" -le 0 ]; then
        echo "Error: el número máximo de copias debe ser mayor que 0" >&2
        exit 1
    fi
fi

if [ $# -gt 2 ]; then
    echo "Error: Demasiados parámetros" >&2
    exit 1
fi

if [ ! -d "$destino" ]; then
    echo "Error: El directorio $destino no existe" >&2
    exit 1
fi

registrar() {
    local mensaje="$1"
    local hora
    hora=$(date +%H:%M:%S)
    echo "$hora $mensaje"
    logger -t aso-backup "$mensaje"
}

fecha=$(date +%Y%m%d-%H%M%S)
fichero_tar="$destino/etc-$fecha.tar.gz"

tar -czf "$fichero_tar" /etc 2>/dev/null
if [ $? -eq 0 ]; then
    registrar "Copia creada: $fichero_tar"
else
    registrar "Error al crear la copia en $fichero_tar"
    exit 1
fi

num_copias=0
for f in "$destino"/*; do
    nombre_fichero=$(basename "$f")
    if [[ "$nombre_fichero" =~ ^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$ ]]; then
        num_copias=$((num_copias + 1))
    fi
done

if [ "$num_copias" -gt "$max_copias" ]; then
    registrar "Aviso: hay $num_copias copias y el máximo recomendado es $max_copias"
fi