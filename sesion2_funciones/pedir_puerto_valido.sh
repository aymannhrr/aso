pedir_puerto_valido() {
    while true; do
        read -p "Introduce un puerto TCP: " puerto
        if [[ $puerto =~ ^[0-9]+$ ]] && (( puerto >= 1 && puerto <= 65535 )); then
            break
        else
            echo "Puerto no válido. Debe ser un número entre 1 y 65535."
        fi
    done
}
pedir_puerto_valido
echo "Puerto válido recibido: $puerto"
