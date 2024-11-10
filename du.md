# La commande `du`

## Introduction

La commande `du` est un outil puissant pour surveiller l'utilisation de l'espace disque sur un système Linux. Elle permet de voir combien d'espace est utilisé par des fichiers et des répertoires spécifiques.

## Syntaxe de base

La syntaxe de base de la commande du est la suivante :

```bash
du [options] [fichier ou répertoire]
```

Options courantes

Voici quelques-unes des options les plus couramment utilisées avec la commande du :

* -h : Affiche les tailles en format lisible par l'homme (par exemple, K, M, G).
* -s : Affiche seulement le total pour chaque argument.
* -a : Affiche les tailles de tous les fichiers, pas seulement des répertoires.
* -c : Affiche un total global.
* --max-depth=N : Limite la profondeur de la récursion à N niveaux.
* --exclude=PATTERN : Exclut les fichiers et répertoires correspondant au motif PATTERN.

## Exemples d'utilisation

1. Afficher l'utilisation de l'espace disque en format lisible par l'homme :

```bash
du -h
```

Cette commande affiche l'utilisation de l'espace disque pour tous les fichiers et répertoires dans le répertoire courant, en format lisible par l'homme.

2. Afficher l'utilisation de l'espace disque pour un répertoire spécifique :

```bash
du -h /chemin/vers/repertoire
```

Cette commande affiche l'utilisation de l'espace disque pour le répertoire spécifié.

3. Afficher seulement le total pour un répertoire :

```bash
du -sh /chemin/vers/repertoire
```

Cette commande affiche seulement le total de l'espace disque utilisé par le répertoire spécifié.

Pour avoir le détail du total par sous-répertoire :

```bash
du -sh /chemin/vers/repertoire/*
du -d 0 -h /chemin/vers/repertoire
```

4. Afficher l'utilisation de l'espace disque pour tous les fichiers et répertoires :

```bash
du -ah /chemin/vers/repertoire
```

Cette commande affiche l'utilisation de l'espace disque pour tous les fichiers et répertoires dans le répertoire spécifié.

5. Limiter la profondeur de la récursion :

```bash
du -h --max-depth=1 /chemin/vers/repertoire
```

Cette commande affiche l'utilisation de l'espace disque pour le répertoire spécifié et ses sous-répertoires immédiats, mais ne descend pas plus profondément.

6. Exclure certains fichiers ou répertoires :

```bash
du -h --exclude=*.log /chemin/vers/repertoire
```

Cette commande affiche l'utilisation de l'espace disque pour le répertoire spécifié, en excluant les fichiers avec l'extension .log.

## Conclusion

La commande du est un outil essentiel pour la gestion de l'espace disque sous Linux. En utilisant les différentes options disponibles, vous pouvez obtenir des informations détaillées sur l'utilisation de l'espace disque et identifier les fichiers et répertoires qui consomment le plus d'espace.
