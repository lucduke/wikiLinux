# Création d'un RAID 1 sous debian

## Étape 1 : Installation des outils nécessaires

Assurez-vous que votre système Debian 12 est correctement installé et fonctionne avec les deux disques durs que vous souhaitez utiliser pour le RAID 1.
Ouvrez un terminal en tant qu'utilisateur root ou utilisez la commande sudo pour exécuter les commandes.

## Étape 2 : Configuration du RAID

Installez les utilitaires nécessaires pour gérer les RAID sous Linux :

```bash
sudo apt update
sudo apt install mdadm
```

Lors de l'installation de mdadm, vous pouvez être invité à sélectionner "Oui" pour configurer un RAID automatiquement. Choisissez "Non" car nous allons le configurer manuellement.

On active ensuite le service mdmonitor s'il n'est pas actif
```bash
sudo systemctl status mdmonitor
sudo systemctl start mdmonitor
```

On va ensuite créer les partitions sur les 2 disques sdX et sdY séléctionnés pour le stockage RAID (remplacez /dev/sdX et /dev/sdY par les identifiants corrects de vos disques)
```bash
sudo fdisk /dev/sdX
```

On entre ensuite les commandes suivantes :
- `d` pour supprimer les éventuelles partitions existantes
- `n` pour créer une nouvelle partition
- `p` pour créer une partition primaire
- `1` pour le numéro de partition attribué
- On appuie ensuite 2 fois sur `ENTER` pour valider le 1er et le dernier secteur car on souhaite que la partition occupe tout le disque
- `t` pour changer le type de partition
- `fd` pour sélectionner RAID Linux auto
- `w` pour valider les actions

On execute ensuite `lsblk` pour visualiser les partitions créés

## Étape 3 : Création du RAID 1

Lancez la commande suivante pour créer le RAID 1 avec les deux disques (remplacez /dev/sdX et /dev/sdY par les identifiants corrects de vos disques) :

```bash
sudo mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdX1 /dev/sdY1
```

Vérifiez l'avancement de la synchronisation en utilisant les commandes suivantes :

```bash
sudo cat /proc/mdstat
sudo mdadm -D /dev/md0
```

On renseigne ensuite dans la configuration de mdadm la correspondance entre le périphérique md0 et son UUID

```bash
sudo mdadm -D --detail --scan | tee -a /etc/mdadm/mdadm.conf
```

On enregistre pour persister ce nouveau device au boot
```bash
sudo update-initramfs -u
```

Une fois la synchronisation terminée, vous pouvez créer un système de fichiers sur le RAID. Par exemple, pour créer un système de fichiers ext4 :

```bash
sudo mkfs.ext4 -m 1 /dev/md0
```

## Étape 4 : Montage du RAID

Créez un point de montage pour le RAID 1 :

```bash
sudo mkdir -p /srv/raid
```

Montez le RAID sur ce point de montage :
```bash
sudo mount /dev/md0 /srv/raid
```

## Étape 5 : Configuration du montage automatique

Executer la ligne suivante pour monter automatiquement le RAID au démarrage (remplacez les options par celles qui vous conviennent, par exemple, defaults pour les options par défaut) :
```bash
sudo echo '/dev/md0 /srv/raid ext4 defaults,nofail 0 0' | tee -a \etc\fstab
```

## Étape 6 : Redémarrage et vérification

Redémarrez votre système pour vous assurer que tout se monte correctement au démarrage :
```bash
sudo reboot
```

Après le redémarrage, vérifiez que le RAID est monté avec la commande :
```bash
df -h
```

## Étape 7 (optionnelle) : Gestion des droits

On confie la propriété du dossier `raid` et des sous-dossiers à un groupe éponyme. J'associe ensuite ce groupe à mon utilisateur courant

```bash
sudo addgroup raid
sudo chown -R root:raid /srv/raid
sudo chmod -R 775 /srv/raid
sudo usermod -G raid christophe
```

Voilà, vous avez configuré avec succès un RAID 1 sous Debian 12 ! Assurez-vous de toujours garder une copie de sauvegarde de vos données importantes et de surveiller régulièrement l'état du RAID avec les commandes `cat /proc/mdstat` ou `mdadm -D /dev/md0`.