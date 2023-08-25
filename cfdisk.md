# Introduction
La commande `cfdisk` est un outil en ligne de commande qui permet de gérer les partitions sur un disque dur sous Linux. Elle fournit une interface interactive conviviale pour créer, modifier et supprimer des partitions. Voici comment l'utiliser :

# Étape 1 : Ouvrir un terminal
Ouvrez un terminal sur votre système Linux. Vous pouvez généralement le trouver dans le menu des applications ou en utilisant un raccourci clavier comme Ctrl + Alt + T.

# Étape 2 : Exécuter cfdisk en tant que superutilisateur
Pour utiliser `cfdisk`, vous devez avoir les droits d'administrateur. Vous pouvez exécuter la commande avec sudo pour obtenir ces droits. Entrez la commande suivante dans le terminal :

```bash
sudo cfdisk /dev/sdX
```
Remplacez `sdX` par la lettre correspondant au disque que vous souhaitez partitionner (par exemple, sda, sdb, etc.). Assurez-vous de sélectionner le bon disque, car la manipulation incorrecte des partitions peut entraîner la perte de données.

# Étape 3 : Utilisation de cfdisk
Une fois `cfdisk` lancé, vous verrez une interface en mode texte qui vous permet de gérer les partitions.

* Utilisez les touches fléchées pour naviguer dans le menu.
* Pour créer une nouvelle partition, sélectionnez "New" (Nouveau) et suivez les instructions pour spécifier la taille et le type de partition.
* Pour supprimer une partition existante, sélectionnez la partition et choisissez "Delete" (Supprimer).
* Pour modifier les paramètres d'une partition, sélectionnez la partition et choisissez "Type", "Size", etc.
* N'oubliez pas de sélectionner "Write" (Écrire) pour enregistrer vos modifications sur le disque.

# Étape 4 : Quitter cfdisk
Une fois que vous avez terminé de créer, modifier ou supprimer des partitions, sélectionnez "Quit" (Quitter) dans le menu de cfdisk pour quitter l'outil.

Assurez-vous d'être absolument sûr de vos actions avant d'écrire les modifications sur le disque, car cela peut entraîner la perte de données si cela est mal fait.

Et voilà ! Vous avez maintenant un aperçu de base de l'utilisation de la commande `cfdisk` pour gérer les partitions sur Linux.