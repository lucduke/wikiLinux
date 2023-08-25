
# Création d'un serveur NFS

## Création des répertoires à partager

```bash
sudo mkdir -p /srv/nfs/proxmox 
```

## Installation du serveur NFS

```bash
sudo apt install nfs-kernel-server -y
```

On vérifie que le serveur est actif

```bash
systemctl status nfs-kernel-server
```

Si non :

```bash
systemctl enable --now nfs-server.service
```


## Configuration du serveur NFS

On sauvegarde le fichier de configuration par defaut

```bash
sudo mv /etc/exports /etc/exports.bak
sudo touch /etc/exports
```

On saisit le contenu suivant dans le nouveau fichier

```txt 
/srv/nfs/proxmox 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)
```

<u>Commentaires</u>
- no_root_squash : Par défaut, le serveur NFS attribue les opérations effectuées par l'utilisateur root sur le client à un utilisateur anonyme. Cette option désactive ce comportement et permet à l'utilisateur root sur le client d'agir comme root sur le serveur

On redémarre le serveur

```bash
sudo systemctl restart nfs-kernel-server
```