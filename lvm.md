
# Introduction

LVM est un système de gestion de volumes logiques qui permet de créer des partitions dynamiques dans Linux. Il est utile pour gérer l'espace disque de manière flexible et permet de créer, supprimer, agrandir ou réduire des volumes logiques sans avoir besoin de redimensionner des partitions physiques.

Ilustration

``` css
# Sans LVM
Disk > partitions > filesystem

# Avec LMV
Disk > Physical Volumes > Volume Groups > Logical Volumes > Filesystem
Disk > partitions > PV > VG > LV > FS
```

# Installation de LVM

LVM est généralement pré-installé dans la plupart des distributions Linux modernes, mais si vous ne l'avez pas, vous pouvez l'installer en utilisant la commande suivante :

``` bash
sudo apt-get install lvm2
```


# Création d'un groupe de volumes

La première étape dans l'utilisation de LVM est la création d'un groupe de volumes. Un groupe de volumes est un ensemble de volumes physiques qui peuvent être utilisés pour créer des volumes logiques.

1.  Créez une partition physique (PV) à partir d'un disque dur en utilisant la commande suivante :

``` bash
sudo pvcreate /dev/sdb1
```

Notez que `/dev/sdb1` est le chemin de la partition que vous voulez utiliser pour créer le PV.
 
2.  Créez un groupe de volumes (VG) à partir du PV en utilisant la commande suivante :

``` bash
sudo vgcreate my_vg /dev/sdb1
```

Notez que `my_vg` est le nom que vous voulez donner à votre VG. On peut également agréger plusieurs partitions physiques dans un vg (il suffit de les lister après le nom du VG)

3.  Pour afficher les informations du VG, utilisez la commande suivante :

``` bash
sudo vgdisplay my_vg
sudo vgs
```

Cette commande affichera les informations sur votre VG, y compris la taille, l'espace libre, etc.

4.  Pour afficher les informations du PV (volume physique), utilisez la commande suivante :

``` bash
sudo pvdisplay
sudo pvs
```

5.  Pour étendre un Volume Group existant en lui ajoutant un nouveau PV (volume physique), utilisez la commande suivante :

``` bash
sudo pvextend my_vg /dev/sdc1
```


# Création de volumes logiques

Une fois que vous avez créé un VG, vous pouvez créer des volumes logiques (LV) à partir de celui-ci. Les volumes logiques peuvent être formatés et montés comme des partitions normales.

1.  Créez un LV en utilisant la commande suivante :

``` bash
sudo lvcreate -L 10G -n my_lv my_vg
```

Notez que `my_lv` est le nom que vous voulez donner à votre LV, `my_vg` est le nom de votre VG et `-L` spécifie la taille du LV.

Pour lister les LV existants

``` bash
sudo lvdisplay
sudo lvs
```

2.  Formatez le LV en utilisant la commande suivante :

``` bash
sudo mkfs.ext4 -m 1 /dev/my_vg/my_lv
```

Notez que `/dev/my_vg/my_lv` est le chemin de votre LV.

3.  Montez le LV en utilisant la commande suivante :

``` bash
sudo mount /dev/my_vg/my_lv /mnt/my_lv
```

Notez que `/mnt/my_lv` est le chemin où vous voulez monter votre LV

# Extension de volumes logiques

Une fois que vous avez créé un LV, vous pouvez l'agrandir ou le réduire en utilisant les commandes suivantes.

- Agrandir un LV :

``` bash
sudo lvextend -L +5G /dev/my_vg/my_lv
```

Notez que `+5G` spécifie la quantité que vous voulez agrandir le LV

Pour étendre en spécifiant un %

``` bash
sudo lvextend -l +50%FREE /dev/my_vg/my_lv
```

- Etendre le filesystem associé à ce volume logique

``` bash
sudo resize2fs /dev/my_vg/my_lv
```

# Réduction d'un LV

- Démontez le LV en utilisant la commande suivante :

``` bash
sudo umount /dev/my_vg/my_lv
```

- Vérifiez l'état du système de fichiers du LV en utilisant la commande suivante :

``` bash
sudo e2fsck -f /dev/my_vg/my_lv
```

Notez que vous pouvez remplacer `e2fsck` par la commande de vérification de système de fichiers que vous utilisez.

- Réduisez la taille du FileSystem en utilisant la commande suivante :

``` bash
sudo resize2fs /dev/my_vg/my_lv 5G
```

Notez que `5G` spécifie la nouvelle taille du FS.

- Réduisez la taille du LV en utilisant la commande suivante :

``` bash
sudo lvreduce -L 5G /dev/my_vg/my_lv
```

Notez que `5G` spécifie la nouvelle taille du LV.

- Redimensionner le filesystem associé à ce volume logique

``` bash
sudo resize2fs /dev/my_vg/my_lv
```


- Remontez le LV en utilisant la commande suivante :

``` bash
sudo mount /dev/my_vg/my_lv /mnt/my_lv
```

Notez que `/mnt/my_lv` est le chemin où vous avez monté votre LV.

Il est important de noter que la réduction d'un LV peut entraîner une perte de données si vous ne suivez pas les étapes correctement. Il est donc recommandé de sauvegarder vos données avant de réduire un LV.