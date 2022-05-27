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
# Pour une suppression récursive
rm -r <mon_repertoire>
```

### La copie

```bash
cp <fichier_source> <fichier_cible>

# Copie récursive et préservant les attributs du fichier
cp -avr <ma_source> <ma_destination>
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



## Les liens

```shell
Créer un lien symbolique
ln -s <lien_symb>
```



## Les droits

### Changer les droits en récursif

```shell
sudo chmod -R 777 <mon_repertoire>
```

### Changer owner d'un répertoire

```shell
sudo chown newuser:newgroup file_name
```



## NCDU

NCDU est un petit utilitaire permettant d’analyser le système de fichier et de naviguer à l’intérieur.
L’analyse ce fait dans l’arborescence dans laquelle vous vous trouvez <u>ou</u> celle que vous lui indiquez.

```bash
# Installation
sudo apt install ncdu -y

# Utilisation
ncdu /path
```

