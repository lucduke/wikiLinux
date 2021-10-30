# Les alias


## Pour créer un alias
```bash
alias monAlias="ma command"
# exemple
alias maj="sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove"
```

## Pour supprimer un alias
```bash
unalias monAlias
```

## Pour lister les alias
```bash
alias
```

## Pour perenniser les alias
```bash
# On éditer le fichier .bashrc
nano ~.bashrc
# On ajoute ses alias à la fin du fichier
# On enregistre
```

