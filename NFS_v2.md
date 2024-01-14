
# Création d'un serveur NFS

## Création des répertoires à partager

```bash
sudo mkdir -p /srv/raid/nfs/proxmox 
```

## Installation du serveur NFS

```bash
sudo apt install nfs-kernel-server -y
```

On vérifie que le serveur est actif

```bash
sudo systemctl status nfs-kernel-server
```

Si non :

```bash
sudo systemctl enable --now nfs-server.service
```

## Configuration du serveur NFS

On sauvegarde le fichier de configuration par defaut

```bash
sudo mv /etc/exports /etc/exports.bak
```

On paramètre  le contenu suivant dans le nouveau fichier

```bash
sudo touch /etc/exports | echo '/srv/raid/nfs/proxmox 192.168.1.0/24(rw,sync,no_root_squash,no_subtree_check)' | sudo tee -a /etc/exports
```

**_Commentaires_**

- no_root_squash : Par défaut, le serveur NFS attribue les opérations effectuées par l'utilisateur root sur le client à un utilisateur anonyme. Cette option désactive ce comportement et permet à l'utilisateur root sur le client d'agir comme root sur le serveur

On redémarre le serveur

```bash
sudo systemctl restart nfs-kernel-server
```
