# Corrección de Caracteres Corruptos en Commits Y Nombres de Archivos

## Problema
Tanto los mensajes de commit como algunos nombres de archivos aparecen con caracteres corruptos en GitHub:
- `AÃ±adir` en lugar de `Añadir`
- `guÃa` en lugar de `guía`
- `pÃºblico` en lugar de `público`
- `espaÃ±ol` en lugar de `español`

Los archivos localmente se ven bien, pero en GitHub aparecen corruptos.

## Solución

### Opción 1: Script Automático (Recomendado)
He creado el script `corregir-todo.sh` que corrige automáticamente:
1. Todos los mensajes de commit
2. Todos los nombres de archivos en el historial

**Pasos:**
1. Abre Git Bash
2. Navega al repositorio:
   ```bash
   cd /c/Users/Alicia_Piero/Documents/Repo_AIEP/Bootcamp_DEV/Ejercicios
   ```
3. Ejecuta el script:
   ```bash
   bash corregir-todo.sh
   ```
4. Espera a que termine (puede tomar varios minutos)
5. Verifica que todo se vea correcto
6. Haz force push:
   ```bash
   git push --force --all
   ```

### Opción 2: Solo Mensajes de Commit
Si solo quieres corregir los mensajes de commit, usa:
```bash
bash corregir-commits.sh
```

### Opción 3: Corregir Manualmente Nombres de Archivos Específicos
Si solo algunos archivos tienen problemas, puedes renombrarlos:

```bash
# Para un archivo específico
git mv "nombre_viejo_con_caracteres_corruptos.txt" "nombre_correcto.txt"
git commit -m "Corregir nombre de archivo"
```

## Verificación

Después de ejecutar los scripts, verifica:

```bash
# Ver commits corregidos
git log --oneline -10

# Ver nombres de archivos actuales
git ls-files

# Buscar posibles archivos con problemas
git ls-files | grep -i "AÃ\|guÃ\|pÃ"
```

## Advertencia
⚠️ **REESCRIBIR EL HISTORIAL REQUIERE FORCE PUSH**
- Solo hazlo si es un repositorio personal o tienes permiso
- Informa a otros colaboradores antes de hacer force push
- Haz un backup antes de reescribir el historial
