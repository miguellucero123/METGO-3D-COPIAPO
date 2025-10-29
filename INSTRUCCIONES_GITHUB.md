# 📋 Instrucciones para Subir el Proyecto a GitHub

## ✅ Pasos Completados

- ✅ Repositorio Git inicializado
- ✅ Archivo `.gitignore` creado
- ✅ Commit inicial realizado
- ✅ Problema del repositorio embebido resuelto

## 🚀 Pasos para Subir a GitHub

### 1. Crear el Repositorio en GitHub

1. Ve a [https://github.com](https://github.com)
2. Inicia sesión con tu cuenta: **miguellucero123**
3. Haz clic en el botón **"+"** (arriba a la derecha) → **"New repository"**
4. Completa los siguientes campos:
   - **Repository name**: `Ejercicios-Bootcamp-DEV` (o el nombre que prefieras)
   - **Description**: "Ejercicios y proyectos del Bootcamp DEV - AIEP"
   - **Visibility**: Público o Privado (tú decides)
   - ⚠️ **NO marques** "Initialize this repository with a README" (ya tienes archivos locales)
5. Haz clic en **"Create repository"**

### 2. Conectar tu Repositorio Local con GitHub

Después de crear el repositorio, GitHub te mostrará instrucciones. Ejecuta estos comandos en la terminal (en la carpeta del proyecto):

```bash
# Agregar el remoto de GitHub (reemplaza TU_NOMBRE_USUARIO y TU_REPOSITORIO con tus valores)
git remote add origin https://github.com/miguellucero123/Ejercicios-Bootcamp-DEV.git

# Cambiar el nombre de la rama principal a 'main' (si GitHub lo requiere)
git branch -M main

# Subir tu código a GitHub
git push -u origin main
```

**Si tu rama principal es 'master' en lugar de 'main'**, usa:

```bash
git remote add origin https://github.com/miguellucero123/Ejercicios-Bootcamp-DEV.git
git push -u origin master
```

### 3. Autenticación

Si GitHub te pide autenticación:
- Puedes usar un **Personal Access Token** (PAT)
- O usar **GitHub Desktop** para facilitar el proceso

### 4. Verificar

Una vez completado, ve a tu repositorio en GitHub y verifica que todos los archivos estén ahí.

## 📝 Comandos Útiles para el Futuro

```bash
# Ver el estado de tus archivos
git status

# Agregar todos los cambios
git add .

# Hacer commit
git commit -m "Descripción de los cambios"

# Subir cambios a GitHub
git push
```

## ⚠️ Notas Importantes

- El archivo `.gitignore` ya está configurado para excluir archivos temporales, entornos virtuales, etc.
- Los notebooks de Jupyter están incluidos
- Los archivos HTML generados están incluidos

---

**¿Problemas?** Si encuentras algún error, compártelo y te ayudo a solucionarlo.

