
#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Uso: $0 direccion_IP"
    exit 1
fi

ip="$1"

re='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'

if [[ $ip =~ $re ]]; then
    echo "$ip tiene formato de IP"
else
    echo "$ip no tiene formato de IP"
fi

# Pregunta: 999.999.999.999 tiene formato correcto para este script,
# porque tiene cuatro bloques de entre 1 y 3 cifras.
# Pero no es una IP válida, porque cada bloque debe estar entre 0 y 255.

