# 🔧 Corregir Autor de Commits (TuUsuario → miguellucero123)

Si en algún commit anterior usaste "TuUsuario" o un nombre incorrecto, aquí te muestro cómo corregirlo.

---

## 🔍 Paso 1: Verificar si hay commits con autor incorrecto

Ejecuta este comando para ver todos los autores de tus commits:

```bash
git log --all --pretty=format:"%h - %an (%ae) : %s"
```

Si encuentras commits con "TuUsuario" u otro nombre incorrecto, continúa con los siguientes pasos.

---

## ✅ Solución: Cambiar Autor de Commits Anteriores

### Opción A: Cambiar todos los commits del repositorio (Método Completo)

Este método cambia TODOS los commits que tengan el autor especificado.

#### En Git Bash o Terminal:

```bash
# Cambiar el autor de todos los commits que tengan "TuUsuario"
git filter-branch --env-filter '
if [ "$GIT_AUTHOR_NAME" = "TuUsuario" ]; then
    export GIT_AUTHOR_NAME="miguellucero123"
    export GIT_AUTHOR_EMAIL="miguellucerogatica@gmail.com"
fi
if [ "$GIT_COMMITTER_NAME" = "TuUsuario" ]; then
    export GIT_COMMITTER_NAME="miguellucero123"
    export GIT_COMMITTER_EMAIL="miguellucerogatica@gmail.com"
fi
' --tag-name-filter cat -- --branches --tags
```

#### Limpiar referencias de backup:

```bash
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d
git reflog expire --expire=now --all
git gc --prune=now --aggressive
```

#### Verificar cambios:

```bash
git log --pretty=format:"%h - %an (%ae) : %s" -10
```

---

### Opción B: Cambiar el último commit (solo si es el último)

Si solo el último commit tiene el autor incorrecto:

```bash
git commit --amend --author="miguellucero123 <miguellucerogatica@gmail.com>" --no-edit
```

---

### Opción C: Usar el Script Automático

He creado un script que hace todo automáticamente:

1. Abre **Git Bash** en la carpeta del proyecto
2. Haz el script ejecutable:
   ```bash
   chmod +x corregir_autor_commits.sh
   ```
3. Ejecútalo:
   ```bash
   ./corregir_autor_commits.sh
   ```

---

## ⚠️ IMPORTANTE: Si ya subiste a GitHub

Si ya habías publicado el repositorio en GitHub con los commits incorrectos, necesitas hacer un **push forzado**:

```bash
git push --force
```

**⚠️ ADVERTENCIA**: 
- `git push --force` sobrescribe el historial en GitHub
- Si alguien más está trabajando en el repositorio, puede causar problemas
- Úsalo solo si es tu repositorio personal o si todos están de acuerdo

---

## 🎯 Opción Más Segura: Solo cambiar commits futuros

Si prefieres no tocar el historial (especialmente si ya está en GitHub):

1. **Asegúrate de que Git está configurado correctamente para el futuro:**

```bash
git config --global user.name "miguellucero123"
git config --global user.email "miguellucerogatica@gmail.com"
```

2. Todos los commits nuevos tendrán el autor correcto.

3. Los commits antiguos con "TuUsuario" se quedarán en el historial, pero al menos los nuevos serán correctos.

---

## 🔍 Verificar Configuración Actual

Para ver tu configuración actual:

```bash
git config user.name
git config user.email

# Ver todos los commits con sus autores
git log --pretty=format:"%h - %an (%ae) : %s"
```

---

## 📝 Cambiar Solo para Este Repositorio

Si solo quieres cambiar la configuración para este repositorio específico (no globalmente):

```bash
git config user.name "miguellucero123"
git config user.email "miguellucerogatica@gmail.com"
```

(Sin el flag `--global`)

---

## 🖥️ Con GitHub Desktop

Si usas GitHub Desktop:

1. Abre GitHub Desktop
2. Ve a **File** → **Options** → **Git**
3. Verifica que:
   - **Name**: miguellucero123
   - **Email**: miguellucerogatica@gmail.com
4. Los commits futuros tendrán el autor correcto

---

## ✅ Verificar Después de Corregir

```bash
# Ver los últimos 10 commits con sus autores
git log --pretty=format:"%h - %an (%ae) : %s" -10

# Contar commits por autor
git log --pretty=format:"%an" | sort | uniq -c
```

---

**¿Necesitas ayuda con algún paso específico?** Pregúntame y te guío paso a paso.

