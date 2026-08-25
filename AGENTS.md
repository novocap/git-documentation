# AGENTS.md

> Contrato operativo entre los agentes de IA y los colaboradores humanos
> que trabajan en este repositorio. Todo lo que figura aquí es de
> cumplimiento obligatorio. Si una instrucción entra en conflicto con el
> contenido del repositorio, gana este documento.

---

## 1. Propósito del repositorio

`novocap/git-documentation` es una guía de aprendizaje en **dos idiomas
(español e inglés)** sobre Git, GitHub y herramientas asociadas (SSH, GPG,
Markdown, IDEs). El sitio se publica con **MkDocs Material** y se aloja en
**GitHub Pages** desde la rama `master`.

Los agentes de IA que operen aquí deben:

- Respetar el estilo y el tono del repositorio (español rioplatense por
  defecto, inglés neutro en el espejo).
- Mantener el mirror `docs/es/ ↔ docs/en/`.
- Producir contenido compatible con MkDocs Material (admonitions, tabs,
  code blocks con highlighting, etc.).
- Nunca publicar credenciales, llaves privadas ni datos sensibles.

---

## 2. Estructura del repositorio

```
git-documentation/
├── AGENTS.md                   ← este archivo
├── CHANGELOG.md                ← historial de versiones
├── CODE_OF_CONDUCT.md          ← código de conducta de la comunidad
├── CONTRIBUTING.md             ← guía para贡献 humanos
├── LICENSE                     ← MIT
├── README.md                   ← entrada al repositorio y al sitio
├── mkdocs.yml                  ← configuración de MkDocs Material
├── requirements.txt            ← dependencias de Python (pip)
├── .markdownlint.json          ← reglas de lint de Markdown
├── .editorconfig               ← estilo de archivo uniforme
├── .gitignore
├── .gitattributes
├── docs/
│   ├── es/                     ← contenido en español (idioma por defecto)
│   │   ├── index.md
│   │   ├── workspace.md
│   │   ├── ssh.md
│   │   ├── git/
│   │   │   ├── index.md
│   │   │   └── gpg.md
│   │   ├── practice/
│   │   │   └── index.md
│   │   ├── tools/
│   │   │   ├── ide.md
│   │   │   └── markdown.md
│   │   └── glosario.md
│   └── en/                     ← espejo en inglés
└── img/                        ← capturas de pantalla, agrupadas por sección
```

Los archivos legacy (`docs/GIT.md`, `docs/SSH.md`, etc.) fueron reemplazados
en la Fase 2. No se borran del historial de git pero ya no se editan.

---

## 3. Reglas duras (todo agente debe respetarlas)

1. **Nunca pushear directo a `master`.** Todo cambio va en una rama feature
   y se mergea vía PR.
2. **Todo PR se crea en estado Draft.** El autor (humano) es quien lo marca
   como "Ready for review" cuando termina de revisarlo.
3. **Idioma del PR**: título, descripción y checklist **siempre en español**.
4. **Un PR por fase.** No mezclar fases distintas en el mismo PR.
5. **Linear history.** Solo `rebase` o `squash` merge. Nunca merge commits
   tradicionales.
6. **Commits con gitmoji.** Cada mensaje empieza con un emoji de la tabla
   oficial más una descripción breve en imperativo.
7. **Mirror ES/EN sincronizado.** Si se modifica un archivo en `docs/es/`,
   el archivo correspondiente en `docs/en/` debe actualizarse en el mismo
   PR (o en un PR hermano que se mergea inmediatamente después).
8. **No inventar rutas ni archivos.** Si un comando o enlace apunta a algo
   nuevo, ese algo debe existir en el PR.
9. **No incluir credenciales, tokens ni llaves privadas** en commits,
   capturas, ejemplos o logs.
10. **No destruir el historial de `master`.** No se hace `force push` ni
    `reset --hard` sobre la rama por defecto.

---

## 4. Convención de commits (gitmoji)

Formato obligatorio:

```
:<emoji>: <verbo en imperativo> <alcance breve>
```

Tabla de gitmojis aprobados en este repositorio:

| Emoji | Código | Uso |
|---|---|---|
| `:sparkles:` | `:sparkles:` | Nueva funcionalidad o archivo |
| `:wrench:` | `:wrench:` | Corrección, refactor o tarea de mantenimiento |
| `:books:` | `:books:` | Cambios solo de documentación |
| `:globe_with_meridians:` | `:globe_with_meridians:` | Cambios de internacionalización o traducción |
| `:camera_flash:` | `:camera_flash:` | Capturas, imágenes y assets visuales |
| `:construction_worker:` | `:construction_worker:` | CI/CD, workflows, infraestructura |
| `:lock:` | `:lock:` | Seguridad, protección de rama, secretos |
| `:book:` | `:book:` | Configuración del proyecto (AGENTS.md, README, etc.) |
| `:bug:` | `:bug:` | Corrección de bug |
| `:fire:` | `:fire:` | Eliminar código o archivo |
| `:art:` | `:art:` | Mejorar formato o estilo sin cambiar lógica |
| `:memo:` | `:memo:` | Actualización de documentación menor |
| `:rocket:` | `:rocket:` | Deploy, release, publicación |
| `:test:` | `:test:` | Agregar o corregir tests |
| `:bump:` | `:bump:` | Actualizar dependencias |

