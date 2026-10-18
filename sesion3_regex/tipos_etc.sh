#!/bin/bash

conf=0
copias=0

echo "Ficheros de configuración:"

for fichero in /etc/*; do
    nombre=${fichero##*/}

    if [[ $nombre =~ \.conf$ ]]; then
        echo "$fichero"
        conf=$((conf + 1))
    fi

    if [[ $nombre =~ \.bak$ ]] || [[ $nombre =~ \~$ ]]; then
        copias=$((copias + 1))
    fi
done

echo "----"
echo "Configuración: $conf"
echo "Copias de seguridad: $copias"
