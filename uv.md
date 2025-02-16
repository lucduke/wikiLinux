# UV : L'outil ultime pour accélérer votre workflow Python

![UV Logo](https://astral.sh/images/uv-social-banner.png)

**UV** est un nouvel outil développé par [Astral](https://astral.sh/) (les créateurs de Ruff) qui vise à révolutionner la gestion des environnements virtuels et des dépendances en Python. Conçu pour remplacer `pip` et `venv`, il promet des performances jusqu'à **100x plus rapides** que les outils traditionnels.

## Pourquoi utiliser UV ?

### Principales fonctionnalités

- ⚡ **Vitesse extrême** : Résolution de dépendances et installation de packages en quelques secondes
- 🔄 **Compatibilité** : Supporte `requirements.txt`, `pyproject.toml`, et les workflows existants
- 🌍 **Multiplateforme** : Fonctionne sur Windows, macOS et Linux
- 🔒 **Sécurité** : Vérification cryptographique des packages
- 🧩 **Intégration** : Compatible avec les autres outils Astral (comme Ruff)

## Installation

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Utilisation

### Créer un environnement

```bash
uv venv
```

### Installer des packages

```bash
uv pip install pandas numpy 
```

### Synchroniser des dépendances

```bash
uv pip sync requirements.txt
```

### Lister les versions de python installées sur mon système

```bash
uv python list
```

### Installer une version de python sur mon système

Exemple pour la version 3.12

```bash
uv python install 3.12
```

### Initialiser un projet

```bash
uv init
```

### Lancer un script sans requirements / environnement virtuel

On commence par ajouter ces éléments au début du script python

```python
# /// script
# requires-python = ">=3.11"
# dependancies = [
#     "mutagen",
#     "aiohttp"
# ]
# ///
```

Puis on lance son script

```bash
uv run main.py
```