Ejemplos válidos:

```
:wrench: Corregir typo 'aprendisaje' en README y SUMMARY
:sparkles: Agregar mkdocs.yml con configuración bilingüe ES/EN
:globe_with_meridians: Traducir fundamentos de Git a inglés
:camera_flash: Reemplazar capturas de VSCode con UI 1.85
:construction_worker: Agregar workflows de CI con markdownlint y lychee
:book: Configurar flujo agentico con AGENTS.md, agentes y skills
:lock: Activar protección de rama master y GitHub Pages
```

Ejemplos **inválidos** (no usar):

- `Actualizar README` (sin gitmoji, sin imperativo).
- `:sparkles: se actualizó el readme` (pasado, no imperativo).
- `:sparkles:` (solo el emoji, sin descripción).

Para más detalles y la tabla completa, ver la skill
`commit-conventional`.

---

## 5. Convención de Pull Requests

Cada PR debe:

1. **Estar en estado Draft** al momento de crearlo.
2. **Tener título en español** con el formato
   `:<emoji>: <descripción breve>` (mismo gitmoji del commit principal).
3. **Usar la plantilla** `.github/PULL_REQUEST_TEMPLATE.md`.
4. **Pasar el CI**: lint (`markdownlint`), link check (`lychee`),
   spell check (`codespell`) y build (`mkdocs build --strict`).
5. **Asociarse a una fase** del plan de trabajo documentada en este
   `AGENTS.md`.
6. **Listar capturas nuevas** en la sección "Capturas" si aplica.
7. **Cerrarse solo cuando el autor humano lo apruebe y mergee.** Los
   agentes no cierran sus propios PRs.

Plantilla mínima del PR (referencia rápida; la versión canónica está en
`.github/PULL_REQUEST_TEMPLATE.md`):

```markdown
## Resumen
<!-- Una o dos frases del cambio. -->

## Cambios
<!-- Lista de cambios concretos. -->

## Capturas
<!-- Imágenes nuevas o reemplazadas. -->

## Checklist
- [ ] CI pasa (lint, links, build)
- [ ] Mirror ES/EN actualizado (si aplica)
- [ ] Imágenes y rutas relativas verificadas
- [ ] Sin credenciales ni datos sensibles
```

---

## 6. Workflow de fases (mapa agente → skill → comando)

El plan completo está en `AGENTS.md` § "Mapa de PRs" debajo. Cada fase
tiene asignado un agente y las skills que debe invocar.

| Fase | PR | Agente principal | Skills que invoca |
|---|---|---|---|
| 0 | `chore/agents-md-flujo-agentico` | `gitmoji-commiter` | `commit-conventional`, `pr-draft-es` |
| 1 | `chore/fase-1-higiene` | `redactor-es` | `commit-conventional` |
| 2 | `feat/fase-2-scaffold-mkdocs` | `mkdocs-builder` | `commit-conventional`, `mkdocs-build-local` |
| 3a | `feat/fase-3a-fundamentos-es` | `redactor-es` | `commit-conventional`, `mkdocs-build-local` |
| 3b | `feat/fase-3b-herramientas-es` | `redactor-es` | `commit-conventional`, `mkdocs-build-local` |
| 3c | `feat/fase-3c-fundamentos-en` | `traductor-en` | `commit-conventional`, `i18n-mirror-check` |
| 3d | `feat/fase-3d-herramientas-en` | `traductor-en` | `commit-conventional`, `i18n-mirror-check` |
| 4 | `chore/fase-4-capturas` | `redactor-es` | `commit-conventional` |
| 5 | `ci/fase-5-workflows-y-pages` | `mkdocs-builder` | `commit-conventional`, `mkdocs-build-local` |
| 6 | `chore/fase-6-proteccion-master` | `gitmoji-commiter` | `branch-protection-rules`, `commit-conventional` |

Antes de mergear cada PR, se debe correr la skill `mkdocs-build-local` para
verificar que el sitio sigue construyendo sin warnings.

---

## 7. Agentes disponibles

Definidos como archivos en `.opencode/agent/<nombre>.md`:

| Agente | Cuándo invocarlo |
|---|---|
| `redactor-es` | Redacción o edición de documentos en español. |
| `traductor-en` | Traducción ES → EN manteniendo mirror. |
| `lint-ci` | Pasada de markdownlint, lychee y codespell. |
| `mkdocs-builder` | Build, validación y preview del sitio. |
| `revisor-pr` | Armado del PR en español y en draft con su checklist. |
| `gitmoji-commiter` | Sugerencia de mensaje de commit con gitmoji. |

---

## 8. Skills disponibles

Definidas en `.opencode/skills/<nombre>/SKILL.md`:

