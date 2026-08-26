---
name: branch-protection-rules
description: Payload JSON exacto y comandos gh api para activar la protección de la rama main con los status checks del CI como obligatorios. Usar durante la Fase 6 (proteger main) o cuando el usuario pida "activá la protección".
---

# Skill: branch-protection-rules

Procedimiento para configurar la protección de la rama `main` en
`novocap/git-documentation`. **No se puede hacer con un PR**: requiere
ejecutar `gh api` con permisos de admin desde la terminal del humano,
o disparar el workflow `setup-branch-protection` desde la UI de
GitHub Actions.

## Prerrequisitos

### Vía CLI local

- `gh` CLI autenticada con un token que tenga permisos de admin sobre
  el repo:

  ```bash
  gh auth status
  gh repo set-default novocap/git-documentation
  ```

- El repo debe existir y vos debes ser admin o tener la permission
  `Administration: Write`.

### Vía workflow (recomendada)

1. Mergea el PR de Fase 6 (`chore/fase-6-proteccion-main`) a `main`.
2. Andá a https://github.com/novocap/git-documentation/actions/workflows/setup-branch-protection.yml
3. Click **Run workflow** → **Run**.
4. Esperá ~30 segundos. El environment `setup-branch-protection` muestra
   el resultado.

## Reglas de protección de `main` (Fase 6)

### Política decidida por el equipo

- **PR obligatorio** antes de mergear a `main`.
- **Status checks obligatorios** (los nombres exactos de los jobs de
  `.github/workflows/ci.yml`):
  - `lint-markdown`
  - `check-links`
  - `spell-check`
  - `build`
- **`strict: true`**: las reglas requieren estar al día con la rama
  antes de mergear.
- **Sin approvals obligatorios** (control procedimental por Draft).
- **Linear history**: solo `rebase` o `squash` merge.
- **Sin force-push**.
- **Sin delete branch**.
- **`enforce_admins: false`** (los admins pueden mergear si hace falta).
- **`required_conversation_resolution: true`**.

### Payload JSON (canónico)

```json
{
  "required_status_checks": {
    "strict": true,
    "contexts": [
      "lint-markdown",
      "check-links",
      "spell-check",
      "build"
    ]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": null,
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "required_conversation_resolution": true,
  "block_creations": false,
  "lock_branch": false,
  "allow_fork_syncing": false
}
```

> **Importante**: si los nombres de los jobs en `ci.yml` cambian
> (ejemplo: `lint-markdown` → `lint`), actualizá este payload en
> paralelo. El CI falla si los nombres no matchean exactamente.

## Vías de aplicación

### Vía 1 · Script local

El repo incluye `scripts/setup-branch-protection.sh` que aplica el
payload de arriba idempotentemente. Corre:

```bash
./scripts/setup-branch-protection.sh
```

El script:

- Verifica que `gh` esté autenticada.
- Hace PUT al endpoint de GitHub con el payload.
- Reporta éxito y cómo verificar.

### Vía 2 · Workflow `setup-branch-protection.yml`

`.github/workflows/setup-branch-protection.yml` expone la misma
funcionalidad via `workflow_dispatch`. Ver la sección "Vía workflow"
arriba. Útil cuando:

- Querés aplicar la protección después de mergear Fase 6.
- Querés re-aplicarla si alguien la cambió accidentalmente.
- No podés correr scripts locales con `gh` autenticada.

### Vía 3 · Manual con `gh api` (legacy)

Si preferís invocar el comando a mano:

```bash
cat > /tmp/main-protection.json <<'JSON'
{
  "required_status_checks": {
    "strict": true,
    "contexts": [
      "lint-markdown",
      "check-links",
      "spell-check",
      "build"
    ]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": null,
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "required_conversation_resolution": true,
  "block_creations": false,
  "lock_branch": false,
  "allow_fork_syncing": false
}
JSON

gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  /repos/novocap/git-documentation/branches/main/protection \
  --input /tmp/main-protection.json
```

