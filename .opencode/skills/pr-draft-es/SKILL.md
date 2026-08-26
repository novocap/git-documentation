---
name: pr-draft-es
description: Llenar la plantilla de Pull Request del repositorio en español y en estado draft. Usar cuando un agente (especialmente revisor-pr) está preparando un PR, o cuando el usuario pida "armá el PR" / "subí esto".
---

# Skill: pr-draft-es

Procedimiento oficial para crear Pull Requests en el repositorio
`novocap/Novocap.Learning.Git.Docs`.

## Principios

1. **Siempre en español**: título, descripción, checklist.
2. **Siempre en estado Draft**: el autor humano es quien marca como
   "Ready for review" después de revisar.
3. **Una fase por PR**: nunca mezclar fases distintas.
4. **CI verde antes de mergear**: lint, link check, build, todos en
   verde.

## Plantilla canónica

La plantilla vive en `.github/PULL_REQUEST_TEMPLATE.md`. Contenido
esperado:

```markdown
## Resumen
<!-- Una o dos frases: qué cambia este PR y por qué. -->

## Cambios
<!-- Bullets concretos: un bullet por archivo o grupo. -->

- `<archivo>`: <qué se hizo>.

## Capturas
<!-- Si agregaste o reemplazaste imágenes, listalas con descripción. -->

- `img/<sección>/<archivo>`: <qué muestra>.

## Checklist
- [ ] CI pasa (lint, links, build)
- [ ] Mirror ES/EN actualizado (si aplica)
- [ ] Imágenes y rutas relativas verificadas
- [ ] Sin credenciales ni datos sensibles
- [ ] Commits usan gitmoji + imperativo
- [ ] Título del PR usa gitmoji

## Fase del plan
<!-- Referenciar la fase del AGENTS.md. -->

- Fase: N — <nombre de la fase>
- PR #: N (sobre N total)

## Issue relacionado
<!-- Opcional. Si existe un issue que cierra este PR: -->

- Closes #N
- O Relacionado: #N
```

## Cómo armar el PR paso a paso

1. **Validar la rama localmente**:

   ```bash
   git checkout <rama>
   git status                       # working tree limpio
   git log main..HEAD --oneline   # lista de commits
   git diff --name-only main..HEAD
   ```

2. **Correr build y lints** (delegar a `mkdocs-builder` y `lint-ci`):

   ```bash
   mkdocs build --strict
   markdownlint-cli2 "**/*.md"
   lychee --offline docs/ README.md
   codespell docs/ README.md
   ```

3. **Elegir el título del PR**:

   - Mismo gitmoji que el commit principal (o el más representativo si
     son varios).
   - Formato: `:<emoji>: <descripción breve>`.
   - Máximo 72 caracteres.

4. **Llenar la plantilla**:

   - **Resumen**: 1-2 frases. Incluir el "por qué" más que el "qué"
     (el "qué" ya está en los commits).
   - **Cambios**: bullets concretos, idealmente con rutas de archivo.
   - **Capturas**: si hay imágenes nuevas, incluirlas como links
     relativos (`![desc](../img/...)`).
   - **Checklist**: marcar solo los items efectivamente cumplidos.

5. **Sugerir el comando de push** (NO ejecutarlo):

   ```bash
   git push -u origin <rama>
   ```

6. **Calcular la URL del PR**:

   ```text
   https://github.com/novocap/Novocap.Learning.Git.Docs/compare/main...<rama>
   ```

## Output esperado

Devolvé un bloque markdown listo para copiar y pegar en la UI de GitHub:

```markdown
### Título sugerido del PR
:<emoji>: <descripción>

### Cuerpo del PR
<plantilla llena>

### Comando de push
git push -u origin <rama>

### URL para abrir el PR
https://github.com/novocap/Novocap.Learning.Git.Docs/compare/main...<rama>

### Recordatorios para el humano
- [ ] Marcar como **Draft PR** al abrirlo.
- [ ] No marcar como "Ready for review" hasta haber revisado el diff.
- [ ] Esperar a que CI pase antes del merge.
```

## Errores comunes a evitar

- **Crear el PR en estado "Ready for review"** antes de que el humano
  lo revise. Esto rompe la convención del repo.
- **Título en inglés**. Aunque el código y los nombres técnicos estén
  en inglés, el título del PR va en español.
- **Checklist sin marcar** pero mencionando "todo listo". Marcar solo lo
  realmente verificado.
- **Mezclar fases**: si el PR toca archivos de Fase 3 y Fase 4,
  partirlo en dos PRs.
- **Olvidar el mirror**: si tocás `docs/es/X.md`, mencionar
  explícitamente que `docs/en/X.md` se actualiza en el mismo PR o en
  un PR hermano.
