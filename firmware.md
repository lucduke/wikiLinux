# Qu'est-ce que fwupd ?

fwupd est un utilitaire open source qui permet de mettre à jour facilement les firmwares de divers périphériques sous Linux. Il est développé dans le cadre du projet Linux Vendor Firmware Service (LVFS).

## Installation

Sur la plupart des distributions Linux modernes, fwupd est pré-installé. Si ce n'est pas le cas, vous pouvez l'installer via votre gestionnaire de paquets :

```bash
# Ubuntu/Debian
sudo apt install fwupd

# Fedora
sudo dnf install fwupd

# Arch Linux
sudo pacman -S fwupd
```

## Commandes principales

### Vérifier les périphériques compatibles

```bash
fwupdmgr get-devices
```

Cette commande affiche la liste des périphériques qui peuvent être mis à jour via fwupd.

### Rechercher les mises à jour disponibles

```bash
fwupdmgr refresh
fwupdmgr get-updates
```

La première commande met à jour la base de données des firmwares disponibles, la seconde affiche les mises à jour disponibles pour vos périphériques.

### Installer les mises à jour

```bash
fwupdmgr update
```

Cette commande télécharge et installe toutes les mises à jour de firmware disponibles.

## Options avancées

### Voir l'historique des mises à jour

```bash
fwupdmgr get-history
```

### Revenir à une version précédente

```bash
fwupdmgr downgrade
```

### Vérifier la version installée

```bash
fwupdmgr --version
```

## Dépannage

Si vous rencontrez des problèmes, voici quelques commandes utiles :

```bash
# Vérifier les logs
journalctl -u fwupd

# Nettoyer le cache
fwupdmgr clear-history

# Vérifier l'état du service
systemctl status fwupd
```

## Pour aller plus loin

- Site officiel LVFS : [https://fwupd.org](https://fwupd.org)
- Documentation complète : [https://github.com/fwupd/fwupd/wiki](https://github.com/fwupd/fwupd/wiki)
- Liste des périphériques supportés : [https://fwupd.org/lvfs/devices/](https://fwupd.org/lvfs/devices/)
