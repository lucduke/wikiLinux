# Tutoriel sur la commande `inxi` sous Linux

## Introduction

`inxi` est un outil en ligne de commande qui fournit des informations détaillées sur le matériel et le système d'exploitation d'un ordinateur. Il est particulièrement utile pour diagnostiquer des problèmes et partager des informations système avec des forums de support.

## Installation sur Debian/Ubuntu

Pour installer `inxi` sur une distribution basée sur Debian ou Ubuntu, utilisez la commande suivante :

```sh
sudo apt-get install inxi
```

## Utilisation de base

La syntaxe de base de la commande inxi est la suivante :

```sh
inxi [options]
```

## Options courantes

Voici quelques-unes des options les plus couramment utilisées avec la commande inxi :

* -F : Affiche toutes les informations disponibles.
* -I : Affiche les informations générales
* -M : Affiche les informations sur la machine.
* -C : Affiche les informations sur le CPU.
* -m : Affiche les informations sur la memoire.
* -j : Affiche les informations sur le swap.
* -J : Affiche les informations sur les périphériques USB.
* -D : Affiche les informations sur les disques.
* -P : Affiche les informations sur les partitions.
* -A : Affiche les informations sur l'audio.
* -G : Affiche les informations sur le GPU.
* -i : Affiche les informations sur le réseau.
* --bluetooth : Affiche les informations sur le bluetooth.
* -t : Affiche les informations sur le top 5 des processus.
* -S : Affiche les informations sur le système d'exploitation.
* -r : Affiche les informations sur les dépots actifs/inactifs sur ma machine
* --sensors : Affiche les informations sur les capteurs de temperature
* -B : Affiche les informations sur la batterie.
* -W Puteaux,France : Affiche les informations sur la météo de la ville et du pays.
