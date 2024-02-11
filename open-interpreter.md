# Open Interpreter

Lien vers le Github : <https://github.com/KillianLucas/open-interpreter?tab=readme-ov-file>
Lien vers la documentation : <https://docs.openinterpreter.com/getting-started/introduction>

## Installation

### Pré-requis

On installe pipx qui permet de gérer les environnements virtuels python en toute transparence

```bash
pip install pipx
```

### Installation d'open interpreter

```bash
pipx install open-interpreter
```

Pour completer ma varibale PATH

```bash
pipx ensurepath
```

Pour ajouter l'auto-complétion

```bash
pipx completions
{ echo '' ; echo "# Ajout de l'autocomplétion pour pipx" ; echo 'eval "$(register-python-argcomplete pipx)"' ; } | tee -a ~/.bashrc
```

### Paramétrage d'open interpreter

On ajoute ses clefs API OPENAI ou MISTRA-AI

```bash
{ echo '' ; echo '# Ajout de la clef API OPENAI' ; echo 'export OPENAI_API_KEY=your_api_key' ; } | tee -a ~/.bashrc
{ echo '' ; echo '# Ajout de la clef API MISTRAL-AI' ; echo 'export MISTRAL_API_KEY=your_api_key' ; } | tee -a ~/.bashrc
source .bashrc
```

## Utilisation

Par defaut, le modèle utilisé est GPT-4. Pour changer de modele, on peut executer une des commandes suivantes :

```bash
interpreter --model gpt-4
interpreter --model gpt-3.5-turbo
interpreter --model mistral/mistral-tiny
interpreter --model mistral/mistral-small
interpreter --model mistral/mistral-medium
```

Pour débuter une conversation :

```bash
interpreter
# Ou pour désactiver la télémétrie
interpreter --disable_telemetry
```

Pour reprendre une conversation précédente

```bash
interpreter --conversation
```

Pour ajuster la configuration

```bash
interpreter --config
```

Enfin, les commandes utiles depuis le prompt (on peut les afficher en tapant %help)

* %% [commands]: Exécute des commandes dans l'interpréteur de commandes système
* %reset: Réinitialise la session en cours
* %undo: Supprime les messages précédents et leurs réponses de l'historique des messages
* %save_message [path] : Sauvegarde les messages dans un fichier JSON dans le chemin spécifié. Si aucun chemin n'est fourni, il utilise par défaut 'messages.json'
* %load_message [path] : Charge les messages à partir d'un chemin JSON spécifié. Si aucun chemin n'est fourni, il utilise par défaut 'messages.json'
* %tokens [prompt] : EXPERIMENTAL : Calcule les tokens utilisés par la prochaine requête en fonction des messages de la conversation actuelle et estime le coût de cette requête ; optionnellement, fournit une invite pour aussi calculer les tokens utilisés par cette invite et le nombre total de tokens qui seront envoyés avec la prochaine requête
* %help : Génère l'aide
