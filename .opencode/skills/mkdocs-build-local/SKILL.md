---
name: mkdocs-build-local
description: Comandos exactos para buildear, servir y validar localmente el sitio MkDocs Material. Usar cuando un agente necesite verificar que el sitio construye sin warnings, o cuando el usuario pida "validá el sitio" / "no me anda el build".
---

# Skill: mkdocs-build-local

Guía operativa para construir y servir localmente el sitio del
repositorio `novocap/git-documentation`.

## Prerrequisitos

```bash
# Python 3.10 o superior
python --version

# Crear y activar virtualenv (recomendado)
python -m venv .venv
source .venv/bin/activate          # Linux / macOS
.venv\Scripts\Activate.ps1         # Windows PowerShell
.venv\Scripts\activate.bat         # Windows CMD

# Instalar dependencias
pip install -r requirements.txt
```

`requirements.txt` debe contener (al menos):

```text
mkdocs-material>=9.5
mkdocs-static-i18n>=1.2
pymdown-extensions>=10.7
mkdocs-minify-plugin>=1.0
mkdocs-git-revision-date-localized-plugin>=1.2
```

## Comandos principales

### Build estricto (CI local)

```bash
mkdocs build --strict
```

- Falla con exit code != 0 ante cualquier warning.
- Usar antes de pedir la apertura del PR.

### Build permisivo (solo info)

```bash
mkdocs build
```

- Muestra warnings pero no falla. Útil mientras se está escribiendo.

### Servir localmente

```bash
mkdocs serve
```

- Sirve en `http://127.0.0.1:8000`.
- Live reload: cualquier cambio en `docs/` o `mkdocs.yml` recarga la
  página automáticamente.
- Para servir en otro puerto: `mkdocs serve -a 127.0.0.1:9000`.

### Build solo un idioma (con mkdocs-static-i18n)

```bash
# Solo español (default)
mkdocs build --strict

# Solo inglés (si la configuración lo soporta)
MKDOCS_LANG=en mkdocs build --strict
```

(El switch exacto depende de cómo se configure el plugin en `mkdocs.yml`
durante la Fase 2. Verificar en ese momento.)

## Validaciones típicas

### Páginas huérfanas

```bash
# Lista archivos en nav que no existen
python -c "
import yaml, os, sys
cfg = yaml.safe_load(open('mkdocs.yml').read().split('---')[-1] if '---' in open('mkdocs.yml').read() else open('mkdocs.yml').read())
def walk(nav, prefix=''):
    for item in (nav or []):
        if isinstance(item, dict):
            for k, v in item.items():
                yield from walk(v, prefix)
        else:
            yield prefix + item
missing = [p for p in walk(cfg.get('nav', [])) if not os.path.exists(p)]
sys.exit(1) if missing else print('OK')
"
```

(El comando exacto puede ajustarse cuando se cree `mkdocs.yml` en Fase 2.)

### Anchors rotos

```bash
# Buscar links internos del tipo ](path#anchor) y validar el anchor
grep -rEho '\]\([^)]*#[^)]+\)' docs/ | sort -u
```

Después, comparar contra los encabezados `^#+` (regex para 1 o más
`#` al inicio) de cada archivo destino.

### Imágenes rotas

```bash
# Buscar todas las imágenes y verificar que existan
grep -rEoh '!\[[^]]*\]\([^)]+\)' docs/ | \
  sed -E 's/!\[[^]]*\]\(([^)]+)\)/\1/' | \
  xargs -I {} test -f {} || echo "Falta: {}"
```

## Checklist pre-PR

Antes de invocar a `revisor-pr`, correr:

- [ ] `mkdocs build --strict` → exit code 0.
- [ ] `markdownlint-cli2 "**/*.md"` → sin errores.
- [ ] `lychee --offline docs/ README.md` → sin enlaces rotos.
- [ ] `codespell docs/ README.md AGENTS.md` → sin typos.
- [ ] Mirror `docs/es/` ↔ `docs/en/` validado con la skill
      `i18n-mirror-check`.

## Errores frecuentes

| Error | Causa probable | Solución |
|---|---|---|
| `WARNING - Documentation file 'docs/es/foo.md' is not found` | Path mal escrito en `nav:` de `mkdocs.yml`. | Verificar el path exacto con `ls docs/es/`. |
| `WARNING - Anchor 'foo-bar' not found` | El anchor cambió de nombre. | Actualizar el link o restaurar el H2/H3. |
| `ERROR - Config value 'theme.language'` | Falta el plugin de i18n o el idioma no está soportado. | Revisar `mkdocs.yml` y `requirements.txt`. |
| `mkdocs serve` no recarga | Cache del navegador. | Hard reload (`Ctrl+Shift+R`). |
| `mkdocs build` falla en Windows por paths | Paths con backslash. | Usar siempre `/` en `mkdocs.yml`. |

## Cuándo invocar esta skill

- Antes de invocar a `revisor-pr` (validación pre-PR).
- Después de un cambio grande en `mkdocs.yml` o en la estructura de
  carpetas.
- Cuando el usuario reporta que "el sitio no carga" o "no se ven los
  cambios".
- Como parte del CI local (en lugar de esperar al CI remoto).

## Output esperado

Devolvé al orquestador:

1. Comando corrido y su exit code.
2. Cantidad de warnings y errores (si los hay).
3. Lista priorizada de fixes (si los hay).
4. Recomendación: PASS (proceder con el PR) o FAIL (corregir antes).
