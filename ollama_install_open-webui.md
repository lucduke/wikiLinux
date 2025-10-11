# Open-WebUI

## Source du projet
https://github.com/open-webui/open-webui

## Installation
On commence par créer un répertoire de travail

```bash
mkdir open-webui
```

On crée ensuite un environnement virtuel Python 3.11 dans ce répertoire
```bash
cd open-webui
sudo dnf install python3.11
python3.11 -m venv open-webui-venv
```

On active cet environnement
```bash
source open-webui-venv/bin/activate
```

Pour le désactiver si besoin
```bash
deactivate
```

Dans l'environnement virtuel, on installe le paquet via pip
```bash
pip install --upgrade pip
pip install open-webui
```

On démarre Open-Webui
```bash
open-webui serve
```

## Mise à jour
```bash
source open-webui-venv/bin/activate
pip install --upgrade open-webui
```

## Connexion
Dans son navigateur, ouvrir la page http://localhost:8080 et créer un compte admin




