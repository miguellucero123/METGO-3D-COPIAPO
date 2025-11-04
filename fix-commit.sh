#!/bin/bash
# Script para corregir caracteres corruptos en mensajes de commit
sed -e 's/AÃ±adir/Añadir/g' \
    -e 's/guÃa/guía/g' \
    -e 's/guÃ­a/guía/g' \
    -e 's/pÃºblico/público/g' \
    -e 's/rÃ¡pida/rápida/g' \
    -e 's/soluciÃ³n/solución/g' \
    -e 's/especÃ­fica/específica/g' \
    -e 's/espaÃ±ol/español/g' \
    -e 's/informaciÃ³n/información/g'
