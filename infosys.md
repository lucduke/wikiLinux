# Les informations systèmes



## Vision synthétique

```bash
# Lister les différents composants
sudo inxi -F
sudo cpu-x #outils graphiques
sudo lshw
sudo lshw -short
sudo dmidecode

# Lister les périphériques PCI
lspci
lspci -v
lspci -vvv

# Lister les périphériques USB
lsusb

# Lister les périphériques SCSI
lsscsi
```



## La date

```bash
# Pour l'affichage de la date du système
date
# Pour l'affichage du temps de lancement
uptime
```



## Les utilisateurs connectés

```bash
# Pour afficher tous les utilisateurs connectés
w
```



## Les informations CPU

```bash
# Identifier le nombre de processeurs
nproc
# Information sur son CPU
lscpu
more /proc/cpuinfo
```



## Les informations mémoire

```bash
more /proc/meminfo
# La consommation mémoire
free -m
```



## Les disques

### Récupérer des informations 

```shell
# Informations sur les disques
sudo hdparm -i /dev/sda

# Informations SMART sur les disques
sudo smartctl -a /dev/sda

# Lister les périphériques block
lsblk

# Récupérer UUID des partitions
blkid
```

### Monter des systèmes de fichiers

```shell
# Monter tous les systèmes de fichiers déclarés dans /etc/fstab
mount -a
# Démonter tous les systèmes de fichiers déclarés dans /etc/fstab
umount -a
# Démonter un point de montage particulier (ex: /home/)
umount <pointMontage>
# Monter un système de fichier particulier dans un point de montage
mount /dev/sdb1 /mnt/disk1
```

### Gérer les partitions sur un disque (ex: sdb)

```shell
fdisk /dev/sdb
# Pour afficher la table de partition existante, on tape p
# Pour créer une nouvelle table de partition GPT, on tape g
# Pour créer une nouvelle table de partition DOS (MBR), on tape o
# Pour créer une nouvelle partition, on tape n
# Pour écrire la table de partition, on tape w

# Pour écrire un système de fichier sur sa nouvelle partition
mkfs.ext4 /dev/sdb1
mkfs.exfat /dev/sdb1
```

### Connaitre l'espace sur les différents systèmes de fichiers

```bash
# Pour l'affichage des systèmes de fichier
df -hT
# Pour l'affichage de la taille d'un dossier et des sous-dossiers
du -hs
# Pour connaitre les dossiers qui prennent le plus de place (-x pour exclure les répertoires réseaux)
ncdu / -x
```

