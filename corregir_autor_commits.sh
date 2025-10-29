#!/bin/bash

# Script para corregir el autor de commits anteriores
# Cambia "TuUsuario" por "miguellucero123"

echo "🔧 Script para corregir autor de commits"
echo "=========================================="
echo ""

# Verificar que estamos en un repositorio git
if [ ! -d ".git" ]; then
    echo "❌ Error: No se encontró un repositorio git"
    exit 1
fi

# Ver commits actuales
echo "📋 Commits actuales:"
git log --pretty=format:"%h - %an (%ae) : %s" -10
echo ""

# Pedir confirmación
echo "⚠️  Este script cambiará el autor de TODOS los commits que tengan 'TuUsuario'"
echo "¿Quieres continuar? (s/n)"
read -r respuesta

if [ "$respuesta" != "s" ] && [ "$respuesta" != "S" ]; then
    echo "❌ Operación cancelada"
    exit 0
fi

# Nuevo autor y email
NEW_NAME="miguellucero123"
NEW_EMAIL="miguellucerogatica@gmail.com"

# Comando para cambiar autor
git filter-branch --env-filter '
if [ "$GIT_AUTHOR_NAME" = "TuUsuario" ]; then
    export GIT_AUTHOR_NAME="'"$NEW_NAME"'"
    export GIT_AUTHOR_EMAIL="'"$NEW_EMAIL"'"
fi
if [ "$GIT_COMMITTER_NAME" = "TuUsuario" ]; then
    export GIT_COMMITTER_NAME="'"$NEW_NAME"'"
    export GIT_COMMITTER_EMAIL="'"$NEW_EMAIL"'"
fi
' --tag-name-filter cat -- --branches --tags

# Limpiar referencias de backup
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

# Ejecutar garbage collection
git reflog expire --expire=now --all
git gc --prune=now --aggressive

echo ""
echo "✅ ¡Completado! Verifica los cambios:"
git log --pretty=format:"%h - %an (%ae) : %s" -10

echo ""
echo "⚠️  Si ya habías subido el repositorio a GitHub, necesitarás hacer:"
echo "   git push --force"
echo "   (Esto sobrescribirá el historial en GitHub)"

