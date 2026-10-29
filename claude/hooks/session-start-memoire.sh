#!/bin/bash
# Rappel injecté au démarrage de chaque session : seule la mémoire centralisée (connecteur « Mémoire ») est utilisée.
cat <<'JSON'
{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"RÈGLE DE CECILIA : la SEULE mémoire à utiliser est la mémoire centralisée (connecteur MCP « Mémoire », outils mcp__M_moire__*). Au début de la session : memory_list puis memory_search / memory_get sur le sujet du jour (charger les outils via ToolSearch si besoin). Pendant la session : enregistrer décisions et infos nouvelles (memory_add / memory_update). En fin de session : faire le point dans cette mémoire. Ne jamais utiliser la mémoire locale de Claude Code (MEMORY.md, auto-memory) ni de fichiers du dépôt comme mémoire."}}
JSON
