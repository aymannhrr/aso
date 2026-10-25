
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 contraseña"
    exit 1
fi

password="$1"

re_longitud='^.{12,}$'
re_digito='[0-9]'
re_mayuscula='[A-Z]'
re_simbolo='[^[:alnum:]]'

segura=0

if [[ $password =~ $re_longitud ]]; then
    echo " Tiene al menos 12 caracteres: sí"
else
    echo " Tiene al menos 12 caracteres: no"
    segura=1
fi

if [[ $password =~ $re_digito ]]; then
    echo " Contiene algún dígito: sí"
else
    echo " Contiene algún dígito: no"
    segura=1
fi

if [[ $password =~ $re_mayuscula ]]; then
    echo " Contiene alguna mayúscula: sí"
else
    echo " Contiene alguna mayúscula: no"
    segura=1
fi

if [[ $password =~ $re_simbolo ]]; then
    echo " Contiene algún símbolo: sí"
else
    echo " Contiene algún símbolo: no"
    segura=1
fi

if grep -iqxF -- "$password" /usr/share/dict/spanish 2>/dev/null; then
    echo " No es una palabra del diccionario: no"
    segura=1
else
    echo " No es una palabra del diccionario: sí"
fi

if [ "$segura" -eq 0 ]; then
    echo "La contraseña es segura"
else
    echo "La contraseña no es segura"
fi

# Pregunta: aunque Caminas2026! cumple las condiciones del ejercicio,
# no me parece realmente segura. Utiliza una palabra reconocible,
# un año y un símbolo, por lo que podría ser fácil de adivinar.
# Es mejor utilizar una contraseña larga, aleatoria y diferente
# para cada cuenta.


