#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Uso: $0 dias"
    exit 1
fi

if ! [[ "$1" =~ ^[0-9]{1,3}$ ]]; then
    echo "Error: $1 no es un número de días válido"
    exit 1
fi

if [ ! -f login.defs ]; then
    echo "Error: no existe login.defs"
    exit 1
fi

antes=$(grep "^PASS_MAX_DAYS" login.defs)

sed -i.bak "s/^PASS_MAX_DAYS.*/PASS_MAX_DAYS   $1/" login.defs

despues=$(grep "^PASS_MAX_DAYS" login.defs)

echo "Antes: $antes"
echo "Después: $despues"
