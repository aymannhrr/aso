#!/bin/bash

mostrar_error() {
    echo "Error: $1" >&2
    echo "Uso: $0 alta | baja identificador" >&2
    exit 1
}

generar_id() {
    local nombre="$1"
    local apellido1="$2"
    local apellido2="$3"
    
    local l_nom=$(echo "$nombre" | tr 'A-Z' 'a-z' | cut -c1-2)
    local l_ape1=$(echo "$apellido1" | tr 'A-Z' 'a-z' | cut -c1-2)
    local l_ape2=$(echo "$apellido2" | tr 'A-Z' 'a-z' | cut -c1-1)
    
    echo "alu${l_nom}${l_ape1}${l_ape2}"
}

if [ $# -lt 1 ]; then
    mostrar_error "falta la acción"
fi

accion="$1"

if [ "$accion" = "alta" ]; then
    read -p "Nombre: " nombre
    read -p "Apellidos: " apellidos

    if ! [[ "$nombre" =~ ^[a-zA-Z]+$ ]]; then
        mostrar_error "el nombre debe ser una sola palabra formada por letras"
    fi

    if ! [[ "$apellidos" =~ ^[a-zA-Z]+\ [a-zA-Z]+$ ]]; then
        mostrar_error "escribe los dos apellidos separados por un espacio"
    fi

    primer_apellido=$(echo "$apellidos" | cut -d' ' -f1)
    segundo_apellido=$(echo "$apellidos" | cut -d' ' -f2)

    id_generado=$(generar_id "$nombre" "$primer_apellido" "$segundo_apellido")
    echo "Identificador generado: $id_generado"

    if id "$id_generado" &>/dev/null; then
        echo "Error: el usuario $id_generado ya existe" >&2
        exit 1
    else
        echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$nombre $apellidos\" $id_generado"
    fi

elif [ "$accion" = "baja" ]; then
    if [ $# -lt 2 ]; then
        mostrar_error "falta el identificador"
    fi
    identificador="$2"

    if ! [[ "$identificador" =~ ^alu[a-z]{5}$ ]]; then
        mostrar_error "$identificador no tiene el formato aluXXYYZ"
    fi

    if ! id "$identificador" &>/dev/null; then
        echo "Error: el usuario $identificador no existe" >&2
        exit 1
    fi

    echo "Para eliminarlo: sudo userdel $identificador"

else
    mostrar_error "la acción $accion no es válida"
fi