# 🖥️ Guía para Subir el Proyecto con GitHub Desktop

GitHub Desktop es la forma más fácil y visual de subir tu proyecto a GitHub.

---

## 📥 Paso 1: Instalar GitHub Desktop

Si no lo tienes instalado:

1. Ve a [https://desktop.github.com/](https://desktop.github.com/)
2. Descarga GitHub Desktop para Windows
3. Instálalo y ábrelo
4. Inicia sesión con tu cuenta de GitHub: **miguellucero123**

---

## 📂 Paso 2: Abrir el Proyecto en GitHub Desktop

### Opción A: Si el repositorio ya está inicializado (tu caso)

1. Abre GitHub Desktop
2. Haz clic en **"File"** → **"Add local repository"**
3. Haz clic en **"Choose..."** y selecciona la carpeta:
   ```
   C:\Users\Alicia_Piero\Documents\Repo_AIEP\Bootcamp_DEV\Ejercicios
   ```
4. GitHub Desktop detectará automáticamente que es un repositorio Git
5. Haz clic en **"Add repository"**

### Opción B: Si GitHub Desktop no detecta el repositorio

1. En GitHub Desktop, haz clic en **"File"** → **"Add local repository"**
2. Haz clic en **"Create a repository"** (en la parte inferior)
3. Completa:
   - **Name**: `Ejercicios-Bootcamp-DEV` (o el nombre que prefieras)
   - **Local path**: Selecciona la carpeta del proyecto
   - **Initialize this repository with a README**: ❌ NO marques esto (ya tienes archivos)
   - **Git ignore**: Ya tienes `.gitignore`, así que deja "None"
4. Haz clic en **"Create repository"**

---

## 📋 Paso 3: Ver el Estado del Repositorio

Una vez agregado, verás:

- **A la izquierda**: Todos tus archivos que están listos para commit
- **En la parte inferior**: Un campo para escribir el mensaje del commit
- **Cambios pendientes**: Si hay algún cambio nuevo que no esté commiteado

Si ves archivos en la lista, significa que necesitas hacer commit de ellos primero.

---

## ✅ Paso 4: Hacer Commit (si hay cambios pendientes)

1. En la parte inferior izquierda, verás todos los archivos
2. Puedes revisar los cambios haciendo clic en cada archivo
3. En la parte inferior, escribe un mensaje de commit, por ejemplo:
   ```
   Initial commit: Ejercicios Bootcamp DEV
   ```
4. Haz clic en **"Commit to master"** (o "Commit to main")

---

## 🚀 Paso 5: Publicar el Repositorio en GitHub

### Si es la primera vez que subes:

1. En la parte superior de GitHub Desktop, verás un botón que dice **"Publish repository"**
2. Haz clic en ese botón
3. Se abrirá una ventana donde puedes configurar:
   - **Name**: El nombre que tendrá en GitHub (ej: `Ejercicios-Bootcamp-DEV`)
   - **Description**: Descripción opcional (ej: "Ejercicios y proyectos del Bootcamp DEV")
   - **Keep this code private**: ✅ Marca si quieres que sea privado, ❌ Desmarca si quieres público
4. Haz clic en **"Publish repository"**

### Si el repositorio ya está publicado:

1. Si ya tienes un repositorio en GitHub creado manualmente:
   - Haz clic en **"Repository"** → **"Repository settings"**
   - En la pestaña **"Remote"**, agrega la URL:
     ```
     https://github.com/miguellucero123/NOMBRE_DE_TU_REPO.git
     ```
2. Luego haz clic en el botón **"Push origin"** (arriba)

---

## 📤 Paso 6: Subir Cambios Futuros

Cada vez que hagas cambios en tu proyecto:

1. Abre GitHub Desktop
2. Verás tus cambios en la lista de la izquierda
3. Escribe un mensaje de commit descriptivo
4. Haz clic en **"Commit to master/main"**
5. Haz clic en **"Push origin"** (arriba) para subir los cambios a GitHub

---

## 🎯 Pasos Rápidos Resumidos

```
1. Instala GitHub Desktop → Inicia sesión con miguellucero123
2. File → Add local repository → Selecciona la carpeta del proyecto
3. Si ves cambios pendientes → Escribe mensaje → Commit to master
4. Click en "Publish repository" → Configura nombre y privacidad → Publish
5. ¡Listo! Tu código está en GitHub
```

---

## 💡 Ventajas de GitHub Desktop

✅ **Interfaz visual** - No necesitas recordar comandos  
✅ **Historial gráfico** - Ves todos tus commits visualmente  
✅ **Diffs visuales** - Ves los cambios línea por línea  
✅ **Manejo de branches** - Crear y cambiar ramas fácilmente  
✅ **Sincronización** - Pull y push con un solo clic  
✅ **Conflictos** - Resolver conflictos de forma visual  

---

## 🔍 Verificar que Funcionó

Después de publicar, puedes:

1. Visitar tu repositorio en GitHub:
   ```
   https://github.com/miguellucero123/Ejercicios-Bootcamp-DEV
   ```
   (Reemplaza con el nombre que elegiste)

2. Deberías ver todos tus archivos allí

---

## ❓ Solución de Problemas

### "No se puede publicar porque hay cambios sin commit"

**Solución**: Haz commit de todos los archivos primero (Paso 4)

### "El repositorio ya existe en GitHub"

**Solución**: 
- Ve a **"Repository"** → **"Repository settings"** → **"Remote"**
- Agrega la URL del repositorio existente
- Haz clic en **"Push origin"**

### "No puedo iniciar sesión"

**Solución**: 
- Ve a **"File"** → **"Options"** → **"Accounts"**
- Inicia sesión nuevamente o agrega tu cuenta

---

## 📸 Capturas de Pantalla (Referencia)

**Ubicación de los botones principales:**
- **Publish repository**: Parte superior, cerca del centro
- **Push origin**: Parte superior, después de hacer commit
- **Commit to master**: Parte inferior izquierda
- **Add local repository**: File → Add local repository

---

¡GitHub Desktop hace todo mucho más fácil! 🎉

