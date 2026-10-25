
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 direccion_IP"
    exit 1
fi

ip="$1"

re_loopback='^127\.'
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'

if [[ $ip =~ $re_loopback ]]; then
    echo "$ip es una dirección loopback"
elif [[ $ip =~ $re_privada ]]; then
    echo "$ip es una dirección privada"
else
    echo "$ip es una dirección pública"
fi

# Pregunta: para comprobar las direcciones 172.16 a 172.31,
# he utilizado una alternancia dentro de un grupo:
# 1[6-9] representa del 16 al 19, 2[0-9] del 20 al 29
# y 3[01] representa el 30 y el 31.
# Así puedo comprobar todo el rango con una sola expresión regular.

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


