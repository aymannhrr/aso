
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 correo"
    exit 1
fi

correo="$1"

re='^[a-z0-9._-]+@(edu\.gva\.es|alu\.edu\.gva\.es)$'

if [[ $correo =~ $re ]]; then
    if [[ $correo == *@alu.edu.gva.es ]]; then
        echo "$correo es una cuenta de alumnado"
    else
        echo "$correo es una cuenta de profesorado"
    fi
else
    echo "$correo no es una cuenta educativa"
fi


