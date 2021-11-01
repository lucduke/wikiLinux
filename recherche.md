# La recherche



## Rechercher un fichier par son nom

```bash
# Dans le dossier et sous-dossiers où je suis
find -name "fichier.txt"
find -name "fichier*.txt" #* permet d'ajouter un joker

# Dans un chemin précis
find <path> -name "fichier.txt"
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

