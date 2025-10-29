# Script para verificar el estado de GitHub Pages
Write-Host "Verificando estado de GitHub Pages..." -ForegroundColor Cyan
Write-Host ""

$url = "https://miguellucero123.github.io/METGO-3D-COPIAPO/"

try {
    $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10
    Write-Host "✅ GitHub Pages esta ACTIVO" -ForegroundColor Green
    Write-Host "Codigo HTTP: $($response.StatusCode)" -ForegroundColor Green
    Write-Host "URL: $url" -ForegroundColor Yellow
} catch {
    if ($_.Exception.Response.StatusCode.value__ -eq 404) {
        Write-Host "❌ Error 404: GitHub Pages NO esta activado" -ForegroundColor Red
        Write-Host "" -ForegroundColor Yellow
        Write-Host "Ve a: https://github.com/miguellucero123/METGO-3D-COPIAPO/settings/pages" -ForegroundColor Cyan
    } else {
        Write-Host "❌ Error al acceder: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "Verifica la URL o tu conexion a internet" -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Para activar GitHub Pages:" -ForegroundColor Cyan
Write-Host "1. Ve a Settings -> Pages" -ForegroundColor White
Write-Host "2. Source: Deploy from a branch" -ForegroundColor White
Write-Host "3. Branch: master, Folder: / (root)" -ForegroundColor White
Write-Host "4. Save" -ForegroundColor White

