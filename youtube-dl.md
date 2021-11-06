# Youtube-dl



## Installation

```bash
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

ou le fork yt-dlp

```bash
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod a+rx /usr/local/bin/yt-dlp
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

ou

```bash
# Pour maj
yt-dlp -U
# Pour lister les formats d'une vidéos
yt-dlp -F <url>
# Pour télécharger une vidéo dans un format particulier
yt-dlp -f <format_code> <url>
yt-dlp -f <format_code1>+bestaudio --merge-output-format mkv <url>
yt-dlp -f "bv*[height<=1080]+ba" --merge-output-format mkv --output "%(title)s.%(ext)s" <url>
```



## Sources

https://github.com/ytdl-org/youtube-dl/blob/master/README.md#readme

https://github.com/yt-dlp/yt-dlp