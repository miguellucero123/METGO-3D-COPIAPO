# 🎯 Crear Repositorio "marca-personal"

## 📋 Pasos para Crear el Repositorio

### PASO 1: Crear Repositorio en GitHub

1. **Ve a GitHub:**
   ```
   https://github.com/new
   ```

2. **Configura el repositorio:**
   - **Repository name**: `marca-personal` (sin espacios, con guión)
   - **Description**: "Marca Personal - Proyecto Meteorológico"
   - **Visibility**: ✅ **Público** (importante para GitHub Pages)
   - ❌ NO marques "Add a README file"
   - ❌ NO marques "Add .gitignore" (ya tienes uno)
   - ❌ NO marques "Choose a license"

3. **Haz clic en "Create repository"**

---

### PASO 2: Conectar tu Repositorio Local

Después de crear el repositorio en GitHub, ejecuta estos comandos:

```bash
# Remover el remoto antiguo (si existe)
git remote remove origin

# Agregar el nuevo remoto
git remote add origin https://github.com/miguellucero123/marca-personal.git

# Verificar que está conectado
git remote -v

# Subir todos los archivos
git push -u origin master
```

Si tu rama se llama `main` en lugar de `master`:
```bash
git push -u origin main
```

---

### PASO 3: Activar GitHub Pages

1. Ve a: https://github.com/miguellucero123/marca-personal/settings/pages
2. Configura:
   - **Source**: Deploy from a branch
   - **Branch**: master (o main)
   - **Folder**: / (root)
   - Click en **"Save"**

3. Espera 2-5 minutos

4. Tu sitio estará en:
   ```
   https://miguellucero123.github.io/marca-personal/
   ```

---

## ✅ Checklist

- [ ] Repositorio `marca-personal` creado en GitHub
- [ ] Repositorio es **PÚBLICO**
- [ ] Remoto conectado (`git remote add origin`)
- [ ] Archivos subidos (`git push`)
- [ ] GitHub Pages activado
- [ ] Sitio funcionando

---

## 🎯 Comandos Completos (Copia y Pega)

```bash
# 1. Remover remoto antiguo
git remote remove origin

# 2. Agregar nuevo remoto
git remote add origin https://github.com/miguellucero123/marca-personal.git

# 3. Verificar
git remote -v

# 4. Subir archivos
git push -u origin master
```

---

## 📝 Nota sobre el Nombre

GitHub no permite espacios en nombres de repositorios, por eso usamos:
- `marca-personal` ✅ (correcto)
- `marca personal` ❌ (no funciona)

---

## 🔗 URLs Importantes

**Repositorio:**
```
https://github.com/miguellucero123/marca-personal
```

**Sitio Web (después de activar Pages):**
```
https://miguellucero123.github.io/marca-personal/
```

---

**¡Crea el repositorio en GitHub y luego ejecuta los comandos para conectarlo!** 🚀

