
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

# Les calculs

Pour additionner 
```shell
expr 10 + 15
```

Pour soustraire
```shell
expr 10 - 15
```

Pour diviser
```shell
expr 10 / 15
```

Pour multiplier
```shell
expr 10 \* 15
```

# Les conditions (si)

Construction du bloc

```bash
#!/bin/bash

nombre=300

if [ $nombre -eq 300 ]
then
	echo "La condition est vérifiée"
else
	echo "La condition n'est pas vérifiée"
fi
```

Exemples d'opérateur de comparaison de nombres

| Opérateur         | Syntaxe |
|:----------------- |:------- |
| Egalité           | -eq     |
| N'est pas égal    | -ne     |
| Plus grand que    | -gt     |
| Supérieur ou égal | -ge     |
| Plus petit que    | -lt     |
| Inférieur ou égal | -le     |

Pour tester la présence d'un fichier

```bash
if [ -f ~/monfichier ]
then
fi
```

Pour tester la présence d'un dossier

```bash
if [ -d ~/mondossier ]
then
fi
```

Pour plus d'info

```bash
man test
```


Pour tester la présence d'un programme

```bash
if command -v $programme
then
fi
```

