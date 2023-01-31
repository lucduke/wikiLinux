
# Les variables

Pour initialiser une variable, on la nomme en minuscule car ce n'est pas une variable système

```bash
variable="value"
```

Pour référencer une variable

```bash
echo $variable
echo "$variable"
echo 'une'$variable
```

Pour stocker dans une variable le résultat d'une commande

```bash
fichiers=$(ls)
echo $fichiers
```

Pour afficher l'ensemble des variables système

```bash
env
```
