
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 direccion_MAC"
    exit 1
fi

mac="$1"

re='^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$'

if [[ $mac =~ $re ]]; then
    echo "$mac es una MAC válida"
else
    echo "$mac no es una MAC válida"
fi


