#!/usr/bin/env bash

# ==============================================================================
# Script: nivel_disco.sh
# Descripción: Calcula el porcentaje de uso de disco y muestra el nivel.
# Uso: ./nivel_disco.sh <bytes_usados> <bytes_totales>
# ==============================================================================

# Comprobación de argumentos
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Error: Faltan argumentos."
    echo "Uso: $0 <bytes_usados> <bytes_totales>"
    exit 1
fi

BYTES_USADOS="$1"
BYTES_TOTALES="$2"

# Control de división por cero
if [ "$BYTES_TOTALES" -eq 0 ]; then
    echo "Error: Los bytes totales no pueden ser 0."
    exit 1
fi

# Cálculo del porcentaje usando $(( ))
PORCENTAJE=$(( BYTES_USADOS * 100 / BYTES_TOTALES ))

# Evaluación de condiciones
if [ "$PORCENTAJE" -lt 70 ]; then
    echo "OK"
elif [ "$PORCENTAJE" -le 89 ]; then
    echo "AVISO"
else
    echo "CRÍTICO"
fi

exit 0
