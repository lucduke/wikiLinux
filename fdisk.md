
# Introduction

La commande `fdisk` est un utilitaire de partitionnement de disque utilisé dans les systèmes d'exploitation de type Linux. Avec `fdisk`, vous pouvez créer, supprimer, redimensionner, afficher et modifier des partitions sur votre disque dur.

# Syntaxe de la commande fdisk

La syntaxe de base de la commande fdisk est la suivante :

``` css
fdisk [option] [device]
```

- `[option]` : Les options disponibles pour la commande `fdisk` incluent `-l`, `-u` et `-m`, entre autres. Vous pouvez afficher toutes les options en tapant `fdisk --help`.
- `[device]` : Le nom du périphérique sur lequel vous souhaitez effectuer des opérations de partitionnement. Par exemple, `/dev/sda`.

# Afficher la table des partitions

Pour afficher la table des partitions sur un disque, utilisez l'option `-l` avec `fdisk` :

``` bash
fdisk -l /dev/sda
```

Cette commande affiche la liste de toutes les partitions sur le disque `/dev/sda`.

# Créer une nouvelle partition

Pour créer une nouvelle partition, vous pouvez utiliser les étapes suivantes :

1. Lancez la commande `fdisk` avec le nom du disque que vous souhaitez partitionner :

``` bash
fdisk /dev/sda
```

2. Utilisez la commande `n` pour créer une nouvelle partition.

3. Suivez les instructions pour définir le type de partition, le début et la fin de la partition.

4. Utilisez la commande `w` pour enregistrer les modifications.  

# Supprimer une partition existante

Pour supprimer une partition existante, vous pouvez utiliser les étapes suivantes :

1. Lancez la commande `fdisk` avec le nom du disque sur lequel se trouve la partition que vous souhaitez supprimer :

``` bash
fdisk /dev/sda
```

2. Utilisez la commande `d` pour supprimer la partition. Vous devrez entrer le numéro de la partition que vous souhaitez supprimer.

3. Utilisez la commande `w` pour enregistrer les modifications.  

# Modifier une partition existante

Pour modifier une partition existante, vous pouvez utiliser les étapes suivantes :

1. Lancez la commande `fdisk` avec le nom du disque sur lequel se trouve la partition que vous souhaitez modifier :

``` bash
fdisk /dev/sda
```

2. Utilisez la commande `t` pour changer le type de partition. Vous devrez entrer le numéro de la partition et le nouveau code de type de partition.

3. Utilisez la commande `d` pour supprimer une partition existante.

4. Utilisez la commande `n` pour créer une nouvelle partition avec les nouveaux paramètres.

5. Utilisez la commande `w` pour enregistrer les modifications.

# Transmission des informations au noyau

``` bash
partx /dev/sda1
```

# Conclusion

La commande `fdisk` est un utilitaire puissant pour gérer les partitions de disque dans Linux. En suivant les étapes décrites ci-dessus, vous devriez être en mesure de créer, supprimer et modifier des partitions sur votre disque dur.
