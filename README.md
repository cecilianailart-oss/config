# Configuration Claude Code de Cecilia

Ma configuration Claude Code, rangée au même endroit pour tous mes appareils.

## Ce qu'elle fait

- **Une seule mémoire : la mémoire centralisée** (connecteur « Mémoire »).
  - La mémoire locale de Claude Code est désactivée (`autoMemoryEnabled: false`).
  - À chaque ouverture de session, un rappel automatique dit à Claude de consulter
    la mémoire centralisée au début, d'y enregistrer les décisions pendant la session
    et de faire le point à la fin.

## Contenu

| Fichier | Rôle |
|---|---|
| `claude/settings.json` | Réglages Claude Code (à mettre dans `~/.claude/`) |
| `claude/hooks/session-start-memoire.sh` | Le rappel lancé au début de chaque session |
| `install.sh` | Installe le tout dans `~/.claude/` |

## Installer sur un ordinateur (Mac ou Linux)

```bash
git clone https://github.com/cecilianailart-oss/config.git
cd config
./install.sh
```

Si un `~/.claude/settings.json` existe déjà, il est fusionné (une copie de l'ancien
est gardée dans `settings.json.bak`). Il faut `jq` installé pour la fusion.

## Sessions Claude Code dans le cloud (claude.ai/code)

Les sessions cloud repartent de zéro à chaque fois : pour y appliquer cette configuration,
ajouter dans le script de configuration de l'environnement :

```bash
git clone --depth 1 https://github.com/cecilianailart-oss/config.git /tmp/config && /tmp/config/install.sh
```

## Claude sur le web, le mobile et l'app de bureau (hors onglet Code)

Pas de fichier ici : c'est la consigne dans les préférences du profil claude.ai qui s'en charge.
