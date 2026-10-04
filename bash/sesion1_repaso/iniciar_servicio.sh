#!/usr/bin/env bash

# ==============================================================================
# Script: iniciar_servicio.sh
# Descripción: Recibe un nombre de servicio por parámetro e inicia la acción.
# ==============================================================================

# Comprobación de errores: verificar si se proporcionó un argumento ($1)
if [ -z "$1" ]; then
    echo "Debes indicar el nombre del servicio"
    exit 1
fi

SERVICIO="$1"
echo "Iniciando el servicio ${SERVICIO}..."

exit 0

