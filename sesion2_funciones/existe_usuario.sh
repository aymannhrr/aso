existe_usuario() {
    local usuario=$1
    if id "$usuario" &>/dev/null; then
        echo "El usuario $usuario existe en el sistema."
    else
        echo "El usuario $usuario no existe."
    fi
}
