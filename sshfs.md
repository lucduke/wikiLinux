
# Introduction

SSHFS est un outil de montage de système de fichiers qui vous permet de monter un système de fichiers distant sur votre ordinateur local via une connexion SSH. Cela peut être très utile si vous devez accéder à des fichiers situés sur un serveur distant. L'avantage de SSHFS est que vous pouvez accéder aux fichiers distants comme s'ils étaient locaux, ce qui signifie que vous pouvez utiliser toutes vos applications locales pour travailler sur les fichiers distants.

# Prérequis

Avant de commencer à utiliser SSHFS, vous devez vous assurer que vous disposez des éléments suivants :

-   Une connexion SSH active vers le serveur distant
-   Les droits d'accès nécessaires pour monter le système de fichiers distant
-   Le paquet SSHFS doit être installé sur votre ordinateur local.

# Installation

Si vous utilisez Linux, vous pouvez installer SSHFS en utilisant le gestionnaire de paquets de votre distribution. Par exemple, si vous utilisez Ubuntu, vous pouvez l'installer en utilisant la commande suivante :

```bash
sudo apt install -y sshfs
```

Si vous utilisez Windows, vous pouvez installer WinFsp et SSHFS-Win pour utiliser SSHFS. 

# Montage du système de fichiers distant

Une fois que vous avez installé SSHFS, vous pouvez monter un système de fichiers distant en utilisant la commande suivante :

```bash
sshfs utilisateur@serveur_distant:/chemin/vers/le/dossier_distant /chemin/vers/le/dossier_local
```


-   Utilisateur : nom d'utilisateur que vous utilisez pour vous connecter au serveur distant.
-   Serveur_distant : adresse IP ou nom de domaine du serveur distant.
-   Chemin/vers/le/dossier_distant : chemin absolu du dossier distant que vous souhaitez monter.
-   Chemin/vers/le/dossier_local : chemin absolu du dossier local où vous souhaitez monter le système de fichiers distant.

Par exemple, si vous voulez monter le dossier distant `/home/utilisateur/fichiers` sur votre ordinateur local dans le dossier `/mnt/fichiers`, vous pouvez utiliser la commande suivante :

```bash
sshfs utilisateur@serveur_distant:/home/utilisateur/fichiers /mnt/fichiers
```

# Utilisation de SSHFS

Une fois que vous avez monté le système de fichiers distant sur votre ordinateur local, vous pouvez y accéder comme si c'était un dossier local. Vous pouvez utiliser toutes vos applications locales pour travailler sur les fichiers distants.

Lorsque vous avez terminé de travailler sur les fichiers distants, vous pouvez démonter le système de fichiers distant en utilisant la commande suivante :

```bash
umount /chemin/vers/le/dossier_local
```

Par exemple, pour démonter le dossier `/mnt/fichiers`, vous pouvez utiliser la commande suivante :

```bash
umount /mnt/fichiers
```
