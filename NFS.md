
# Création d'un serveur NFS

## Création des répertoires à partager

```bash
sudo mkdir -p /srv/nfs/documents
sudo mkdir -p /srv/nfs/media
```

On attribue leur propriété à l'utilisateur anonyme

```bash
sudo chown -R nobody:nogroup /srv/nfs/documents
sudo chown -R nobody:nogroup /srv/nfs/media
sudo chmod -R 777 /srv/nfs/documents
sudo chmod -R 777 /srv/nfs/media
```


## Installation du serveur NFS

```bash
sudo apt install nfs-kernel-server -y
```

On vérifie que le serveur est actif

```bash
systemctl status nfs-kernel-server
```


## Configuration du serveur NFS

On sauvegarde le fichier de configuration par defaut

```bash
sudo mv /etc/exports /etc/exports.bak
sudo touch /etc/exports
```

On saisit le contenu suivant dans le nouveau fichier

```txt
/srv/nfs/documents 192.168.1.0/255.255.255.0(rw,sync,all_squash,anonuid=65534,anongid=65534,no_subtree_check)
/srv/nfs/media 192.168.1.0/255.255.255.0(rw,sync,all_squash,anonuid=65534,anongid=65534,no_subtree_check)
```

<u>Commentaires</u>
- all_squash : force le _mapping_ de tous les utilisateurs vers l’utilisateur anonyme
- anonuid : indique au serveur NFS l’uid de l’utilisateur anonyme
- anongid : indique au serveur NFS le gid de l’utilisateur anonyme

On redémarre le serveur

```bash
sudo systemctl restart nfs-kernel-server
```


## Installation du client NFS

```bash
sudo apt install nfs-common -y
```

On interroge le serveur NFS pour voir les répertoires partagés

```bash
# Remplacer avec l'IP de votre serveur NFS
# Pour connaitre l'IP, ip addr
sudo showmount --exports 192.168.1.109
```

On créé les répertoires de montage sur le PC client

```bash
sudo mkdir -p /mnt/nfs/documents
sudo mkdir -p /mnt/nfs/media
```

J'attribue la propriété du répertoire de montage à mon user:group

```bash
sudo chown -R christophe:christophe /mnt/nfs
```

On teste le montage

```bash
sudo mount 192.168.1.109:/srv/nfs/documents /mnt/nfs/documents
```

On démonte le répertoire

```bash
sudo umount /mnt/nfs/documents
```

## Montage automatique via AUTOFS

On supprime les sous-répertoire de montage sur le PC client

```bash
sudo rm -r /mnt/nfs/documents
sudo rm -r /mnt/nfs/media
```

On installe AutoFS

```bash
sudo apt install autofs
```

On édite le 1er fichier de configuration "master"

```bash
sudo nano /etc/auto.master
```

On ajoute la ligne suivante à la fin du fichier

```txt
/mnt/nfs /etc/auto.nfs --ghost --timeout=120
```

On édite le 1er fichier de configuration "auto.nfs"


```bash
sudo nano /etc/auto.nfs
```

On ajoute les lignes suivantes dans le fichier

```txt
documents -fstype=nfs4,rw 192.168.1.109:/srv/nfs/documents
media -fstype=nfs4,rw 192.168.1.109:/srv/nfs/media
```

On redémarre autofs

```bash
sudo systemctl restart autofs
sudo systemctl status autofs
```

## Montage automatique via FSTAB

On édite le 1er fichier de configuration "fstab"


```bash
sudo nano /etc/fstab
```

On ajoute les lignes suivantes dans le fichier

```bash
echo '192.168.1.109:/srv/nfs/documents /mnt/nfs/documents nfs defaults,_netdev,nofail 0 0' | sudo tee -a /etc/fstab
```
