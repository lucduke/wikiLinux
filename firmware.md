# Gestion des firmwares



## Firware upgrade

```shell
# Installation firmware upgrade
sudo apt install fwupd

# Lancement du service
sudo service fwupd start

# Vérification des mises à jour
sudo fwupdmgr refresh
sudo fwupdmgr get-devices

# Installation des mises à jour
sudo fwupdmgr update
```

