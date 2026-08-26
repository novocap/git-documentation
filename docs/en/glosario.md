# Glossary

Bilingual table of technical terms for Git, GitHub, SSH, GPG, and
associated tools. Each entry has the term in English, its Spanish
counterpart, and a brief definition.

!!! tip "How to use this glossary"
    - If your working language is English: use the **EN** column as
      your primary reference and the **ES** column when reading
      Spanish documentation.
    - If your working language is Spanish: the mirror file
      [`docs/es/glosario.md`](../es/glosario.md) reverses the column
      order for natural reading from Spanish.

## Core concepts

| English | Español | Definition |
|---|---|---|
| Repository | Repositorio | Versioned store of files under Git control. |
| Remote repository | Repositorio remoto | Replica of the repository hosted on a server (GitHub, GitLab, etc.). |
| Branch | Rama | Independent development line; a pointer to a commit. |
| Main branch | Rama principal | Default branch of the repository (`main` on GitHub, GitLab, and other platforms since 2020). |
| Commit | Commit | Versioned snapshot of the repository state, identified by a hash. |
| Hash (SHA-1) | Hash (SHA-1) | Unique 40-character hexadecimal identifier Git assigns to each commit. |
| Working Directory | Working Directory | Local folder where files are being edited. |
| Staging Area (Index) | Staging Area (Index) | Intermediate area where files are prepared for the next commit. |
| Git Directory (`.git/`) | Git Directory (`.git/`) | Hidden folder that stores the repository's complete history. |
| HEAD | HEAD | Internal Git pointer that indicates the active branch and commit. |
| Working tree | Working tree | Synonym of Working Directory. |
| Detached HEAD | Detached HEAD | State where `HEAD` points directly to a commit, not to a branch. |

## Operations

| English | Español | Definition |
|---|---|---|
| Clone | Clonar | Download a complete copy of a remote repository. |
| Commit | Confirmar | Record changes from the staging area in the history. |
| Merge | Fusionar | Combine the changes from one branch into another. |
| Rebase | Rebase | Reapply commits of one branch on top of another branch's tip. |
| Cherry-pick | Cherry-pick | Apply a specific commit from another branch onto the current one. |
| Reset | Reset | Move `HEAD` (and optionally the staging/working tree) to a previous commit. |
| Revert | Revert | Create a new commit that undoes the changes of a previous commit. |
| Stash | Stash | Save uncommitted changes in a temporary stack. |
| Tag | Tag | Immutable mark on a commit (used for releases). |
| Pull | Pull | Bring changes from the remote and merge them into the current branch. |
| Push | Push | Upload local commits to the remote repository. |
| Fetch | Fetch | Download references from the remote without merging them. |

## Platforms and services

| English | Español | Definition |
|---|---|---|
| Pull Request (PR) | Pull Request (PR) | Proposal of changes for review and approval. |
| Code Review | Code Review | Peer code review before the merge. |
| Discussion | Discusión | Asynchronous conversation space on GitHub/GitLab. |
| Issue | Issue | Bug report, feature request, or question. |
| Milestone | Milestone | Grouping of issues/PRs toward a goal or release. |
| Label | Label | Categorical tag applied to issues/PRs. |
| Branch protection | Branch protection | Protection rules applied to a branch (mandatory PRs, approvals, etc.). |
| Fork | Fork | Personal copy of someone else's repository under your account. |
| Draft Pull Request | Pull Request draft (borrador) | PR in draft state that cannot be merged. |
| Code owner | Code owner | Person designated to review changes on certain paths (CODEOWNERS). |

## Authentication and cryptography

| English | Español | Definition |
|---|---|---|
| SSH key | Llave SSH | Public/private key pair for SSH authentication. |
| Public key | Llave pública | Public component of the SSH key that is shared with the server. |
| Private key | Llave privada | Secret component of the SSH key that must never be shared. |
| Passphrase | Frase de paso (passphrase) | Optional password to protect a private key. |
| ssh-agent | ssh-agent | In-memory process that manages unlocked SSH keys. |
| Ed25519 | Ed25519 | Modern SSH/GPG key algorithm, recommended over RSA. |
| RSA | RSA | Classic SSH/GPG key algorithm; use 4096 bits if needed. |
| Fingerprint | Fingerprint | Cryptographic fingerprint that identifies an SSH key. |
| GnuPG (GPG) | GnuPG (GPG) | Standard tool for cryptographic signing and encryption. |
| GPG key | Llave GPG | Public/private key pair generated with GnuPG. |
| Cryptographic signature | Firma criptográfica | Mathematical proof of identity on a commit, tag, or merge. |
| Verified (badge) | Verificado (badge) | Status visible on GitHub when a commit's signature is valid. |
| Revocation certificate | Certificado de revocación | `.rev` file used to invalidate a compromised GPG key. |

## Files and formats

| English | Español | Definition |
|---|---|---|
| Markdown (`.md`) | Markdown (`.md`) | Lightweight markup language for documentation. |
| YAML (`.yml`) | YAML (`.yml`) | Human-readable serialization format, used in workflows and configs. |
| JSON (`.json`) | JSON (`.json`) | Structured data interchange format. |
| README | README | Main presentation file of a repository. |
| LICENSE | LICENSE | File that declares the legal terms of the project. |
| `.gitignore` | `.gitignore` | File with patterns of files Git should ignore. |
| `.gitattributes` | `.gitattributes` | File with per-path attributes (diff, export, linguist). |
| `.editorconfig` | `.editorconfig` | File with style conventions for editors. |
| `CODEOWNERS` | `CODEOWNERS` | File that assigns mandatory reviewers per path. |
| `AGENTS.md` | `AGENTS.md` | Operating contract between AI agents and collaborators. |

## Workflow

| English | Español | Definition |
|---|---|---|
| Conventional Commits | Conventional Commits | Commit message convention with types (`feat:`, `fix:`). |
| Gitmoji | Gitmoji | Commit convention with emojis as prefix (`:sparkles:`, `:bug:`). |
| Linear history | Linear history | Merge policy allowing only rebase or squash (no merge commits). |
| Squash merge | Squash merge | Combine all PR commits into one when merging. |
| Force push | Force push | Overwrite remote history (dangerous, use `--force-with-lease`). |
| `gitmoji-commiter` | `gitmoji-commiter` | Repo agent that suggests gitmoji commit messages. |
| `traductor-en` | `traductor-en` | Repo agent that translates ES → EN maintaining the mirror. |
| `lint-ci` | `lint-ci` | Repo agent that runs markdownlint, lychee, and codespell. |
| `mkdocs-builder` | `mkdocs-builder` | Repo agent that validates `mkdocs build --strict`. |
| `revisor-pr` | `revisor-pr` | Repo agent that prepares PRs in Spanish and in draft. |
| `redactor-es` | `redactor-es` | Repo agent that writes/edits documentation in Spanish. |

## Next step

Go back to [Home](index.md) to review all the material, or
explore specific chapters from the navigation menu.
