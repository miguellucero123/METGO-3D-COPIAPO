# Script para corregir mensajes de commit con caracteres corruptos
# Requiere git y debe ejecutarse en el directorio del repositorio

$ErrorActionPreference = "Stop"

Write-Host "Corrigiendo mensajes de commit..." -ForegroundColor Yellow

# Mapeo de correcciones
$correcciones = @{
    "AÃ±adir" = "Añadir"
    "guÃ­a" = "guía"
    "guÃa" = "guía"
    "pÃºblico" = "público"
    "informaciÃ³n" = "información"
    "soluciÃ³n" = "solución"
    "especÃ­fica" = "específica"
    "espaÃ±ol" = "español"
    "rÃ¡pida" = "rápida"
}

# Obtener todos los commits que necesitan corrección
$commits = git log --format="%H|%s" --all

$commitsCorregidos = @()
foreach ($commit in $commits) {
    $parts = $commit -split '\|', 2
    if ($parts.Length -eq 2) {
        $hash = $parts[0]
        $mensaje = $parts[1]
        $mensajeCorregido = $mensaje
        
        # Aplicar todas las correcciones
        foreach ($key in $correcciones.Keys) {
            $mensajeCorregido = $mensajeCorregido -replace [regex]::Escape($key), $correcciones[$key]
        }
        
        # Si el mensaje cambió, guardar para corrección
        if ($mensajeCorregido -ne $mensaje) {
            $commitsCorregidos += @{
                Hash = $hash
                Antes = $mensaje
                Despues = $mensajeCorregido
            }
            Write-Host "`nCommit: $hash" -ForegroundColor Cyan
            Write-Host "  Antes: $mensaje" -ForegroundColor Red
            Write-Host "  Después: $mensajeCorregido" -ForegroundColor Green
        }
    }
}

Write-Host "`n`nSe encontraron $($commitsCorregidos.Count) commits que necesitan corrección." -ForegroundColor Yellow
Write-Host "`nPara corregirlos, usa git rebase interactivo o git filter-branch." -ForegroundColor Yellow
Write-Host "Comando sugerido:" -ForegroundColor Cyan
Write-Host "  git rebase -i 984f80a" -ForegroundColor White
Write-Host "`nO usa git filter-repo (requiere instalación):" -ForegroundColor Yellow
Write-Host "  pip install git-filter-repo" -ForegroundColor White
