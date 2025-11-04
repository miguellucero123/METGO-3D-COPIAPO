# Script para corregir caracteres corruptos en mensajes de commit
# Este script requiere reescribir el historial y hacer force push

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Diccionario de reemplazos
$reemplazos = @{
    'AÃ±adir' = 'Añadir'
    'guÃa' = 'guía'
    'pÃºblico' = 'público'
    'rÃ¡pida' = 'rápida'
    'soluciÃ³n' = 'solución'
    'especÃ­fica' = 'específica'
    'espaÃ±ol' = 'español'
    'informaciÃ³n' = 'información'
}

Write-Host "Este script corregirá los mensajes de commit con caracteres corruptos" -ForegroundColor Yellow
Write-Host "ADVERTENCIA: Esto reescribirá el historial y requerirá force push" -ForegroundColor Red
Write-Host ""
$confirmacion = Read-Host "¿Deseas continuar? (s/n)"

if ($confirmacion -ne 's' -and $confirmacion -ne 'S') {
    Write-Host "Operación cancelada" -ForegroundColor Yellow
    exit
}

# Obtener todos los commits
$commits = git log --oneline --all --reverse | ForEach-Object {
    $parts = $_ -split ' ', 2
    @{
        Hash = $parts[0]
        Message = $parts[1]
    }
}

Write-Host "`nEncontrados $($commits.Count) commits" -ForegroundColor Cyan

# Filtrar commits que necesitan corrección
$commitsACorregir = $commits | Where-Object {
    $mensaje = $_.Message
    $necesitaCorreccion = $false
    foreach ($key in $reemplazos.Keys) {
        if ($mensaje -match [regex]::Escape($key)) {
            $necesitaCorreccion = $true
            break
        }
    }
    $necesitaCorreccion
}

if ($commitsACorregir.Count -eq 0) {
    Write-Host "No se encontraron commits que necesiten corrección" -ForegroundColor Green
    exit
}

Write-Host "Se corregirán $($commitsACorregir.Count) commits" -ForegroundColor Cyan

# Corregir mensajes usando git filter-branch con un script de filtro
$scriptFiltro = @'
$mensaje = $input
'@

foreach ($key in $reemplazos.Keys) {
    $scriptFiltro += "`n`$mensaje = `$mensaje -replace '$key', '$($reemplazos[$key])'"
}

$scriptFiltro += "`nWrite-Output `$mensaje"

$scriptFiltro | Out-File -FilePath "fix-message.ps1" -Encoding UTF8

Write-Host "`nEjecutando git filter-branch..." -ForegroundColor Cyan
$env:FILTER_BRANCH_SQUELCH_WARNING = "1"

git filter-branch -f --msg-filter "powershell -File fix-message.ps1" -- --all

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n¡Corrección completada!" -ForegroundColor Green
    Write-Host "`nAhora necesitas hacer force push:" -ForegroundColor Yellow
    Write-Host "git push --force --all" -ForegroundColor Cyan
    Remove-Item "fix-message.ps1" -ErrorAction SilentlyContinue
} else {
    Write-Host "`nError al ejecutar filter-branch" -ForegroundColor Red
    Remove-Item "fix-message.ps1" -ErrorAction SilentlyContinue
}
