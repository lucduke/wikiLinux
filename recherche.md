# La recherche



## Rechercher un fichier par son nom

```bash
# Par nom 
find <emplacement> -iname "<nom fichier>" -print
## => inmame est insensible à la casse
## => on peut mettre les jokers * ou ? dans le nom du fichier

# Dans le dossier et sous-dossiers où je suis
find -name "fichier.txt"

# Par type et nom
## Pour les fichiers
find <emplacement> -type f -iname "<nom fichier>" -print
## Pour les répertoires
find <emplacement> -type d -iname "<nom repertoire>" -print

# Par taille
find <emplacement> -size +10M
find <emplacement> -size +10M -size -50M

# Par utilisateur
find <emplacement> -user christophe
find <emplacement> -uid 1000

# Par permission
find <emplacement> -type f -perm 777 -print
find <emplacement> -type f ! -perm 777 -print
## ! pour différent de

# Appeler une commande
## Exemple pour changer l'owner à christophe des fichiers dont l'uid est 500
find <emplacement> -uid 500 -exec chown christophe {} \;
## Exemple pour supprimer les fichiers dont l'extension est *.log
find <emplacement> -type f -iname "*.log" -exec rm -i {} \;
find <emplacement> -type f -iname "*.db" -delete

# Lister les fichiers vides
find <emplacement> -type f -empty

# Lister les dossiers vides
find <emplacement> -type d -empty
```



## Rechercher du contenu dans des fichiers

```bash
grep <contenu recherché> <fichier>
# Pour ignorer la casse
grep -i <contenu recherché> <fichier>
# Pour une recherche récursive
grep -r <contenu recherché> <path>
```



## Rechercher le chemin absolu d'une commande

```bash
which <nom_commande>
whereis <nom_commande>
```

