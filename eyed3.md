# Utilisation de EyeD3 pour la mise à jour des tag mp3



## Installation de eyeD3

```bash
sudo apt update
sudo apt install -y eyed3
```



## Administration des tags

```bash
# Maj de l'artiste
eyeD3 --artist "Artiste" track.mp3

# Maj du titre
eyeD3 --title "Reality" track.mp3

# Maj de l'album
eyeD3 --album "Mon album" track.mp3

# Maj du genre
eyeD3 --genre "Pop" track.mp3

# Maj du numéro de piste
eyeD3 --track 1 track.mp3

# Maj du nombre de pistes
eyeD3 --track-total 21 track.mp3

# Maj de l'année de parution
eyeD3 --release-year 2022 track.mp3

# Maj du numéro de disque
eyeD3 --disc-num 1 track.mp3

# Maj du nombre total de disque
eyeD3 --disc-total 2 track.mp3

# Ajout d'un cover
eyeD3 --add-image "cover.jpg:FRONT_COVER" track.mp3
```



## Lien utile

Recherche de covers : https://www.covercentury.com
