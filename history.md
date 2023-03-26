
# Tutoriel sur la commande history

La commande `history` est une commande de shell qui permet d'afficher l'historique des commandes précédemment exécutées dans le terminal. C'est une commande très utile pour naviguer dans l'historique de ses commandes et les réutiliser facilement.

## Afficher l'historique des commandes

Pour afficher l'historique des commandes précédemment exécutées, il suffit de taper la commande `history` dans le terminal. Cela affichera une liste des commandes numérotées, dans l'ordre dans lequel elles ont été exécutées.

``` bash
$ history
1 ls
2 cd .. 
3 cd Desktop 
4 mkdir test 
5 cd test 
6 touch file1.txt 
7 touch file2.txt 
8 ls 
9 history
```

Dans cet exemple, nous avons exécuté une série de commandes, qui ont été enregistrées dans l'historique de la session.

## Exécuter une commande précédente

Pour exécuter une commande précédemment exécutée, il suffit de taper son numéro précédé d'un point d'exclamation `!`. Par exemple, pour réexécuter la commande numéro 6 dans l'exemple précédent, on tape `!6`.

``` bash
$ !6 
touch file1.txt
```

## Exécuter la dernière commande

Pour exécuter la dernière commande exécutée, on peut utiliser la commande `!!`. Cela réexécutera la dernière commande de l'historique.

``` bash
$ !! 
touch file2.txt
```

## Rechercher dans l'historique

Pour rechercher une commande dans l'historique, on peut utiliser la commande `history | grep <mot-clé>`. Cela affichera une liste des commandes qui contiennent le mot-clé spécifié.

``` bash
$ history | grep mkdir 
4  mkdir test
```

Dans cet exemple, nous avons recherché toutes les commandes de l'historique qui contiennent le mot-clé "mkdir".

## Effacer l'historique

Pour effacer l'historique des commandes précédemment exécutées, on peut utiliser la commande `history -c`. Cela effacera tout l'historique de la session en cours.

``` bash
$ history -c
```

Il est important de noter que cette commande efface seulement l'historique pour la session en cours. Si vous souhaitez effacer tout l'historique de manière permanente, vous devrez modifier le fichier d'historique de votre shell.

## Conclusion

La commande `history` est une commande très utile pour naviguer dans l'historique des commandes précédemment exécutées dans le terminal. En utilisant les différentes options de la commande `history`, vous pouvez facilement rechercher des commandes précédentes, exécuter des commandes spécifiques de l'historique, ou effacer l'historique de manière temporaire ou permanente.