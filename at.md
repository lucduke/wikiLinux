# La commande "at"

## Introduction

La commande "at" est un utilitaire en ligne de commande qui vous permet de planifier l'exécution d'une commande à une heure et une date spécifiques. Cela peut être utile si vous devez exécuter une tâche à une heure où vous ne serez pas disponible ou si vous voulez planifier une tâche à l'avance.

## Installation de "at"

La commande `at` est généralement pré-installée sur la plupart des distributions Linux, y compris Ubuntu. Si vous ne l'avez pas déjà installé, vous pouvez le faire en utilisant la commande suivante :

``` bash
sudo apt install at
systemctl enable --now atd
```

Pour vérifier si la commande "at" est installée :

``` bash
systemctl status atd.service
```

## Syntaxe de la commande "at"

La syntaxe de base de la commande `at` est la suivante :

``` css
at [heure] [date] [options] [commande]
```

- [heure] : L'heure à laquelle la commande doit être exécutée. Cette heure doit être spécifiée au format HH:MM, en utilisant un format 24 heures.
- [date] : La date à laquelle la commande doit être exécutée. Cette date doit être spécifiée au format MM/DD/YYYY.
- [options] : Les options à utiliser avec la commande "at". Les options les plus courantes sont les suivantes :
  - -f : Spécifie le nom du fichier contenant la commande à exécuter.
  - -c : Affiche la commande à exécuter.
  - -r : Supprime une tâche "at" existante.
- [commande] : La commande à exécuter. Cette commande doit être entièrement spécifiée, y compris tous les arguments et les options.

## Exemples d'utilisation de la commande "at"

### Exécution d'une commande à une heure spécifique

``` bash
at 22:30 02/24/2023
ls -l
```

Cet exemple planifie l'exécution de la commande `ls -l` à 22h30 le 24 février 2023.

``` bash
at now + 5 minute
ls -l
```

Cet exemple planifie l'exécution de la commande `ls -l` dans 5 minutes.

### Exécution d'une commande à partir d'un fichier

``` bash
at 22:30 02/24/2023 -f /home/user/script.sh
```

Cet exemple planifie l'exécution du script "script.sh" à 22h30 le 24 février 2023.

### Affichage des tâches "at" en attente

``` bash
atq
```

Cette commande affiche la liste des tâches `at` en attente.

### Suppression d'une tâche "at"

``` css
atrm [numero de tache]
```

Cette commande supprime la tâche `at` correspondant au numéro de tâche spécifié.
