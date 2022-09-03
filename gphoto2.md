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

