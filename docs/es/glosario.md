# Glosario

Tabla bilingüe de términos técnicos de Git, GitHub, SSH, GPG y
herramientas asociadas. Cada entrada tiene el término en español,
su contraparte en inglés y una breve definición.

!!! tip "Cómo usar este glosario"
    - Si tu idioma de trabajo es español: usá la columna **ES** como
      referencia principal y la columna **EN** cuando leas
      documentación externa.
    - Si tu idioma de trabajo es inglés: usá el selector de idioma en
      la esquina superior derecha del sitio para abrir la versión
      espejo, que invierte el orden de las columnas.

## Conceptos fundamentales

| Español | English | Definición |
|---|---|---|
| Repositorio | Repository | Almacén versionado de archivos bajo control de Git. |
| Repositorio remoto | Remote repository | Réplica del repositorio alojada en un servidor (GitHub, GitLab, etc.). |
| Rama | Branch | Línea de desarrollo independiente; un puntero a un commit. |
| Rama principal | Main branch | Rama por defecto del repositorio (`main` en GitHub, GitLab y otras plataformas desde 2020). |
| Commit | Commit | Instantánea versionada del estado del repositorio, identificada por un hash. |
| Hash (SHA-1) | Hash (SHA-1) | Identificador único de 40 caracteres hexadecimales que Git asigna a cada commit. |
| Working Directory | Working Directory | Carpeta local donde están los archivos en edición. |
| Staging Area (Index) | Staging Area (Index) | Área intermedia donde se preparan los archivos para el próximo commit. |
| Git Directory (`.git/`) | Git Directory (`.git/`) | Carpeta oculta que almacena el historial completo del repositorio. |
| HEAD | HEAD | Apuntador interno de Git que indica la rama y el commit activos. |
| Working tree | Working tree | Sinónimo de Working Directory. |
| Detached HEAD | Detached HEAD | Estado en que `HEAD` apunta directamente a un commit, no a una rama. |

## Operaciones

| Español | English | Definición |
|---|---|---|
| Clonar | Clone | Descargar una copia completa de un repositorio remoto. |
| Confirmar (cambios) | Commit | Registrar cambios del staging area en el historial. |
| Fusionar | Merge | Combinar los cambios de una rama en otra. |
| Rebase | Rebase | Reaplicar commits de una rama sobre la punta de otra. |
| Cherry-pick | Cherry-pick | Aplicar un commit específico de otra rama sobre la actual. |
| Reset | Reset | Mover `HEAD` (y opcionalmente el staging/working tree) a un commit previo. |
| Revert | Revert | Crear un commit nuevo que deshace los cambios de un commit anterior. |
| Stash | Stash | Guardar cambios sin commitear en una pila temporal. |
| Tag | Tag | Marca inmutable sobre un commit (usado para releases). |
| Pull | Pull | Traer cambios del remoto y mezclarlos en la rama actual. |
| Push | Push | Subir commits locales al repositorio remoto. |
| Fetch | Fetch | Descargar referencias del remoto sin mezclarlas. |

## Plataformas y servicios

| Español | English | Definición |
|---|---|---|
| Pull Request (PR) | Pull Request (PR) | Propuesta de cambios para revisión y aprobación. |
| Code Review | Code Review | Revisión de código por pares antes del merge. |
| Discusión | Discussion | Espacio de conversación asíncrona en GitHub/GitLab. |
| Issue | Issue | Reporte de bug, feature request o pregunta. |
| Milestone | Milestone | Agrupador de issues/PRs hacia un objetivo o release. |
| Label | Label | Etiqueta categórica aplicada a issues/PRs. |
| Branch protection | Branch protection | Reglas de protección aplicadas a una rama (PRs obligatorios, approvals, etc.). |
| Fork | Fork | Copia personal de un repositorio ajeno bajo tu cuenta. |
| Pull Request draft (borrador) | Pull Request draft | PR en estado de borrador que no se puede mergear. |
| Code owner | Code owner | Persona designada para revisar cambios en ciertos paths (CODEOWNERS). |

