# Open Interpreter

Lien vers la documentation : <https://github.com/KillianLucas/open-interpreter?tab=readme-ov-file>

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

On ajoute sa clef API OPENAI

```bash
{ echo '' ; echo '# Ajout de la clef API OPENAI' ; echo 'export OPENAI_API_KEY=your_api_key' ; } | tee -a ~/.bashrc
source .bashrc
```

Pour utiliser GPT-3.5 au lieu de GPT-4

```bash
interpreter --model gpt-3.5-turbo
```
