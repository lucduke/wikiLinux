# La gestion des archives TAR

## Création d'une archive
```bash
# Sans compression
tar -cvf archive1.tar <nomFichier1> <nomFichier2>
# Avec compression GZIP
tar -czvf archive1.tar.gz <nomFichier1> <nomFichier2>
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
tar -xzvf /path/to/archive1.tar.gz
```




