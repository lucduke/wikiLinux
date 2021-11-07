# Git
Memo pour utiliser les commandes de base de Git



## Installation

```bash
# Pour vérifier s'il est déjà installé
which git

# Pour l'installer
sudo apt instal git
```



## La configuration de base
Pour personnaliser son installation de Git, on commande par saisir les commande suivantes dans son terminal :
```bash
# git config <option> <valeur>
git config --global user.email "mon_adresse@email.com"
git config --global user.name "mon_nom"
git config --global color.ui true
```
Le drapeau --global permet d'indiquer à git que cette configuration est globale et s'applique à tous les projets.

Pour connaitre l'ensemble des des propriétées, saisir la commande suivante dans son terminal :
```bash
git config --list
```



## La commande init

Elle permet d'initialiser un nouveau dépôt git vide.

On se rend donc dans son répertoire de travail et on execute la commande suivante dans le terminal :
```bash
git init
# Ou pour initier un nouveau dépôt de son choix
git init <nomDepot>
```



## La commande status

Elle permet d'obtenir un status sur l'état de notre versioning et fournit un résumé des fichiers qui sont en staging et des fichiers non suivis.
```bash
git status
```



## La commande add

Une spécificité de Git est son système de staging qui permet de sélectionner les fichier à suivre lors du prochain commit.
```bash
git add <fichier>   # Permet de *stage* le fichier
git add <dossier> # Stage tout le dossier
git add *.ext        # Stage tous les fichier finissant par .ext
git add --all            # Stage tous les fichiers (même les ajouts et les suppressions)
```



## La commande commit

Une fois que la zone de staging est prête on va pourvoir faire notre premier commit. Un commit est une étape dans l'historique de votre projet, étape que l'on va pouvoir identifier avec un message particulier
```bash
git commit  # Ouvre un éditeur pour insérer le message de notre commit
git commit -m "Message pour le commit"
```

On utilisera souvent le drapeau -m qui permettra de spécifier directement le message de notre commit
log



## La commande log
Elle permet d'obtenir des informations sur les différents commit de notre projet.
```bash
git log # Récupère et affiche les derniers commit
git log --oneline # Permet d'afficher l'historique avec une ligne par commit (plus lisible)
git log -n <nombre> # Permet de sélectionner le nombre de commit à afficher
git log -p <fichier> # Permet de voir l'historique des commit affectant un fichier en particulier
git log --author <motif> # Permet de voir l'historique par rapport au nom de l'auteur
```

Chaque commit fait dans le projet est identifié par une clef SHA1. C'est cette clef que l'on utilisera pour désigner un commit particulier.



## La commande diff

Elle permet de voir les différence qu'il existe sur un fichier
```bash
git diff 
git diff <fichier>
```



## La commande revert

```bash
git revert <hash SHA1>
```



## Github

Pour générer sa clef RSA, allez dans son répertoire HOME et entrer la commande suivante dans le terminal :
```bash
ssh-keygen -t -b 4096 rsa -C "mon_adresse@email.com"
```
Les clefs privées et publiques se trouvent stockées dans le sous-répertoire .ssh



## La commande remote

Elle permet de créer voir et supprimer des connexions (alias vers le véritable chemin du dépôt)
```bash
git remote # Liste les dépôts distants
git remote -v # Liste les dépôts distants et les chemins associés
git remote add <alias> <chemin/url> # Ajoute un nouveau dépôt distant
git remote rm <alias> # Supprimé un dépôt distant
git remote rename <old> <new>
```



## La commande push

Elle permet de transférer les commits locaux vers le dépôt distant.
```bash
git push <remote> <branche>
git push <remote> --all # Permet d'envoyer toutes les branches
```



## La commande pull

Elle permet de faire un git fetch suivi d'un git merge en une seule commande.
```bash
git pull <remote>
git pull <remote> <branche>
```