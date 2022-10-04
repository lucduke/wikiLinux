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

# Vider le swap
swapoff -a && swapon -a
```



## Les disques

### Récupérer des informations 

```shell
# Informations sur les disques
sudo hdparm -i /dev/sda

# Informations SMART sur les disques
## Pour vérifier si les infos SMART sont disponibles
sudo smartctl --health --info /dev/sda
--> On doit trouver les 2 lignes suivantes
----> SMART support is: Available - device has SMART capability.
----> SMART support is: Enabled
## Pour afficher la durée approx des tests
sudo smartctl --capabilities /dev/sda
## Pour lancer le test rapide
sudo smartctl --test short /dev/sda
## Pour lancer le test long
sudo smartctl --test long /dev/sda
## Pour affichier les résultats du test
sudo smartctl --log selftest /dev/sda
sudo smartctl -a /dev/sda

# Lister les périphériques block
lsblk

# Récupérer UUID des partitions
blkid
lsblk -fe7
```

### Monter des systèmes de fichiers

```shell
# Afficher tous les points de montage
mount
# Monter tous les systèmes de fichiers déclarés dans /etc/fstab
mount -a
# Démonter tous les systèmes de fichiers déclarés dans /etc/fstab
umount -a
# Démonter un point de montage particulier (ex: /home/)
umount <pointMontage>
# Monter un système de fichier particulier dans un point de montage
mount /dev/sdb1 /mnt/disk1
```

### FSTAB
#### Structure

```text
<filesystem><mount point><filesystem types><mount options><dump><passno>
```

#### Options
```text
defaults : rw,suid,dev,exec,auto,nouser,async
rw : read-write
ro : read-only
exec : Permit execution of binaries
noexec : Do not permit direct execution of any binaries
auto : Can be mounted with the -a option
no auto : Can only be mounted explicitly
nofail : Do not report errors for this device if it does not exist
discard : Spécifique SSD (activation du trim, amélioration durée/perf)
sync/async : i/o réalisé en synchrone ou asynchrone
noatime/relatime : mettre à jour ou pas l'accès à l'inode
user/nouser : les users ou seul root peuvent monter le FS
_netdev : device accessible par réseau
uid= / gid= : spécification des users si hors linux 
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
df -hT -x tmpfs
# Pour l'affichage de la taille d'un dossier et des sous-dossiers
du -hsc
# Pour connaitre les dossiers qui prennent le plus de place (-x pour exclure les répertoires réseaux)
ncdu / -x
```

### Réparer un système de fichier

```bash
sudo fsck.ext4 -f /dev/sda1
```

