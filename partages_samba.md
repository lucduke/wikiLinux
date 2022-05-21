# Création d'un partage SAMBA



## Installation de SAMBA

```bash
# Vérification si le daemon est déjà installé
sudo systemctl status smbd

# Si absent
sudo apt update
sudo apt install samba -y

# On stop le daemon
sudo systemctl stop smbd
```



## Edition du fichier de configuration

```bash
# On créé un backup
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# On édite le fichier et on le remplace avec le contenu ci-après
sudo nano /etc/samba/smb.conf
```

```
[global]
workgroup = WORKGROUP
security = user
map to guest = Bad User
name resolve order = bcast host

[Partage Media]
comment = Partage Media sur RPI4
path = /srv/samba/media
force user = smbuser
force group = smbgroup
create mask = 0664
force create mode = 0664
directory mask = 0775
force directory mode = 0775
browsable = yes
public = yes
writable = yes
```



## Création du user / group SAMBA

```bash
# Création du groupe système smbgroup
sudo groupadd --system smbgroup

# Création de l'utilisateur system smbuser
sudo useradd --system --no-create-home --group smbgroup -s /bin/nologin smbuser
```



## Création du répertoire de partage

```bash
sudo mkdir -p /srv/samba/media

# On attribue la propriété du répertoire à smbuser:smbgroup
sudo chown -R smbuser:smbgroup /srv/samba/media

# On change les droits en écritures pour le group smbgroup sur ce répertoire
sudo chmod -R g+w /srv/samba/media
```



## On relance le daemon

```bash
sudo systemctl start smbd
sudo systemctl status smbd
```



## Sources

https://www.learnlinux.tv/setting-up-simple-samba-file-shares/