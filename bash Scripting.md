
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


# Les codes de sortie

## Introduction

Lorsqu'un script bash est exécuté, il peut se terminer avec un code de sortie qui indique si l'exécution du script s'est terminée avec succès ou s'il y a eu des erreurs. Les codes de sortie sont des entiers compris entre 0 et 255, où 0 indique une exécution réussie et toute valeur différente de zéro indique une erreur. Dans ce tutoriel, nous allons examiner comment gérer les codes de sortie dans les scripts bash.

## Afficher un code de sortie

Pour afficher le code de sortie d'un script bash, vous pouvez utiliser la variable spéciale `$?`. Cette variable contient le code de sortie de la dernière commande exécutée. Par exemple, si vous exécutez la commande `ls` et que le répertoire demandé n'existe pas, le code de sortie sera différent de zéro. Vous pouvez afficher le code de sortie en utilisant la commande `echo` :

```bash
ls /chemin/inexistant
echo $?
```

Cette commande affichera un code de sortie différent de zéro, indiquant qu'il y a eu une erreur.

## Modifier un code de sortie

Dans certains cas, vous pouvez vouloir modifier le code de sortie d'un script bash. Par exemple, si vous voulez vous assurer que votre script retourne un code de sortie spécifique en cas d'erreur. Pour cela, vous pouvez utiliser la commande `exit` qui permet de quitter le script en retournant un code de sortie spécifique. Par exemple, si vous voulez que votre script retourne un code de sortie égal à 1 en cas d'erreur, vous pouvez utiliser la commande suivante :

```bash
if [ ! -f fichier.txt ]
then
	echo "Le fichier n'existe pas"
	exit 1
fi
```

Si le fichier "fichier.txt" n'existe pas, le script affichera un message d'erreur et retournera un code de sortie égal à 1.

## Utilisation des codes de sortie dans les scripts shell

Les codes de sortie peuvent être utiles dans les scripts bash pour contrôler le flux d'exécution et prendre des décisions en fonction du résultat d'une commande. Par exemple, si vous voulez vérifier si un utilisateur a les permissions pour écrire dans un répertoire, vous pouvez utiliser la commande `test` pour vérifier les permissions et retourner un code de sortie approprié :

```bash
if ! test -w "/var/www/html"
then
	echo "Vous n'avez pas les permissions pour écrire dans le répertoire /var/www/html"
	exit 1
fi
```

Si l'utilisateur n'a pas les permissions pour écrire dans le répertoire "/var/www/html", le script affichera un message d'erreur et retournera un code de sortie égal à 1.

Autre exemple

```bash
ls /chemin/inexistant

if [ $? -eq 0 ]
then
	echo "Le chemin existe"
else
	echo "Le chemin n'existe pas"
fi
```

## Conclusion

Dans ce tutoriel, nous avons vu comment gérer les codes de sortie dans les scripts bash. Nous avons appris comment afficher le code de sortie d'une commande, comment modifier le code de sortie d'un script en utilisant la commande `exit`, et comment utiliser les codes de sortie dans les scripts pour prendre des décisions en fonction du résultat d'une commande. Les codes de sortie sont un élément important de la gestion des erreurs dans les scripts bash et peuvent aider à rendre votre code plus robuste et fiable.


# Les boucles while

## Introduction

Les boucles `while` sont un type de boucle utilisé en programmation pour exécuter un bloc de code plusieurs fois tant qu'une condition spécifiée est vraie. En Bash, les boucles `while` sont souvent utilisées pour parcourir des fichiers, des dossiers ou pour lire des entrées utilisateur.

## Structure

Voici la structure générale d'une boucle `while` en Bash :

```bash
while condition
do
    # Bloc de code à exécuter tant que la condition est vraie
done
```


La boucle `while` commence par la commande `while`, suivie de la condition à évaluer entre parenthèses. Si la condition est vraie, le bloc de code entre `do` et `done` sera exécuté. Une fois le bloc de code exécuté, la condition sera à nouveau évaluée. Si la condition est toujours vraie, le bloc de code sera exécuté à nouveau. Ce processus se répète jusqu'à ce que la condition devienne fausse.

## Exemples


Voici un exemple simple qui utilise une boucle `while` pour afficher les nombres de 1 à 10 :

```bash
#!/bin/bash

count=1

while [ $count -le 10 ]
do
    echo $count
    count=$(( $count +1 ))
done
```

Dans cet exemple, la variable `count` est initialisée à 1 avant la boucle. La condition dans la boucle `while` est que `count` doit être inférieur ou égal à 10. Tant que cette condition est vraie, le bloc de code entre `do` et `done` sera exécuté. Dans ce cas, le bloc de code affiche la valeur de `count` à l'écran et incrémente la variable `count` de 1 à chaque itération. Le processus se répète jusqu'à ce que `count` atteigne la valeur 11, qui n'est plus inférieure ou égale à 10, et la boucle s'arrête.

Les boucles `while` peuvent être utilisées pour parcourir des fichiers ou des dossiers. Voici un exemple de script qui utilise une boucle `while` et la commande `read` pour lire chaque ligne d'un fichier et l'afficher à l'écran :

```bash
#!/bin/bash

while read line
do
    echo $line
done < fichier.txt
```


Dans cet exemple, la boucle `while` lit chaque ligne du fichier `fichier.txt` et stocke la ligne dans la variable `line`. Le bloc de code entre `do` et `done` affiche la valeur de `line` à l'écran. La boucle se répète jusqu'à ce que toutes les lignes du fichier aient été lues.

## Conclusion

En résumé, les boucles `while` sont un outil utile en Bash pour répéter un bloc de code tant qu'une condition spécifiée est vraie. Les boucles `while` sont souvent utilisées pour parcourir des fichiers et des dossiers, ainsi que pour lire des entrées utilisateur.