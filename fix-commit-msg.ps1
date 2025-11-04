# Script para corregir caracteres corruptos en mensajes de commit
param([string]$mensaje)

# Diccionario de reemplazos
$mensaje = $mensaje -replace 'AÃ±adir', 'Añadir'
$mensaje = $mensaje -replace 'guÃa', 'guía'
$mensaje = $mensaje -replace 'guÃ­a', 'guía'
$mensaje = $mensaje -replace 'pÃºblico', 'público'
$mensaje = $mensaje -replace 'rÃ¡pida', 'rápida'
$mensaje = $mensaje -replace 'soluciÃ³n', 'solución'
$mensaje = $mensaje -replace 'especÃ­fica', 'específica'
$mensaje = $mensaje -replace 'espaÃ±ol', 'español'
$mensaje = $mensaje -replace 'informaciÃ³n', 'información'

Write-Output $mensaje
