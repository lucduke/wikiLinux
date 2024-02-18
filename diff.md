# Utilisation de diff et patch sous Linux

Les commandes diff et patch sont deux utilitaires couramment utilisés dans l'environnement Linux pour comparer et fusionner des fichiers. La commande diff génère une sortie qui décrit les différences entre deux fichiers, tandis que la commande patch peut être utilisée pour appliquer ces différences à un autre fichier.

## Commande diff
La syntaxe de base de la commande diff est :

```bash
diff [options] fichier1 fichier2
```

où `fichier1` et `fichier2` sont les deux fichiers que vous souhaitez comparer. Par défaut, diff affiche les lignes qui ne correspondent pas entre les deux fichiers, en mettant en évidence les différences à l'aide d'indicateurs tels qu'un signe `>` pour les ajouts et un signe `<` pour les suppressions.

Voici un exemple simple de la commande diff :

```bash
$ cat fichier1.txt
Ligne 1a
Ligne 2
Ligne 4

$ cat fichier2.txt
Ligne 1
Ligne 2
Ligne 3
Ligne 4

$ diff fichier1.txt fichier2.txt
1c1
< Ligne 1a
---
> Ligne 1
2a3
> Ligne 3
```
Dans cet exemple, diff affiche les lignes qui ont été supprimées de fichier1.txt et les lignes qui ont été ajoutées à fichier2.txt.

Une commande plus complète

```bash
$ diff --color --unified fichier1.txt fichier2.txt
--- fichier1.txt        2024-02-18 17:46:51.508835715 +0100
+++ fichier2.txt        2024-02-18 17:48:06.885093328 +0100
@@ -1,3 +1,4 @@
-Ligne 1a
+Ligne 1
 Ligne 2
+Ligne 3
 Ligne 4
```

## Commande patch

La syntaxe de base de la commande patch est :

```bash
patch [options] fichier_cible < mises_a_jour.diff
```

où `fichier_cible` est le fichier que vous souhaitez mettre à jour, et `mises_a_jour.diff` est la sortie de la commande `diff`. Le fichier `mises_a_jour.diff` doit être créé en utilisant l'option `>` pour rediriger la sortie d'une commande `diff`, par exemple :

```bash
diff --color --unified fichier1.txt fichier2.txt > mises_a_jour.diff
```

La commande `patch` lit ensuite le fichier `mises_a_jour.diff` et applique les modifications correspondantes au premier fichier erroné.

En repartant de l'exemple précédent, voici un exemple d'utilisation de la commande patch :

```bash
# Générer la sortie diff entre les deux fichiers :
$ diff --unified fichier1.txt fichier2.txt > mises_a_jour.diff

#Appliquer la mise à jour sur le premier fichier de test :
$ patch < mises_a_jour.diff

#Vérifier les résultats :
$ cat fichier1.txt
Ligne 1
Ligne 2
Ligne 3
Ligne 4
```

La commande `patch` a correctement appliqué les modifications sur le fichier `fichier1.txt`

Pour revenir en arrière:

```bash
$ patch -R < mises_a_jour.diff
```
