# La gestion des utilisateurs

Utilisation de la commande usermod


## Utilisation

```shell
usermod [options] LOGIN

# Pour ajouter des groupes à un utilisateur
usermod --append --groups groupe1,groupe2 monUtilisateur

# Pour déplacer le home d'un utilisateur
usermod --home /home/monUtilisateur --move-home /home/newHome christophe

# Pour bloquer un utilisateur
usermod --lock monUtilisateur

# Pour débloquer un utilisateur
usermod --unlock monUtilisateur

# Pour définir le shell par défaut d'un utilisateur
usermod --shell INTERPRÉTEUR

# Pour définir un nouveau login
usermod --login IDENTIFIANT
```

## Autres

Pour lister les utilisateurs enregistrés sur le système

```shell
cat /etc/passwd
```
