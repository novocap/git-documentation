---
name: commit-conventional
description: Tabla completa de gitmojis aprobados en este repositorio y formato obligatorio de mensaje de commit. Usar cuando el usuario pida ayuda para redactar un commit o cuando un agente (especialmente gitmoji-commiter) necesite decidir el emoji y la descripción.
---

# Skill: commit-conventional

Convención oficial de commits del repositorio
`novocap/git-documentation`. Todo commit debe respetar estas reglas.

## Formato obligatorio

```
:<emoji>: <verbo en imperativo singular> <alcance breve en español>
```

### Reglas duras

1. **Siempre arrancar con un gitmoji** de la tabla de abajo.
2. **Imperativo singular**: "Agregar", "Corregir", "Reemplazar",
   "Actualizar", "Eliminar", "Traducir", "Documentar", "Configurar",
   "Activar", "Definir", "Establecer", "Migrar", "Reescribir".
3. **Español** siempre. Excepciones: nombres propios, términos técnicos
   no traducibles (`commit`, `merge`, `pull request`, `main`,
   `master`, `staging area`, etc.).
4. **72 caracteres** como máximo después del gitmoji.
5. **Una idea por commit.** Si hay varias ideas, varios commits.

## Tabla completa de gitmojis aprobados

| Emoji | Código | Uso | Ejemplo |
|---|---|---|---|
| ✨ | `:sparkles:` | Nueva funcionalidad, archivo o feature | `:sparkles: Agregar mkdocs.yml bilingüe` |
| 🔧 | `:wrench:` | Corrección, refactor o mantenimiento | `:wrench: Corregir typo en SUMMARY` |
| 📚 | `:books:` | Cambios solo de documentación | `:books: Documentar skill commit-conventional` |
| 🌐 | `:globe_with_meridians:` | i18n, traducción ES ↔ EN | `:globe_with_meridians: Traducir SSH a inglés` |
| 📸 | `:camera_flash:` | Capturas, imágenes y assets | `:camera_flash: Reemplazar capturas de VSCode` |
| 👷 | `:construction_worker:` | CI/CD, workflows, infra | `:construction_worker: Agregar CI con markdownlint` |
| 🔒 | `:lock:` | Seguridad, protección de rama | `:lock: Activar protección de master` |
| 📖 | `:book:` | Configuración del proyecto | `:book: Configurar AGENTS.md y agentes` |
| 🐛 | `:bug:` | Corrección de bug | `:bug: Arreglar build en Windows por paths` |
| 🔥 | `:fire:` | Eliminar código o archivo | `:fire: Eliminar carpeta docs/ legacy` |
| 🎨 | `:art:` | Mejorar formato o estilo | `:art: Reordenar admonitions en IDE.md` |
| 📝 | `:memo:` | Documentación menor | `:memo: Actualizar notas de release v1.0.0` |
| 🚀 | `:rocket:` | Deploy, release, publicación | `:rocket: Publicar sitio en GitHub Pages` |
| ✅ | `:test:` | Tests | `:test: Agregar tests para i18n-mirror-check` |
| ⬆️ | `:bump:` | Actualizar dependencias | `:bump: Actualizar mkdocs-material a 9.5` |
| ⚡ | `:zap:` | Mejorar performance | `:zap: Optimizar carga de imágenes en mkdocs` |
| 🚚 | `:truck:` | Mover o renombrar archivos | `:truck: Mover docs/SSH.md a docs/es/ssh.md` |
| 💄 | `:lipstick:` | UI/cosmética | `:lipstick: Ajustar colores del tema` |
| 🍱 | `:bento:` | Assets, recursos | `:bento: Empaquetar iconos en img/` |
| ♻️ | `:recycle:` | Refactor de código | `:recycle: Refactorizar build MkDocs` |

## Ejemplos buenos vs malos

### Buenos

```
:wrench: Corregir typo 'aprendisaje' en README
:sparkles: Agregar mkdocs.yml con configuración bilingüe ES/EN
:globe_with_meridians: Traducir fundamentos de Git a inglés
:camera_flash: Reemplazar capturas de VSCode con UI 1.85
:construction_worker: Agregar workflow de CI con markdownlint y lychee
:book: Configurar flujo agentico con AGENTS.md y agentes
:lock: Activar protección de rama master y GitHub Pages
:bump: Actualizar mkdocs-material a 9.5
```

### Malos (rechazar)

| Mensaje | Por qué está mal |
|---|---|
| `Actualizar README` | Sin gitmoji. |
| `:sparkles: se actualizó el readme` | Pasado, no imperativo. |
| `:sparkles:` | Falta descripción. |
| `:sparkles: Actualizar el README del proyecto porque nos lo pidió fulanito y además había otros cambios que también toqué` | Excede 72 caracteres y mezcla varios cambios. |
| `Update README` | En inglés y sin gitmoji. |
| `feat: add mkdocs` | No usa gitmoji; usa Conventional Commits en lugar de gitmoji. |

## Cuándo invocar esta skill

- El usuario pide "ayudame con el commit" o "¿qué mensaje pongo?".
- Un agente (`gitmoji-commiter`, `redactor-es`, `traductor-en`) está por
  commitear y necesita decidir el emoji.
- Antes de invocar a `revisor-pr` para sugerir el título del PR (debe
  compartir el gitmoji del commit principal).

## Output esperado de la skill

Una sugerencia concreta con:

- Gitmoji elegido.
- Mensaje completo.
- Longitud en caracteres.
- Justificación de un renglón.
- Comando listo para correr:

```bash
git add <archivos> && git commit -m ":<emoji>: <mensaje>"
```
