# gPhoto2

## A propos

Cette librairie permet de télécharger les photos stockées sur son iPhone ou de connaitre le nombre de photos prises par mon 5D mkii

## Installation

```bash
sudo apt update
sudo apt install -y gphoto2
```

## Connaître le nombre de photos prises par mon 5D

1- On connecte l'appareil photo au PC en USB

2- On allume l'appareil photo

3- On execute la commande suivante

```bash
gphoto2 --get-config /main/status/shuttercounter
```

NB : si la commande renvoie une erreur, il faut tuer tous les process gPhoto2 faisant référence à "gvfs gphoto" et exécuter la commande de nouveau

```bash
ps aux | grep gphoto2
kill -9 PID1 PID2
```

## Transférer les photos depuis mon iPhone

1- Installation de la librairie des prérequis

```bash
sudo apt install -y ideviceinstaller libimobiledevice-utils ifuse
```

2- On connecte l'iPhone en USB en indiquant que le PC est un appareil de confiance

3- On appaire le PC et l'iPhone

```bash
idevicepair pair
```

4- On monte l'iphone sur un point de montage

```bash
sudo mkdir -p /media/iphone
sudo ifuse /media/iphone
```

5- On transfère les photos depuis l'iPhone vers le PC

```bash
cp -vr /media/iphone/DCIM/* ~/Images
```

6- On démonte l'iPhone du point de montage

```bash
sudo fusermount -u /media/iphone/
```