## Verificación

Después de aplicar, confirmá con:

```bash
gh api /repos/novocap/git-documentation/branches/main/protection | jq .
```

Deberías ver:

```json
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["lint-markdown", "check-links", "spell-check", "build"],
    "checks": [...]
  },
  "enforce_admins": {...},
  "required_pull_request_reviews": null,
  ...
}
```

## Habilitar GitHub Pages

⚠️ **Esto ya se hizo en Fase 5.** Si lo necesitás re-aplicar porque
se desactivó:

### Vía UI

1. Andá a https://github.com/novocap/git-documentation/settings/pages.
2. En **Source**, elegí **GitHub Actions**.
3. Save.

### Vía CLI

```bash
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /repos/novocap/git-documentation/pages \
  --input - <<'JSON'
{
  "build_type": "workflow"
}
JSON
```

## Migrar deployment branch policies al renombrar la rama

> **Descubierto en Fase 7**: cuando se renombra la rama por defecto
> (ej. `master` → `main`), la environment `github-pages` **no se
> actualiza sola**. Si no se migran las deployment branch policies,
> el primer push a la rama nueva falla con
> `Branch "main" is not allowed to deploy to github-pages due to
> environment protection rules`.

La environment `github-pages` mantiene un `branch_policy` que lista
explícitamente qué ramas pueden desplegar. Si la rama por defecto
cambia, hay que:

### 1. Listar las policies actuales

```bash
gh api /repos/novocap/git-documentation/environments/github-pages/deployment-branch-policies
```

Devuelve algo como:

```json
{
  "total_count": 1,
  "branch_policies": [
    {
      "id": 58271084,
      "name": "master",
      "type": "branch"
    }
  ]
}
```

### 2. Agregar la nueva rama

⚠️ El parámetro es `name`, **no** `branch` (la API rechaza `branch`
con error 422 `Invalid request`).

```bash
gh api \
  --method POST \
  -H "Accept: application/vnd.github+json" \
  /repos/novocap/git-documentation/environments/github-pages/deployment-branch-policies \
  -f name=main
```

### 3. Borrar la policy obsoleta (opcional pero recomendado)

Una vez borrada la rama vieja de origin, su policy queda como
referencia colgante. Limpiarla evita ruido:

```bash
# Reemplazar <id> por el ID de la policy vieja del paso 1
gh api \
  --method DELETE \
  -H "Accept: application/vnd.github+json" \
  /repos/novocap/git-documentation/environments/github-pages/deployment-branch-policies/<id>
```

### 4. Re-disparar el deploy

El deploy workflow puede haber fallado silenciosamente durante el
swap. Re-dispararlo manualmente con `workflow_dispatch`:

```bash
gh workflow run "Deploy to GitHub Pages" --ref main
```

Verificar con:

```bash
gh run list --workflow "Deploy to GitHub Pages" --limit 3
```

## Cuándo invocar esta skill

- Cuando se llega a la **Fase 6** del plan (cierre del flujo).
- Cuando el usuario pide "activá la protección de main".
- Cuando el usuario quiere re-aplicar las reglas tras cambios
  accidentales.

## Lo que la skill NO hace

- **No aplica la protección automáticamente.** Solo devuelve los
  comandos. El humano los corre o dispara el workflow.
- **No crea el sitio en GitHub Pages.** Pages es un setting del repo
  gestionado por el dueño (Fase 5).
- **No genera los workflows de CI.** Eso es Fase 5.

## Output esperado

Devolvé al orquestador:

1. Confirmación de que la skill fue invocada en la fase correcta
   (después de Fase 5).
2. Bloque con los comandos `gh api` listos para copiar y pegar
   (o la indicación de cómo disparar el workflow).
3. URL del sitio esperada.
4. Pasos de verificación (cómo comprobar que la protección está
   activa).
