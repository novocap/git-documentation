---
name: i18n-mirror-check
description: Validar la sincronización entre docs/es/ y docs/en/. Detecta archivos presentes en un idioma pero no en el otro, y secciones marcadas como TODO en la traducción. Usar después de cualquier cambio en docs/es/ o docs/en/, o antes de pedir la apertura de un PR de traducción.
---

# Skill: i18n-mirror-check

Procedimiento para validar el mirror entre los directorios
`docs/es/` y `docs/en/` del repositorio
`novocap/Novocap.Learning.Git.Docs`.

## Reglas de mirror

1. Por cada archivo en `docs/es/<ruta>.md`, debe existir su espejo en
   `docs/en/<ruta>.md`, salvo que se haya marcado explícitamente como
   no-traducible.
2. Por cada sección (`##`, `###`, `####`) en español, debe existir su
   equivalente en inglés (mismo nivel, mismo orden).
3. Las imágenes y rutas internas deben estar dentro del mismo idioma
   (no linkear de `docs/es/X.md` a `docs/en/Y.md` ni viceversa).
4. Cualquier marcador `<!-- TODO: revisar traducción -->` debe listarse
   en el reporte.

## Comando principal

```bash
# Comparar el árbol de archivos
diff -rq docs/es docs/en | grep -v "^Only in" || echo "Mirror OK"
```

Reemplazar por este script más completo:

```bash
#!/usr/bin/env bash
set -u

ES="docs/es"
EN="docs/en"

echo "=== Mirror check: docs/es/ ↔ docs/en/ ==="

# 1. Archivos en ES que faltan en EN
echo
echo "--- Archivos en ES sin espejo en EN ---"
comm -23 \
  <(cd "$ES" && find . -type f -name "*.md" | sort) \
  <(cd "$EN" && find . -type f -name "*.md" | sort) \
| sed 's|^|  ❌ |'

# 2. Archivos en EN que faltan en ES
echo
echo "--- Archivos en EN sin espejo en ES ---"
comm -13 \
  <(cd "$ES" && find . -type f -name "*.md" | sort) \
  <(cd "$EN" && find . -type f -name "*.md" | sort) \
| sed 's|^|  ❌ |'

# 3. Marcadores TODO de traducción
echo
echo "--- Marcadores TODO en EN ---"
grep -rn "TODO: revisar traducción" "$EN" || echo "  ✅ ninguno"

# 4. Links cruzados entre idiomas
echo
echo "--- Links cruzados entre idiomas (deberían ser 0) ---"
grep -rn "../en/" "$ES" || echo "  ✅ ninguno"
grep -rn "../es/" "$EN" || echo "  ✅ ninguno"

echo
echo "=== Fin del mirror check ==="
```

## Output esperado

```text
=== Mirror check: docs/es/ ↔ docs/en/ ===

--- Archivos en ES sin espejo en EN ---
  ❌ git/index.md
  ❌ git/gpg.md
  ❌ ssh.md

--- Archivos en EN sin espejo en ES ---
  ❌ index.md

--- Marcadores TODO en EN ---
  ✅ ninguno

--- Links cruzados entre idiomas (deberían ser 0) ---
  ✅ ninguno

=== Fin del mirror check ===
```

## Cuándo correrlo

- **Antes de pedir la apertura de un PR de traducción** (Fases 3c, 3d).
- **Después de crear o renombrar un archivo** en `docs/es/` o
  `docs/en/`.
- **Como parte del CI** (en una Fase futura si se quiere automatizar).

## Cuándo falla (qué hacer)

| Hallazgo | Acción |
|---|---|
| Archivo en ES sin espejo en EN | El agente `traductor-en` debe traducirlo en un PR aparte (Fases 3c/3d). |
| Archivo en EN sin espejo en ES | Probablemente un archivo huérfano de la migración. Eliminarlo o crear su contraparte. |
| Marcador `TODO: revisar traducción` | El agente `traductor-en` debe reabrir esa sección y traducirla. |
| Link cruzado entre idiomas | Reemplazar por un link relativo al mismo idioma, o usar URL absoluta con anchor. |

## Reglas para el agente `traductor-en`

1. **Un archivo a la vez.** Crear el archivo en `docs/en/`, traducir,
   correr esta skill, y solo si pasa, commitear.
2. **Si el archivo origen cambió** mientras se traducía, descartar la
   traducción y empezar de nuevo.
3. **Nunca** traducir de memoria: siempre leer el archivo origen
   completo antes de empezar.
4. **Si una sección no tiene traducción**, agregar
   `<!-- TODO: revisar traducción -->` y dejar la sección en blanco
   con el título en inglés.

## Output que la skill devuelve al orquestador

- Cantidad de archivos sin espejo en cada idioma.
- Lista de marcadores TODO.
- Lista de links cruzados.
- Veredicto: `PASS` (mirror sincronizado) o `FAIL` (con lista de fixes).
