# 🐚 Guía para Subir a GitHub usando Bash

## 📋 Opción 1: Usar el Script Automático

Si tienes **Git Bash** instalado (viene con Git), puedes ejecutar el script automático:

```bash
# Hacer el script ejecutable (en Git Bash)
chmod +x subir_github.sh

# Ejecutar el script
./subir_github.sh
```

El script te preguntará el nombre del repositorio y te guiará paso a paso.

---

## 📋 Opción 2: Comandos Bash Manuales

Si prefieres ejecutar los comandos manualmente, abre **Git Bash** en la carpeta del proyecto y ejecuta:

### Paso 1: Verificar el estado
```bash
git status
```

### Paso 2: Crear el repositorio en GitHub
1. Ve a [https://github.com/new](https://github.com/new)
2. Nombre del repositorio: `Ejercicios-Bootcamp-DEV` (o el que prefieras)
3. **NO inicialices con README**
4. Haz clic en "Create repository"

### Paso 3: Conectar y subir
```bash
# Agregar el remoto (reemplaza NOMBRE_REPO con el nombre real)
git remote add origin https://github.com/miguellucero123/NOMBRE_REPO.git

# Verificar tu rama actual
git branch --show-current

# Si es "master" y quieres cambiar a "main"
git branch -M main

# Subir el código (usa "main" o "master" según corresponda)
git push -u origin main
# O si tu rama es "master":
# git push -u origin master
```

---

## 📋 Opción 3: Copiar y Pegar Comandos

También puedes abrir el archivo `comandos_bash_github.txt` y copiar los comandos que necesites (solo recuerda reemplazar `NOMBRE_REPO` con el nombre real).

---

## 🔐 Autenticación

Si GitHub te pide autenticación:

### Opción A: Personal Access Token (PAT)
1. Ve a GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Genera un nuevo token con permisos de `repo`
3. Úsalo como contraseña cuando git te la pida

### Opción B: SSH Keys (recomendado para uso frecuente)
```bash
# Generar clave SSH (si no tienes una)
ssh-keygen -t ed25519 -C "miguellucerogatica@gmail.com"

# Copiar la clave pública
cat ~/.ssh/id_ed25519.pub

# Luego agrega esa clave en GitHub → Settings → SSH and GPG keys
# Y cambia la URL del remoto a SSH:
git remote set-url origin git@github.com:miguellucero123/NOMBRE_REPO.git
```

---

## ✅ Verificar

Después de subir, visita tu repositorio en GitHub:
```
https://github.com/miguellucero123/NOMBRE_REPO
```

¡Deberías ver todos tus archivos ahí!

---

## 📝 Archivos Creados

- `subir_github.sh` - Script automático interactivo
- `comandos_bash_github.txt` - Lista de comandos para copiar
- `LEEME_BASH.md` - Esta guía

