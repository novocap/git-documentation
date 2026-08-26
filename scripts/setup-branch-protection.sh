#!/usr/bin/env bash
# ============================================================================
# Script: setup-branch-protection.sh
# Descripción: aplica las reglas de protección de la rama `main` con los
#              status checks del CI (Fase 5) como obligatorios. Equivale a
#              lo que documenta `.opencode/skills/branch-protection-rules/SKILL.md`
#              pero aplicado en vivo vía `gh api`.
#
# Uso:
#   ./scripts/setup-branch-protection.sh
#
# Requisitos:
#   - gh CLI autenticada con scope `repo` (admin del repositorio).
#   - jq para formatear la salida.
#
# Idempotente: si la protección ya existe, la sobrescribe con el payload
# declarado en este script. Para verificar el estado actual sin
# modificar nada, usar `gh api /repos/:owner/:repo/branches/main/protection`.
# ============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuración
# ---------------------------------------------------------------------------
OWNER="${GITHUB_REPOSITORY_OWNER:-novocap}"
REPO="${GITHUB_REPOSITORY_NAME:-Novocap.Learning.Git.Docs}"
BRANCH="${BRANCH:-main}"

# Status checks = nombres EXACTOS de los jobs en .github/workflows/ci.yml.
# Ver `.github/workflows/ci.yml` para mantener este array sincronizado.
STATUS_CHECKS=(
  "lint-markdown"
  "check-links"
  "spell-check"
  "build"
)

# ---------------------------------------------------------------------------
# Payload (consistente con .opencode/skills/branch-protection-rules/SKILL.md)
# ---------------------------------------------------------------------------
PAYLOAD=$(cat <<EOF
{
  "required_status_checks": {
    "strict": true,
    "contexts": [$(printf '"%s",' "${STATUS_CHECKS[@]}" | sed 's/,$//')]
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
EOF
)

# ---------------------------------------------------------------------------
# Pre-flight
# ---------------------------------------------------------------------------
echo "==> Verificando autenticación de gh CLI..."
if ! gh auth status >/dev/null 2>&1; then
  echo "ERROR: gh CLI no está autenticada. Corré 'gh auth login' primero." >&2
  exit 1
fi

echo "==> Aplicando protección a ${OWNER}/${REPO}@${BRANCH}..."
echo "    Status checks requeridos: ${STATUS_CHECKS[*]}"

# ---------------------------------------------------------------------------
# Aplicar
# ---------------------------------------------------------------------------
gh api \
  --method PUT \
  -H "Accept: application/vnd.github+json" \
  "/repos/${OWNER}/${REPO}/branches/${BRANCH}/protection" \
  --input - <<< "$PAYLOAD"

echo "==> Listo. Verificá con:"
echo "    gh api /repos/${OWNER}/${REPO}/branches/${BRANCH}/protection | jq ."
