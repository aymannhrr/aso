#!/usr/bin/env bash

# ==============================================================================
# Script: clasificar_entradas.sh
# Descripción: Recorre todas las entradas de ~/prueba_bash e indica si son
#              ficheros o directorios.
# ==============================================================================

DIRECTORIO="$HOME/prueba_bash"

# Comprobación de existencia del directorio
if [ ! -d "$DIRECTORIO" ]; then
    echo "Error: El directorio $DIRECTORIO no existe."
    exit 1
fi

# Bucle for para recorrer cada elemento dentro del directorio
for entrada in "$DIRECTORIO"/*; do
    # Controlar si el patrón no devuelve ningún archivo válido
    [ -e "$entrada" ] || continue

    NOMBRE=$(basename "$entrada")

    # Condicionales para determinar el tipo de entrada
    if [ -d "$entrada" ]; then
        echo "$NOMBRE directorio"
    elif [ -f "$entrada" ]; then
        echo "$NOMBRE fichero"
    fi
done

exit 0
