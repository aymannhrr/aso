#!/bin/bash

re='^[a-z][a-z0-9]*$'

while true; do
    read -p "Nombre de usuario: " login

    if [[ $login =~ $re ]]; then
        break
    else
        echo "No es válido. Debe empezar por minúscula y tener solo minúsculas o dígitos."
    fi
done

if grep -q "^$login:" /etc/passwd; then
    echo "El usuario $login ya existe."
else
    echo "Para crearlo: sudo useradd -m -s /bin/bash $login"
fi
