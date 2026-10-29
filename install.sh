#!/bin/bash
# Installe la configuration Claude Code de Cecilia dans ~/.claude (réglages globaux, valables pour tous les dossiers).
# Fusionne avec un settings.json existant sans écraser les autres réglages.
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)/claude"
DEST="$HOME/.claude"
mkdir -p "$DEST/hooks"

cp "$SRC/hooks/session-start-memoire.sh" "$DEST/hooks/"
chmod +x "$DEST/hooks/session-start-memoire.sh"

if [ -f "$DEST/settings.json" ]; then
  cp "$DEST/settings.json" "$DEST/settings.json.bak"
  # Fusion : nos clés l'emportent, le hook SessionStart n'est ajouté qu'une fois.
  jq -s '
    .[0] as $old | .[1] as $new
    | ($old * ($new | del(.hooks)))
    | .hooks.SessionStart = ((($old.hooks.SessionStart // []) + $new.hooks.SessionStart) | unique)
  ' "$DEST/settings.json.bak" "$SRC/settings.json" > "$DEST/settings.json"
else
  cp "$SRC/settings.json" "$DEST/settings.json"
fi

echo "Configuration installée dans $DEST (ancienne version : settings.json.bak si elle existait)."
