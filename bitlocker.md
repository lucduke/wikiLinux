# Monter et lire une partition Bitlocker sous linux



## Prérequis

On installe dislocker

```bash
sudo apt update
sudo apt install dislocker
```

On créé 2 partitions

```bash
sudo mkdir -p /media/bitlocker
sudo mkdir -p /media/bitlockermount
# La 1ère permet de stocker une image de la partition décryptée
# La seconde permet de la monter
```



## Décrypter la partition Bitlocker

Dans mon cas, il s'agit d'une clef USB 

```bash
# Pour identifier la partition
sudo lsblk

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

