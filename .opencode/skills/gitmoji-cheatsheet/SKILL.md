---
name: gitmoji-cheatsheet
description: Tabla rápida de los gitmojis más usados en este repositorio, con ejemplos concretos de mensajes válidos. Usar como referencia rápida cuando se necesita decidir un emoji sin pasar por la tabla completa de commit-conventional.
---

# Skill: gitmoji-cheatsheet

Tabla rápida de los gitmojis más frecuentes en
`novocap/git-documentation`. Para la tabla completa, ver la skill
`commit-conventional`.

## Top 10 más usados

| Emoji | Código | Cuándo usarlo | Ejemplo |
|---|---|---|---|
| ✨ | `:sparkles:` | Nueva funcionalidad o archivo | `:sparkles: Agregar mkdocs.yml bilingüe` |
| 🔧 | `:wrench:` | Corrección, refactor o mantenimiento | `:wrench: Corregir typo en SUMMARY` |
| 📚 | `:books:` | Cambios solo de documentación | `:books: Documentar skill commit-conventional` |
| 🌐 | `:globe_with_meridians:` | Traducción ES ↔ EN | `:globe_with_meridians: Traducir SSH a inglés` |
| 📸 | `:camera_flash:` | Capturas e imágenes | `:camera_flash: Reemplazar capturas de VSCode` |
| 👷 | `:construction_worker:` | CI/CD e infraestructura | `:construction_worker: Agregar workflow de CI` |
| 🔒 | `:lock:` | Seguridad y protección | `:lock: Activar protección de master` |
| 📖 | `:book:` | Configuración del proyecto | `:book: Configurar AGENTS.md y agentes` |
| 🐛 | `:bug:` | Bug fix | `:bug: Arreglar build en Windows` |
| 🚀 | `:rocket:` | Deploy o release | `:rocket: Publicar sitio en GitHub Pages` |

## Tabla extendida (segundo nivel)

| Emoji | Código | Cuándo | Ejemplo |
|---|---|---|---|
| 🔥 | `:fire:` | Eliminar archivo o código | `:fire: Eliminar docs/ legacy` |
| 🎨 | `:art:` | Mejorar formato o estilo | `:art: Reordenar admonitions en IDE.md` |
| 📝 | `:memo:` | Documentación menor | `:memo: Actualizar notas de release v1.0.0` |
| ✅ | `:test:` | Tests | `:test: Agregar tests para i18n-mirror-check` |
| ⬆️ | `:bump:` | Actualizar dependencias | `:bump: Actualizar mkdocs-material a 9.5` |
| ⚡ | `:zap:` | Performance | `:zap: Optimizar carga de imágenes` |
| 🚚 | `:truck:` | Mover o renombrar | `:truck: Mover docs/SSH.md a docs/es/ssh.md` |
| 💄 | `:lipstick:` | UI/cosmética | `:lipstick: Ajustar colores del tema` |
| 🍱 | `:bento:` | Empaquetar assets | `:bento: Empaquetar iconos en img/` |
| ♻️ | `:recycle:` | Refactor | `:recycle: Refactorizar build MkDocs` |

## Decisión rápida por tipo de archivo

```text
¿Estás tocando...?

AGENTS.md, README.md, LICENSE
  → :book:

docs/**/*.md (solo documentación)
  → :books:  (cambios grandes)
  → :memo:  (cambios menores)

docs/en/** o archivos ES/EN cruzados
  → :globe_with_meridians:

mkdocs.yml, requirements.txt, .github/workflows/
  → :sparkles: (nuevo) o :construction_worker: (CI)

img/**
  → :camera_flash:

CODEOWNERS, .gitignore, secrets, branch protection
  → :lock:

*.py, scripts/, src/
  → :sparkles: (nuevo) o :wrench: (fix)

package.json, requirements.txt, Gemfile
  → :bump:

Eliminando archivos
  → :fire:

Moviendo o renombrando
  → :truck:

Fix de un bug evidente
  → :bug:
```

## Formato del mensaje

```
:<emoji>: <verbo imperativo singular> <alcance breve>
```

- **Verbo**: Agregar, Corregir, Reemplazar, Actualizar, Eliminar,
  Traducir, Documentar, Configurar, Activar, Definir, Migrar.
- **Alcance**: nombre del archivo principal o sección afectada.
- **Máximo**: 72 caracteres después del gitmoji.
- **Idioma**: español, salvo términos técnicos no traducibles.

## Ejemplos canónicos del repo

```text
:wrench: Corregir typo 'aprendisaje' en README y SUMMARY
:sparkles: Agregar mkdocs.yml con configuración bilingüe ES/EN
:globe_with_meridians: Traducir fundamentos de Git a inglés
:camera_flash: Reemplazar capturas de VSCode con UI 1.85
:construction_worker: Agregar workflows de CI con markdownlint y lychee
:book: Configurar flujo agentico con AGENTS.md y agentes
:lock: Activar protección de rama master y GitHub Pages
:bump: Actualizar mkdocs-material a 9.5
:fire: Eliminar docs/ legacy tras migración a MkDocs
:truck: Mover docs/SSH.md a docs/es/ssh.md
:memo: Actualizar notas de release v1.0.0
```

## Anti-ejemplos (no usar)

| Mensaje | Por qué está mal |
|---|---|
| `Update README` | En inglés, sin gitmoji. |
| `:sparkles: se actualizó el readme` | Pasado, no imperativo. |
| `:sparkles:` | Sin descripción. |
| `:sparkles: Update` | Inglés. |
| Mensaje de 200+ caracteres | Mezcla varios cambios. |
| `feat: add mkdocs` | Usa Conventional Commits, no gitmoji. |

## Cuándo invocar esta skill

- Necesitás una referencia rápida antes de invocar a
  `gitmoji-commiter`.
- El usuario pregunta "¿qué emoji uso para X?".
- Estás escribiendo varios commits seguidos y querés mantener
  consistencia.
