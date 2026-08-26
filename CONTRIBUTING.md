# Cómo contribuir

Este repositorio sigue un flujo agentico documentado en
[`AGENTS.md`](AGENTS.md). Antes de abrir un PR, leé ese archivo
completo; ahí están las reglas duras, la convención de commits y la
guía operativa.

## Resumen rápido

1. **Una rama por fase.** Cada fase del plan vive en su propia rama
   (`chore/...`, `feat/...`, `ci/...`).
2. **Commits con gitmoji.** Mensaje en imperativo y en español,
   empezando con un emoji de la tabla oficial.
3. **PR en Draft.** Se abre como borrador y el autor humano lo marca
   como *Ready for review* después de revisarlo.
4. **Mirror ES/EN.** Si tocás `docs/es/`, también actualizá
   `docs/en/` (o viceversa). Usá la skill `i18n-mirror-check` antes
   de pedir el merge.
5. **CI verde.** El pipeline valida lint, enlaces, ortografía y
   build con `mkdocs build --strict`.

## Estructura de archivos

```
.
├── AGENTS.md                  ← Contrato del flujo agentico (LEER)
├── CODE_OF_CONDUCT.md         ← Código de conducta
├── CONTRIBUTING.md            ← Este archivo
├── LICENSE                    ← MIT
├── README.md                  ← Entrada del repo
├── mkdocs.yml                 ← Configuración MkDocs
├── requirements.txt           ← Dependencias Python
├── docs/
│   ├── es/                    ← Contenido en español
│   ├── en/                    ← Contenido en inglés
│   └── img/                   ← Capturas (CC BY 4.0)
├── img/                       ← Assets globales (ATTRIBUTIONS.md)
└── .opencode/                 ← Agentes y skills para opencode
```

## Cómo reportar issues

- Usá la plantilla provista en `.github/ISSUE_TEMPLATE.md`.
- Si encontraste un error en una traducción, marcá el archivo
  afectado con un comentario `<!-- TODO: revisar traducción -->` y
  abrí un issue.
- Si encontraste un problema de seguridad, **no** abras un issue
  público; escribí directamente al mantenedor.

## Licencia de las contribuciones

- **Código y texto**: MIT (ver `LICENSE`).
- **Capturas en `docs/img/`**: deben traer atribución CC BY 4.0
  documentada en `docs/img/ATTRIBUTIONS.md`.

## Convenciones adicionales

Ver la skill `.opencode/skills/commit-conventional/SKILL.md` para
detalle de los gitmojis aprobados y `.opencode/skills/pr-draft-es/SKILL.md`
para el formato del PR.
