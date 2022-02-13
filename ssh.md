# SSH



## Gérer une clef RSA

````shell
# Création du couple clef privée / publique
# --> la clef privée est dans le chemin ~/.ssh/id_rsa
# --> la clef publique est dans le chemin ~/.ssh/id_rsa.pub
ssh-keygen -t rsa -b 4096 -C "NomUser"

# Copie de la clef publique sur l'hote remote
ssh-copy-id -i "~/.ssh/id_rsa.pub" user@host.local

# Vérification de la connexion via la clef
ssh user@host.loccal

# Vérifications
# Il faut que le repertoire home sur le remote/local serveur ne soit modifiable que par son proprietaire
chmod -R 755 ~
# Il faut que le fichier authorized_keys sur le remote serveur ne soit lisible / modifiable que par son proprietaire
 chmod 600 ~/.ssh/authorized_keys
# Il faut que la clef privée id_rsa sur le serveur locale ne soit lisible / modifiable que par son proprietaire
chmod 600 ~/.ssh/id_rsa
````



## Fichier de configuration client SSH

```shell
# Création du fichier de config
touch ~/.ssh/config
```

Le contenu de ce fichier est le suivant (bien respecter l'indentation) :

```yaml
Host myHost
  Hostname myHost.local
  User myUser
  Port 22
```

On peut ensuite se connecter aux différents hosts déclarés via la commande suivante

```shell
ssh myUser@myHost.local
```



## Copie locale vers serveur remote

scp [-r récursif] [-p Conserve les dates de modification, d'accès et les permissions des fichiers originaux] [-P Spécifie un port de connexion à la machine distante] [<local_path>] [[user@destination_host]:<file2>]
```shell
scp -rpP 7256 /drives/i/temp/subsonic/* user@remoteHost.com:/var/subsonic/musique/Incoming
```



## Copie serveur remote vers local

scp [-r récursif] [-p Conserve les dates de modification, d'accès et les permissions des fichiers originaux] [-P Spécifie un port de connexion à la machine distante] [[user@destination_host]:<file2>] [<local_path>]
```                      shell
# ex serveur vers local
scp user@192.168.10.131:/var/www/Fichier2 /home/user/data/
```