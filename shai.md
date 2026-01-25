# SHAI : terminal augmenté par IA

## Installation

Lien github : [https://github.com/ovh/shai](https://github.com/ovh/shai)

Executer la commande suivante :

```bash
curl -fsSL https://raw.githubusercontent.com/ovh/shai/main/install.sh | sh
```

## Utilisation

```bash
# Console en mode interactif
shai
# Configurer d'autres modeles
shai auth
# Utilisation en mode headless
echo "make me a hello world in main.py" | shai
# Utilisation en mode Shell assistant
shai on
shai off
```

## Désactiver le mot de passe pour sudo

Executer la commande suivante :

```bash
sudo visudo
```

Puis dé-commenter la ligne suivante :

```t
# %wheel        ALL=(ALL)       NOPASSWD: ALL
```

Pour savoir si son utilisateur est dans le groupe wheel

```bash
groups
```