## Autenticación y criptografía

| Español | English | Definición |
|---|---|---|
| Llave SSH | SSH key | Par de claves pública/privada para autenticación SSH. |
| Llave pública | Public key | Componente público de la llave SSH que se comparte con el servidor. |
| Llave privada | Private key | Componente secreto de la llave SSH que nunca debe compartirse. |
| Frase de paso (passphrase) | Passphrase | Contraseña opcional para proteger una llave privada. |
| ssh-agent | ssh-agent | Proceso en memoria que gestiona llaves SSH desbloqueadas. |
| Ed25519 | Ed25519 | Algoritmo moderno de llave SSH/GPG, recomendado sobre RSA. |
| RSA | RSA | Algoritmo clásico de llave SSH/GPG; usar 4096 bits si es necesario. |
| Fingerprint | Fingerprint | Huella criptográfica que identifica una llave SSH. |
| GnuPG (GPG) | GnuPG (GPG) | Herramienta estándar para firmar y cifrar criptográficamente. |
| Llave GPG | GPG key | Par de claves pública/privada generadas con GnuPG. |
| Firma criptográfica | Cryptographic signature | Prueba matemática de identidad sobre un commit, tag o merge. |
| Verificado (badge) | Verified (badge) | Estado visible en GitHub cuando la firma del commit es válida. |
| Certificado de revocación | Revocation certificate | Archivo `.rev` para invalidar una llave GPG comprometida. |

## Archivos y formatos

| Español | English | Definición |
|---|---|---|
| Markdown (`.md`) | Markdown (`.md`) | Lenguaje de marcado ligero para documentación. |
| YAML (`.yml`) | YAML (`.yml`) | Formato de serialización legible, usado en workflows y configs. |
| JSON (`.json`) | JSON (`.json`) | Formato de intercambio de datos estructurados. |
| README | README | Archivo principal de presentación de un repositorio. |
| LICENSE | LICENSE | Archivo que declara los términos legales del proyecto. |
| `.gitignore` | `.gitignore` | Archivo con patrones de archivos que Git debe ignorar. |
| `.gitattributes` | `.gitattributes` | Archivo con atributos por path (diff, export, linguist). |
| `.editorconfig` | `.editorconfig` | Archivo con convenciones de estilo para editores. |
| `CODEOWNERS` | `CODEOWNERS` | Archivo que asigna revisores obligatorios por path. |
| `AGENTS.md` | `AGENTS.md` | Contrato operativo entre agentes de IA y colaboradores. |

## Workflow

| Español | English | Definición |
|---|---|---|
| Conventional Commits | Conventional Commits | Convención de mensajes de commit con tipos (`feat:`, `fix:`). |
| Gitmoji | Gitmoji | Convención de commits con emojis como prefijo (`:sparkles:`, `:bug:`). |
| Linear history | Linear history | Política de merges solo con rebase o squash (sin merge commits). |
| Squash merge | Squash merge | Combinar todos los commits del PR en uno solo al mergear. |
| Force push | Force push | Sobrescribir el historial remoto (peligroso, usar `--force-with-lease`). |
| `gitmoji-commiter` | `gitmoji-commiter` | Agente del repo que sugiere mensajes con gitmoji. |
| `traductor-en` | `traductor-en` | Agente del repo que traduce ES → EN manteniendo el mirror. |
| `lint-ci` | `lint-ci` | Agente del repo que ejecuta markdownlint, lychee y codespell. |
| `mkdocs-builder` | `mkdocs-builder` | Agente del repo que valida `mkdocs build --strict`. |
| `revisor-pr` | `revisor-pr` | Agente del repo que prepara PRs en español y en draft. |

## Próximo paso

Volvé al [Inicio](index.md) para repasar todo el material o
explorar los capítulos específicos desde el menú de navegación.
