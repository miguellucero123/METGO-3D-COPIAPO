#!/bin/bash

# Script para subir el proyecto a GitHub
# Usuario: miguellucero123

echo "🚀 Script para subir proyecto a GitHub"
echo "========================================"
echo ""

# Verificar que estamos en un repositorio git
if [ ! -d ".git" ]; then
    echo "❌ Error: No se encontró un repositorio git. Ejecuta 'git init' primero."
    exit 1
fi

# Verificar el estado
echo "📋 Estado actual del repositorio:"
git status
echo ""

# Solicitar el nombre del repositorio
echo "📝 Ingresa el nombre del repositorio en GitHub:"
read -r REPO_NAME

if [ -z "$REPO_NAME" ]; then
    echo "❌ Error: Debes ingresar un nombre de repositorio"
    exit 1
fi

# URL del repositorio
REPO_URL="https://github.com/miguellucero123/${REPO_NAME}.git"

echo ""
echo "📦 Configurando el repositorio remoto..."
echo "URL: ${REPO_URL}"
echo ""

# Verificar si ya existe un remoto origin
if git remote get-url origin &>/dev/null; then
    echo "⚠️  Ya existe un remoto 'origin'. ¿Quieres actualizarlo? (s/n)"
    read -r respuesta
    if [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]; then
        git remote set-url origin "$REPO_URL"
        echo "✅ Remoto actualizado"
    else
        echo "ℹ️  Manteniendo el remoto existente"
        REPO_URL=$(git remote get-url origin)
    fi
else
    git remote add origin "$REPO_URL"
    echo "✅ Remoto agregado"
fi

echo ""
echo "🌿 Verificando la rama principal..."

# Intentar cambiar a main si existe master
if git branch | grep -q "master"; then
    echo "⚠️  Encontrada rama 'master'. ¿Quieres renombrarla a 'main'? (s/n)"
    read -r respuesta
    if [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]; then
        git branch -M main
        CURRENT_BRANCH="main"
        echo "✅ Rama renombrada a 'main'"
    else
        CURRENT_BRANCH="master"
        echo "ℹ️  Manteniendo rama 'master'"
    fi
else
    CURRENT_BRANCH=$(git branch --show-current)
    echo "ℹ️  Rama actual: ${CURRENT_BRANCH}"
fi

echo ""
echo "📤 ¿Estás listo para subir el código a GitHub? (s/n)"
read -r respuesta

if [ "$respuesta" = "s" ] || [ "$respuesta" = "S" ]; then
    echo ""
    echo "⬆️  Subiendo código a GitHub..."
    git push -u origin "$CURRENT_BRANCH"
    
    if [ $? -eq 0 ]; then
        echo ""
        echo "✅ ¡Éxito! Tu código ha sido subido a GitHub"
        echo "🔗 Visita: ${REPO_URL}"
    else
        echo ""
        echo "❌ Error al subir el código. Verifica:"
        echo "   1. Que el repositorio existe en GitHub"
        echo "   2. Que tienes permisos de escritura"
        echo "   3. Que tu autenticación está configurada correctamente"
        echo ""
        echo "💡 Tip: Si necesitas autenticarte, puedes usar:"
        echo "   - Personal Access Token (PAT)"
        echo "   - SSH keys"
    fi
else
    echo "ℹ️  Operación cancelada"
    echo ""
    echo "Para subir manualmente, ejecuta:"
    echo "  git push -u origin ${CURRENT_BRANCH}"
fi

