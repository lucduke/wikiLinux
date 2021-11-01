# Youtube-dl



## Installation

```bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```



## Création d'un alias

```bash
# On edite le fichier bashrc
nano .bashrc

# On ajoute l'alias suivant
alias yt="python3 /usr/local/bin/youtube-dl" 
```



## Utilisation

```bash
# Pour maj
youtube-dl -U
# Pour lister les formats d'une vidéos
youtube-dl -F <url>
# Pour télécharger une vidéo dans un format particulier
youtube-dl -f <format_code> <url>
youtube-dl -f <format_code1>+bestaudio --merge-output-format mkv <url>
```



## Source

https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme