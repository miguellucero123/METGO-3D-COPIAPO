@echo off
REM Script para abrir weatherlocal_completo.html en el navegador predeterminado

echo ========================================
echo Abriendo weatherlocal_completo.html
echo ========================================
echo.

REM Verificar si el archivo existe
if not exist "weatherlocal_completo.html" (
    echo Error: No se encuentra weatherlocal_completo.html
    echo Asegurate de estar en la carpeta correcta.
    pause
    exit /b 1
)

REM Abrir el archivo en el navegador predeterminado
start "" "weatherlocal_completo.html"

echo.
echo Archivo abierto en el navegador predeterminado.
echo.
pause

