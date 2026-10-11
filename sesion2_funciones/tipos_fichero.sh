contar_por_extension() {
    local carpeta=$1
    local ext=$2
    find "$carpeta" -maxdepth 1 -type f -name "*.$ext" | wc -l
}

for ext in log txt csv; do
    echo "$ext"
    contar_por_extension "~/prueba_bash/datos" "$ext"
done