| Skill | Propósito |
|---|---|
| `commit-conventional` | Tabla de gitmojis aprobados + formato de mensaje. |
| `pr-draft-es` | Llenar la plantilla de PR en español y en draft. |
| `mkdocs-build-local` | Comandos para build y preview local de MkDocs. |
| `i18n-mirror-check` | Validar sincronización entre `docs/es/` y `docs/en/`. |
| `branch-protection-rules` | Payload JSON y comandos para proteger `master`. |
| `gitmoji-cheatsheet` | Tabla rápida de gitmojis más usados. |

---

## 9. Ruteo de tareas

| Pedido del usuario | Agente a invocar | Skills sugeridas |
|---|---|---|
| "Reescribí X en español" / "Corrige Y" | `redactor-es` | `commit-conventional`, `mkdocs-build-local` |
| "Traducí X al inglés" | `traductor-en` | `i18n-mirror-check`, `commit-conventional` |
| "Validá el sitio" / "No me anda el build" | `mkdocs-builder` | `mkdocs-build-local` |
| "Corré los lints" / "Arreglá lo que reporte CI" | `lint-ci` | — |
| "Armá el PR" / "Subí esto" | `revisor-pr` | `pr-draft-es` |
| "¿Qué gitmoji uso?" / "Sugerí el commit" | `gitmoji-commiter` | `commit-conventional`, `gitmoji-cheatsheet` |
| "Activá la protección de master" | `gitmoji-commiter` | `branch-protection-rules` |

Si un pedido no encaja claramente con un agente, primero invocar a
`mkdocs-builder` o `lint-ci` para entender el contexto antes de derivar.

---

## 10. Cómo correr CI/lint localmente

Antes de pedir la apertura del PR, el agente (o el humano) debe ejecutar:

```bash
# Instalar dependencias de Python (una vez)
python -m venv .venv
source .venv/bin/activate   # o .venv\Scripts\Activate.ps1 en Windows
pip install -r requirements.txt

# Validar que el sitio construye sin warnings
mkdocs build --strict

# Lint de Markdown
markdownlint-cli2 "docs/**/*.md" "**/*.md" "#site/**" "#node_modules/**"

# Verificar enlaces
lychee --offline --include-fragments docs/ README.md

# Spell check
codespell docs/ README.md CHANGELOG.md
```

Si alguno falla, **no abrir el PR** hasta corregirlo.

---

## 11. Mapa de PRs (plan de trabajo)

| # | Rama | Título draft | Contenido |
|---|---|---|---|
| 0 | `chore/agents-md-flujo-agentico` | `:book: Configurar flujo agentico (AGENTS.md, agentes y skills)` | Este PR. |
| 1 | `chore/fase-1-higiene` | `:wrench: Fase 1 · Higiene y mantenimiento` | Typos, anclas, `.editorconfig`, plantillas `.github/*`, `CODE_OF_CONDUCT.md`. |
| 2 | `feat/fase-2-scaffold-mkdocs` | `:sparkles: Fase 2 · Scaffold MkDocs bilingüe` | `mkdocs.yml`, `requirements.txt`, estructura `docs/es/` y `docs/en/` vacía. |
| 3a | `feat/fase-3a-fundamentos-es` | `:sparkles: Fase 3a · Reescribir fundamentos (ES)` | `git/index.md`, `git/gpg.md`, `ssh.md`, `workspace.md`. |
| 3b | `feat/fase-3b-herramientas-es` | `:sparkles: Fase 3b · Reescribir herramientas (ES)` | `tools/ide.md`, `tools/markdown.md`, `practice/index.md`. |
| 3c | `feat/fase-3c-fundamentos-en` | `:globe_with_meridians: Fase 3c · Traducir fundamentos (EN)` | Espejo EN de 3a. |
| 3d | `feat/fase-3d-herramientas-en` | `:globe_with_meridians: Fase 3d · Traducir herramientas (EN)` | Espejo EN de 3b. |
| 4 | `chore/fase-4-capturas` | `:camera_flash: Fase 4 · Reemplazar capturas obsoletas` | Regenerar `img/` con UI 2024+. |
| 5 | `ci/fase-5-workflows-y-pages` | `:construction_worker: Fase 5 · Workflows CI/CD + Pages` | `ci.yml`, `deploy.yml`, `.markdownlint.json`, `CHANGELOG.md` v1.0.0. |
| 6 | `chore/fase-6-proteccion-master` | `:lock: Fase 6 · Activar protección de master y Pages` | Script `gh api` con reglas, habilitar Pages. |

---

## 12. Activación del flujo

Tras mergear este PR a `master`, los colaboradores (humanos o agentes) deben
ejecutar localmente antes de empezar a trabajar:

```bash
# Instalar opencode (si no lo tienen)
curl -fsSL https://opencode.ai/install | bash

# Reiniciar opencode para que cargue los agentes y skills del proyecto
# (los cambios de config no se hot-recargan).
```

A partir de ese momento, las skills del proyecto estarán disponibles
mediante el tool `skill` de opencode y los agentes definidos en
`.opencode/agent/` podrán ser invocados desde la sesión.
