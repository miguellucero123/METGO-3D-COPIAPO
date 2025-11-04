#!/bin/bash
# Script para corregir caracteres corruptos en mensajes de commit

echo "=========================================="
echo "Corrigiendo mensajes de commit corruptos"
echo "=========================================="
echo ""

# Ir al directorio del repositorio
cd "/c/Users/Alicia_Piero/Documents/Repo_AIEP/Bootcamp_DEV/Ejercicios" || exit

# Ejecutar git filter-branch
echo "Ejecutando git filter-branch..."
echo "Esto puede tomar unos minutos..."
echo ""

FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f --msg-filter 'sed -e "s/AÃ±adir/Añadir/g" -e "s/guÃa/guía/g" -e "s/guÃ­a/guía/g" -e "s/pÃºblico/público/g" -e "s/rÃ¡pida/rápida/g" -e "s/soluciÃ³n/solución/g" -e "s/especÃ­fica/específica/g" -e "s/espaÃ±ol/español/g" -e "s/informaciÃ³n/información/g"' -- --all

if [ $? -eq 0 ]; then
    echo ""
    echo "=========================================="
    echo "¡Corrección completada!"
    echo "=========================================="
    echo ""
    echo "Verificando los cambios (últimos 10 commits):"
    git log --oneline -10
    echo ""
    echo "Si los mensajes se ven correctos, ejecuta:"
    echo "  git push --force --all"
    echo ""
    echo "ADVERTENCIA: El force push reescribirá el historial en GitHub."
    echo "Solo hazlo si es tu repositorio personal o tienes permiso."
else
    echo ""
    echo "=========================================="
    echo "Error al ejecutar git filter-branch"
    echo "=========================================="
fi
