# La gestion des archives TAR

## Création d'une archive
```bash
# Sans compression
tar -cvf archive1.tar <nomFichier1> <nomFichier2>

# Avec compression GZIP
tar -czvf archive1.tar.gz <nomFichier1> <nomFichier2>
#	c => créer une nouvelle archive
#	z => permet d’activer la compression « gzip » pour un taux de compression plus important
#	v => mode verbeux, permet d’afficher dans le détail les fichiers compressés
#	f => indication de la donnée à compresser

# Avec compression BZIP2
tar -cjvf < nom_archive >.tar.bz2 < nom_rep >
#	c => créer une nouvelle archive
#	j => permet d’activer la compression « bzip2 » pour un taux de compression plus important
#	v => mode verbeux, permet d’afficher dans le détail les fichiers compressés
#	f => indication de la donnée à compresser
```



## Lister le contenu d'une archive

```bash
tar -tvf archive1.tar
```



## Extraire le contenu d'une archive

```bash
# Archive sans compression
tar -xvf /path/to/archive1.tar

# Archive avec compression
tar -xzvf < nom_archive >.tar.gz 
tar -xzvf < nom_archive >.tar.gz -C
#	x => extraire une archive
#	z => permet de décompresser le « gzip«
#	v => mode verbeux , permet d’afficher dans le détail les fichiers décompressés
#	f => indication de la données à décompresser -C => si on souhaite décompresser l’archive dans un autre répertoire
```



