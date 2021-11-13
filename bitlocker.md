# Monter et lire une partition chiffrée Bitlocker sous linux



Bitlocker est un système de chiffrement développé par Microsoft et qui permet de chiffrer une partition afin de protéger les données qui y sont stockées.



## Tutoriel vidéos

[Lien vers la vidéo](https://youtu.be/qHcrz6HicNc)



## Prérequis

On installe dislocker

```bash
sudo apt update
sudo apt install dislocker
```

On créé 2 dossiers pour nos futurs points de montage

```bash
sudo mkdir -p /media/bitlocker
sudo mkdir -p /media/bitlockermount
# Le 1ère permet de stocker une image de la partition décryptée
# Le second permet de la monter
```



## Décrypter la partition Bitlocker

Dans mon cas, il s'agit d'une clef USB 

```bash
# Pour identifier la partition
sudo lsblk --output NAME,SIZE,MODEL,SERIAL,TYPE,FSTYPE,MOUNTPOINT,PARTLABEL,UUID

# Avec l'option -u pour décrypter via le mot de passe
sudo dislocker /dev/sdb1 -u -- /media/bitlocker

# Autres options possibles
-p<key> # si clé de restauration
-f<bekfile> # si fichier BEK
```



## Monter la partition décryptée

```bash
sudo mount -o loop /media/bitlocker/dislocker-file /media/bitlockermount
```

