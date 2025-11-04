#!/bin/bash
# Script para corregir caracteres corruptos en mensajes de commit Y nombres de archivos

echo "=========================================="
echo "Corrigiendo commits Y nombres de archivos corruptos"
echo "=========================================="
echo ""

# Ir al directorio del repositorio
cd "/c/Users/Alicia_Piero/Documents/Repo_AIEP/Bootcamp_DEV/Ejercicios" || exit

echo "Paso 1: Corrigiendo mensajes de commit..."
echo "Esto puede tomar unos minutos..."
echo ""

# Corrección de mensajes de commit
FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --msg-filter 'sed -e "s/AÃ±adir/Añadir/g" -e "s/guÃa/guía/g" -e "s/guÃ­a/guía/g" -e "s/pÃºblico/público/g" -e "s/rÃ¡pida/rápida/g" -e "s/soluciÃ³n/solución/g" -e "s/especÃ­fica/específica/g" -e "s/espaÃ±ol/español/g" -e "s/informaciÃ³n/información/g"' -- --all

if [ $? -ne 0 ]; then
    echo "Error al corregir mensajes de commit"
    exit 1
fi

echo ""
echo "Paso 2: Corrigiendo nombres de archivos..."
echo "Buscando archivos con nombres corruptos..."

# Función para corregir nombres de archivos
fix_filename() {
    local old_name="$1"
    local new_name=$(echo "$old_name" | sed -e "s/AÃ±adir/Añadir/g" -e "s/guÃa/guía/g" -e "s/guÃ­a/guía/g" -e "s/pÃºblico/público/g" -e "s/rÃ¡pida/rápida/g" -e "s/soluciÃ³n/solución/g" -e "s/especÃ­fica/específica/g" -e "s/espaÃ±ol/español/g" -e "s/informaciÃ³n/información/g")
    
    if [ "$old_name" != "$new_name" ]; then
        echo "Renombrando: $old_name -> $new_name"
        git filter-branch -f --tree-filter "if [ -f \"$old_name\" ] || [ -d \"$old_name\" ]; then git mv \"$old_name\" \"$new_name\" 2>/dev/null || true; fi" -- --all
    fi
}

# Obtener lista de archivos únicos en el historial
echo "Analizando historial de archivos..."
git log --all --name-only --pretty=format: | sort -u | while read -r file; do
    if [ -n "$file" ] && echo "$file" | grep -qE "(AÃ|guÃ|pÃ|espaÃ|informaciÃ)"; then
        fix_filename "$file"
    fi
done

echo ""
echo "=========================================="
echo "¡Corrección completada!"
echo "=========================================="
echo ""
echo "Verificando los cambios (últimos 10 commits):"
git log --oneline -10
echo ""
echo "Verificando nombres de archivos actuales:"
git ls-files | head -20
echo ""
echo "Si todo se ve correcto, ejecuta:"
echo "  git push --force --all"
echo ""
echo "ADVERTENCIA: El force push reescribirá el historial en GitHub."
echo "Solo hazlo si es tu repositorio personal o tienes permiso."
