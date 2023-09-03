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
ssh user@host.local

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


## Gérer son serveur SSH

```shell
# Connaitre le statut du serveur SSH
sudo systemctl status sshd

# Arrêter le serveur SSH
sudo systemctl stop sshd

# Désactiver le serveur SSH
sudo systemctl disable sshd

# Activer le serveur SSH
sudo systemctl enable sshd

# Démarrer le serveur SSH
sudo systemctl start sshd

# Redémarrer le serveur SSH
sudo systemctl restart sshd
```


## Fichier de configuration du serveur SSH

Le fichier est enregistrer ici : /etc/ssh/sshd_config

```txt
# Pour empêcher la connexion du user root au serveur SSH (attention a bien avoir créer un autre utilisateur ayant accès au serveur ssh)
PermitRootLogin no

# Pour empêcher la connexion via mot de passe au serveur SSH (attention a bien avoir paramétrer un user pouvoir se connecter via un certificat)
PasswordAuthentication no
```

Pour que les modifications soient effectives, il faut ensuite redémarrer le serveur SSH


## Copie locale vers serveur remote

```shell
scp [-r récursif] [-p Conserve les dates de modification, d\'accès et les permissions des fichiers originaux] [-P Spécifie un port de connexion à la machine distante] [<local_path>] [[user@destination_host]:<file2>]
```


```shell
scp -rpP 7256 /drives/i/temp/subsonic/* user@remoteHost.com:/var/subsonic/musique/Incoming
```


## Copie serveur remote vers local

```shell
scp [-r récursif] [-p Conserve les dates de modification, d\'accès et les permissions des fichiers originaux] [-P Spécifie un port de connexion à la machine distante] [[user@destination_host]:<file2>] [<local_path>]
```


```shell
# ex serveur vers local
scp user@192.168.10.131:/var/www/Fichier2 /home/user/data/
```