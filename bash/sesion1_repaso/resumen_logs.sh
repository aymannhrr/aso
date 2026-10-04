#!/usr/bin/env bash

# ==============================================================================
# Script: resumen_logs.sh
# Descripción: Muestra un resumen del número de WARNINGs y ERRORs en ficheros .log.
# Uso: ./resumen_logs.sh <directorio>
# ==============================================================================

# Comprobación de argumentos
if [ -z "$1" ]; then
    echo "Error: Debes especificar un directorio."
    echo "Uso: $0 <directorio>"
    exit 1
fi

CARPETA="$1"

# Verificar si el directorio existe
if [ ! -d "$CARPETA" ]; then
    echo "Error: El directorio '$CARPETA' no existe."
    exit 1
fi

# Recorrer todos los ficheros .log del directorio especificado
for f_log in "$CARPETA"/*.log; do
    # Control por si no hay ningún archivo .log en el directorio
    if [ ! -f "$f_log" ]; then
        echo "No se encontraron archivos .log en '$CARPETA'."
        break
    fi

    NOMBRE_LOG=$(basename "$f_log")
    
    # Contar ocurrencias asegurando que grep no provoque un error si da 0 coincidencias
    WARNS=$(grep -c "WARNING" "$f_log" 2>/dev/null || true)
    ERRS=$(grep -c "ERROR" "$f_log" 2>/dev/null || true)

    echo "• $NOMBRE_LOG"
    echo "$WARNS WARNING, $ERRS ERROR"
done

exit 0

# ==============================================================================
# AMPLIACIÓN (Explicación para nota máxima):
#
# Al ejecutar './resumen_logs.sh ~/prueba_bash', el script solo busca ficheros .log
# en la raíz de la carpeta ~/prueba_bash (por ejemplo, 'sistema.log'). NO lee los
# archivos .log ubicados dentro de subcarpetas como 'datos/' o 'proyecto/entrada/'
# porque la expansión de comodines '$CARPETA/*.log' no es recursiva.
#
# Para un entorno de monitorización real este comportamiento NO es adecuado,
# ya que habitualmente los registros se organizan por subcarpetas. Sería
# preferible realizar una búsqueda recursiva mediante el comando 'find'.
# ==============================================================================
