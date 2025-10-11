# Ollama

## Source
https://github.com/ollama/ollama/blob/main/docs/linux.md

## Installation

Pour installer Ollama, exécutez la commande suivante :

```shell
curl -fsSL https://ollama.com/install.sh | sh
```

## Desinstallation

Supprimer le service "ollama" :

```shell
sudo systemctl stop ollama
sudo systemctl disable ollama
sudo rm /etc/systemd/system/ollama.service
```

Supprimer les librairies ollama

```shell
sudo rm $(which ollama)
```

Supprimer les modeles téléchargés, l'utilisateur et le groupe associé au service ollama:

```shell
sudo rm -r /usr/share/ollama
sudo userdel ollama
sudo groupdel ollama
```

Supprimer les librairies installées :

```shell
sudo rm -rf /usr/local/lib/ollama
```

## Démarrage du service

```shell
ollama serve
ollama -v
```

## Ajout d'un modele

Exemple Qwen3

```shell
ollama pull qwen3:8b
ollama run qwen3:8b
```

Pour le supprimer
```shell
ollama rm qwen3:8b
```
