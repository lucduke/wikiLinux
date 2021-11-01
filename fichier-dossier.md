# Gestion des fichiers et dossiers



## Les dossiers

### La création

```bash
mkdir <nom_dossier>
# Pour créer toute l'arborescence
mkdir -p <path>/<dossier>
```

### La suppression

```bash
rm -r <dossier>
# Pour avoir une confirmation
rm -ri <dossier>
```



## Les fichiers

### La création

```bash
touch <fichier>
```

### La suppression

```bash
rm <fichier>
# Pour avoir une confirmation
rm -i <fichier>
```

### La copie

```bash
cp <fichier_source> <fichier_cible>
```

### Le déplacement

```bash
mv <fichier_source> <fichier_cible>
```

### L'affichage

```bash
# Pour afficher tout le fichier
cat <fichier>
# Pour afficher les 10 premières lignes
head <fichier>
# Pour afficher les 7 premières lignes
head -n 7 <fichier>
# Pour afficher les 10 dernières lignes
tail <fichier>
# Pour afficher les 7 dernières lignes
tail -n 7 <fichier>
# Pour afficher en dynamique les dernières lignes
tail -f <fichier>
```

