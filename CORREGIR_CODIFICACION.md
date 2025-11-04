# Corrección de Caracteres Corruptos en Commits

## Problema
Los mensajes de commit tienen caracteres corruptos como:
- `AÃ±adir` en lugar de `Añadir`
- `guÃa` en lugar de `guía`
- `pÃºblico` en lugar de `público`
- `espaÃ±ol` en lugar de `español`

## Solución Recomendada

### Opción 1: Usar Git Bash (Recomendado)
1. Abre Git Bash (no PowerShell)
2. Navega al repositorio:
   ```bash
   cd /c/Users/Alicia_Piero/Documents/Repo_AIEP/Bootcamp_DEV/Ejercicios
   ```
3. Ejecuta este comando para corregir todos los commits:
   ```bash
   git filter-branch -f --msg-filter 'sed "s/AÃ±adir/Añadir/g; s/guÃa/guía/g; s/pÃºblico/público/g; s/rÃ¡pida/rápida/g; s/soluciÃ³n/solución/g; s/especÃ­fica/específica/g; s/espaÃ±ol/español/g; s/informaciÃ³n/información/g"' -- --all
   ```
4. Verifica los cambios:
   ```bash
   git log --oneline -10
   ```
5. Si todo está bien, haz force push:
   ```bash
   git push --force --all
   ```

### Opción 2: Configurar para Futuros Commits (Más Seguro)
Si prefieres no reescribir el historial, solo asegúrate de que futuros commits estén bien:

```powershell
# Configurar Git para usar UTF-8
git config --global i18n.commitencoding utf-8
git config --global i18n.logoutputencoding utf-8
git config --global core.quotepath false

# Configurar PowerShell para UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$PSDefaultParameterValues['*:Encoding'] = 'utf8'
```

## Advertencia
⚠️ **REESCRIBIR EL HISTORIAL REQUIERE FORCE PUSH**
- Solo hazlo si es un repositorio personal o tienes permiso
- Informa a otros colaboradores antes de hacer force push
- Haz un backup antes de reescribir el historial

## Comandos de Verificación
```bash
# Ver commits con problemas
git log --all --format="%s" | grep -i "AÃ\|guÃ\|pÃ"

# Ver configuración actual
git config --get i18n.commitencoding
git config --get i18n.logoutputencoding
```
