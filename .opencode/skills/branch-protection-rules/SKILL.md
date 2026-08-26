---
name: branch-protection-rules
description: Payload JSON exacto y comandos gh api para activar la protección de la rama master y habilitar GitHub Pages. Usar durante la Fase 6 (proteger master) o cuando el usuario pida "activá la protección".
---

# Skill: branch-protection-rules

Procedimiento para configurar la protección de la rama `master` en
`novocap/git-documentation` y para habilitar GitHub Pages. **No se puede
hacer con un PR**: requiere ejecutar `gh api` con permisos de admin
desde la terminal del humano.

## Prerrequisitos

- `gh` CLI autenticado con un token que tenga permisos de admin sobre
  el repo:

  ```bash
  gh auth status
  gh repo set-default novocap/git-documentation
  ```

- El repo debe existir y vos debes ser admin o tener la permission
  `Administration: Write`.

## Reglas de protección de `master` (Fase 6)

### Política decidida por el equipo

- **PR obligatorio** antes de mergear a `master`.
- **Status checks obligatorios**:
  - `ci / lint`
  - `ci / links`
  - `ci / build`
- **Sin approvals obligatorios** (control procedimental por Draft).
- **Linear history**: solo `rebase` o `squash` merge.
- **Sin force-push**.
- **Sin delete branch**.
- **`enforce_admins: false`** (los admins pueden mergear sus propios
  PRs ya mergeados como Ready).
- **`required_conversation_resolution: true`**.

### Payload JSON

```json
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["ci / lint", "ci / links", "ci / build"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": null,
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "required_conversation_resolution": true,
  "block_creations": false
}
```

> **Nota**: hasta que los workflows de CI existan (Fase 5), los status
> checks referenciados no van a existir todavía. Aplicar la protección
> **después** de mergear Fase 5.

### Comandos

Guardar el payload en un archivo temporal:

```bash
cat > /tmp/master-protection.json <<'JSON'
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["ci / lint", "ci / links", "ci / build"]
  },
  "enforce_admins": false,
  "required_pull_request_reviews": null,
  "restrictions": null,
  "required_linear_history": true,
  "allow_force_pushes": false,
  "allow_deletions": false,
  "required_conversation_resolution": true,
  "block_creations": false
}
JSON
```

Aplicar la protección:

```bash
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  /repos/novocap/git-documentation/branches/master/protection \
  --input /tmp/master-protection.json
```

Verificar:

```bash
gh api /repos/novocap/git-documentation/branches/master/protection | jq .
```

## Habilitar GitHub Pages

Después de mergear Fase 5 (workflows + mkdocs.yml), habilitar Pages:

### Vía UI

1. Ir a `https://github.com/novocap/git-documentation/settings/pages`.
2. En **Source**, seleccionar **GitHub Actions**.
3. Save.

### Vía CLI

```bash
# Configurar Pages para que use GitHub Actions como source
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

Verificar:

```bash
gh api /repos/novocap/git-documentation/pages | jq .
```

## Activación del deploy

El sitio quedará accesible en:

```text
https://novocap.github.io/git-documentation/
```

El deploy se dispara automáticamente en cada merge a `master` (gracias
al workflow `deploy.yml` de Fase 5).

## Cuándo invocar esta skill

- Cuando se llega a la **Fase 6** del plan.
- Cuando el usuario pide "activá la protección" o "habilitá Pages".

## Lo que la skill NO hace

- **No aplica la protección.** Solo devuelve los comandos. El humano
  los corre.
- **No crea el sitio en GitHub Pages.** Pages es un setting del repo,
  no un archivo en el repo.
- **No genera los workflows de CI.** Eso es Fase 5.

## Output esperado

Devolvé al orquestador:

1. Confirmación de que la skill fue invocada en la fase correcta
   (después de Fase 5).
2. Bloque con los comandos `gh api` listos para copiar y pegar.
3. URL del sitio esperada.
4. Pasos de verificación (cómo comprobar que la protección está activa
   y que Pages está habilitado).
