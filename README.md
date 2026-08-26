# Guía de aprendizaje de Git y GitHub

> Documentación bilingüe (español / inglés) sobre Git, GitHub, SSH,
> GPG, Markdown y VSCode. Construida con [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

[![CI](https://img.shields.io/github/actions/workflow/status/novocap/git-documentation/ci.yml?branch=main&style=flat-square&logo=github&label=CI)](https://github.com/novocap/git-documentation/actions/workflows/ci.yml)
[![Deploy to GitHub Pages](https://img.shields.io/github/actions/workflow/status/novocap/git-documentation/deploy.yml?branch=main&style=flat-square&logo=github&label=Deploy)](https://github.com/novocap/git-documentation/actions/workflows/deploy.yml)
[![License](https://img.shields.io/github/license/novocap/git-documentation?style=flat-square)](https://github.com/novocap/git-documentation/blob/main/LICENSE)
[![Latest release](https://img.shields.io/github/v/release/novocap/git-documentation?style=flat-square&sort=semver)](https://github.com/novocap/git-documentation/releases/latest)

:wave: Bienvenido al repositorio de guía de aprendizaje y práctica
con Git & GitHub. El sitio se publica en
**[novocap.github.io/git-documentation](https://novocap.github.io/git-documentation)**
y está disponible en español e inglés.

## Empezá por acá

- 🇪🇸 [Inicio (Español)](https://novocap.github.io/git-documentation/)
- 🇺🇸 [Home (English)](https://novocap.github.io/git-documentation/en/)
- 📖 [Repositorio en GitHub](https://github.com/novocap/git-documentation)

## Estructura del proyecto

```text
.
├── AGENTS.md              # Contrato operativo agente-humano
├── CODE_OF_CONDUCT.md     # Código de conducta (Contributor Covenant v2.1)
├── CONTRIBUTING.md        # Guía para contribuir
├── README.md              # Este archivo
├── mkdocs.yml             # Configuración MkDocs Material
├── requirements.txt       # Dependencias Python
├── docs/
│   ├── es/                # Contenido en español (idioma por defecto)
│   └── en/                # Espejo en inglés
├── img/                   # Capturas de pantalla (CC BY 4.0)
└── .opencode/             # Agentes y skills para opencode
```

## Cómo contribuir

1. Leé [`AGENTS.md`](AGENTS.md) — el contrato del flujo agentico del
   repositorio.
2. Hacé fork o creá una rama desde `main`:
   `git switch -c chore/mi-cambio`.
3. Commiteá con la convención gitmoji (`<emoji> <verbo imperativo>`).
4. Abrí un PR en **Draft**. Cuando termines de revisarlo, marcalo como
   **Ready for review**.
5. El CI valida lint, enlaces, ortografía y build estricto. Todos los
   checks deben pasar antes del merge.
6. El deploy a GitHub Pages se dispara automáticamente al mergear a
   `main`.

Para preguntas o discutir ideas grandes, abrí una
[Discussion en GitHub](https://github.com/novocap/git-documentation/discussions)
en lugar de un Issue.

## Licencia

- **Código y texto**: MIT (ver [LICENSE](LICENSE)).
- **Imágenes en `docs/img/`**: CC BY 4.0 (ver
  [`docs/img/ATTRIBUTIONS.md`](docs/img/ATTRIBUTIONS.md)).

---

> _"Cuando hayas terminado, puedes sentir la necesidad de pasar un
> momento tranquilo ponderando cómo has vivido antes de que la
> ramificación de Git formara parte de tu vida."_
> — [Scott Chacon](https://github.com/schacon) y
> [Ben Straub](https://github.com/ben), [Pro Git v2](https://github.com/progit/progit2-es)
