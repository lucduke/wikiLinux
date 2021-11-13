# La compression / décompression d'archive ZIP / RAR



## Les archives ZIP



```bash
# Zipper un fichier ou un repertoire
zip archive.zip fichier1 fichier2 fichier3
zip -r archive.zip nom_repertoire
#	r=> récursif

# Dezipper un fichier
unzip <votre_archive.zip> -d <mon_repertoire>

 # Compresser GZIP en multithread
pigz -k <ficher_a_compresser>
tar -I pigz -cvf < nom_archive >.tar.gz <fichiers_a_compresser>

 # Compresser BZIP2 en multithread
lbzip2 -k <ficher_a_compresser>
tar -I lbzip2 -cvf < nom_archive >.tar.bz2 <fichiers_a_compresser>
```



## Les archives RAR



```bash
# compresser en rar un fichier ou répertoire
rar a archive.rar nom_repertoire

# Unrar un fichier
unrar x <fichier.rar>
```

