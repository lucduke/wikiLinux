
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

Pour tester la présence d'un argument en entrée de programme

``` bash
if [ $# -ne 1 ]
then
	echo "Aucun argument n'a été saisi"
	exit 1
fi
```

Pour plus d'info

```bash
man test
```


Pour tester la présence d'un programme

```bash
if command -v $programme > /dev/null 2>&1
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

## Divers

Pour activer la sortie du script en cas d'erreur

```bash
set -o errexit
```

Pour activer la sortie du script en cas d'utilisation d'une variable non définie

```bash
set -o nounset
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


# Les boucles for

## Introduction

Les boucles `for` sont un élément essentiel de la programmation en bash. Elles sont utilisées pour parcourir des listes, des tableaux ou des séquences de nombres. Dans ce tutoriel, nous allons apprendre à utiliser les boucles `for` en bash.

## Syntaxe des boucles for

La syntaxe des boucles `for` en bash est la suivante :

```bash
for variable in liste
do
	instruction(s)
done
```

La variable est une variable de boucle qui est initialisée à chaque itération de la boucle avec la valeur courante de la liste. La liste peut être une liste de valeurs séparées par des espaces, un tableau ou une séquence de nombres.

## Boucle for avec une liste de valeurs

Supposons que nous voulions afficher les noms des jours de la semaine. Nous pouvons utiliser une boucle `for` pour parcourir une liste de valeurs.

```bash
for day in lundi mardi mercredi jeudi vendredi samedi dimanche
do
	echo $day
done
```

Dans cet exemple, nous avons utilisé la variable "day" pour stocker chaque jour de la semaine à chaque itération de la boucle. L'instruction "echo $day" affiche le nom de chaque jour sur la console.

## Boucle for avec un tableau

Supposons que nous avons un tableau de noms d'utilisateurs et que nous voulons afficher chaque nom d'utilisateur. Nous pouvons utiliser une boucle `for` pour parcourir le tableau.

```bash
users=("John" "Jane" "James" "Julia")
for user in ${users[@]}
do
	echo $user
done
```

Dans cet exemple, nous avons créé un tableau "users" contenant les noms d'utilisateurs. La variable "user" est utilisée pour stocker chaque nom d'utilisateur à chaque itération de la boucle. L'instruction "echo $user" affiche chaque nom d'utilisateur sur la console.

## Boucle for avec une séquence de nombres

Supposons que nous voulions afficher les nombres de 1 à 10. Nous pouvons utiliser une boucle `for` pour parcourir une séquence de nombres.

```bash
for i in {1..10}
do
	echo $i
done
```

Dans cet exemple, nous avons utilisé la variable "i" pour stocker chaque nombre de la séquence de nombres. L'instruction "echo $i" affiche chaque nombre sur la console.

## Conclusion

Nous avons appris à utiliser les boucles `for` en bash. Nous avons vu comment utiliser les boucles `for` avec une liste de valeurs, un tableau et une séquence de nombres.

# Les flux de données

Dans Bash, les flux de données sont des flux de texte qui peuvent être transmis entre différents programmes en utilisant des canaux ou des redirections. Les flux de données peuvent être utilisés pour transmettre des données entre des programmes en temps réel, ou pour stocker des données dans des fichiers ou d'autres sources.

Il existe trois types de flux de données en Bash : l'entrée standard (stdin), la sortie standard (stdout) et la sortie d'erreur standard (stderr).

- L'entrée standard (stdin) : Il s'agit du flux de données d'entrée qui reçoit les données à partir d'un périphérique d'entrée ou d'un autre programme.
- La sortie standard (stdout) : Il s'agit du flux de données de sortie qui envoie les données à un périphérique de sortie ou à un autre programme.
- La sortie d'erreur standard (stderr) : Il s'agit du flux de données de sortie d'erreur qui envoie les erreurs et les messages d'erreur à un périphérique de sortie ou à un autre programme.  

Voici comment gérer les flux de données en Bash :

## Redirection de la sortie standard (stdout)

La redirection de la sortie standard (stdout) permet de diriger la sortie d'un programme vers un fichier plutôt que de l'afficher sur l'écran. Pour rediriger la sortie standard, utilisez le symbole de redirection " > " suivi du nom du fichier :

```bash
commande > fichier.txt
```

Cela enregistrera la sortie de la commande dans le fichier "fichier.txt".

Pour rediriger stdout vers /dev/null (et n'obtenir que les erreurs)

```bash
commande > /dev/null
```


## Redirection de l'entrée standard (stdin)

La redirection de l'entrée standard (stdin) permet de fournir des données à un programme à partir d'un fichier plutôt que de l'entrée utilisateur standard. Pour rediriger l'entrée standard, utilisez le symbole de redirection " < " suivi du nom du fichier :

```bash
commande < fichier.txt
```

Cela fournira l'entrée du programme à partir du fichier "fichier.txt".

## Redirection de la sortie d'erreur standard (stderr)

La redirection de la sortie d'erreur standard (stderr) permet de rediriger les erreurs et les messages d'erreur d'un programme vers un fichier plutôt que de les afficher sur l'écran. Pour rediriger la sortie d'erreur standard, utilisez le symbole de redirection " 2> " suivi du nom du fichier :

``` bash
commande 2> erreur.txt
```

Cela enregistrera les erreurs et les messages d'erreur de la commande dans le fichier "erreur.txt".

Si on redirige stderr vers /dev/null, on ne conserve que les bons résultats

``` bash
commande 2> /dev/null
```

## Redirection de la sortie standard et d'erreur standard

Il est également possible de rediriger à la fois la sortie standard et la sortie d'erreur standard vers des fichiers différents. Pour rediriger à la fois la sortie standard et la sortie d'erreur standard, utilisez le symbole de redirection " &> " suivi du nom du fichier :

``` bash
commande &> sortie-erreur.txt
```

Cela enregistrera à la fois la sortie standard et la sortie d'erreur standard de la commande dans le fichier "sortie-erreur.txt".

Pour rediriger la sortie standard dans un fichier et la sortie erreur dans un autre

``` bash
commande 1>sortie-standard.txt 2>sortie-erreur.txt
```

## Les canaux (pipes)

Les canaux (pipes) permettent de transmettre des données en temps réel entre deux programmes. Pour utiliser un canal, utilisez le symbole de tuyau " | " pour connecter deux programmes

# Les fonctions

Les fonctions sont des blocs de code réutilisables qui peuvent être appelés plusieurs fois dans un script. Les fonctions peuvent prendre des paramètres en entrée, effectuer des calculs ou des opérations, et renvoyer une valeur en sortie.

## Comment définir une fonction en Bash

``` bash
nom_de_fonction () {
	instructions
}
```

Le nom de la fonction peut être choisi librement, mais il doit commencer par une lettre ou un soulignement. Les instructions à l'intérieur de la fonction doivent être placées entre les accolades.

Voici un exemple de fonction simple qui affiche "Hello World!" :

``` bash
hello_world () {
   echo "Hello World!"
}
```

Pour appeler cette fonction, il suffit d'écrire son nom suivi de parenthèses :

``` bash
hello_world
```

Cela affichera "Hello World!" sur l'écran.

Les fonctions peuvent également prendre des paramètres en entrée. Les paramètres sont des valeurs que la fonction utilise pour effectuer ses calculs ou ses opérations. Les paramètres sont référencés à l'aide de variables spéciales dans la fonction.

Voici un exemple de fonction qui prend un paramètre en entrée et l'affiche sur l'écran :

``` bash
afficher_parametre () {
   echo "Le paramètre est : $1"
}
```

Dans cette fonction, "$1" fait référence au premier paramètre. Pour appeler cette fonction avec le paramètre "Bonjour", il suffit d'écrire :

``` bash
afficher_parametre Bonjour
```

Cela affichera "Le paramètre est : Bonjour" sur l'écran.

Les fonctions peuvent également renvoyer une valeur en sortie. Pour renvoyer une valeur, utilisez la commande "return" suivie de la valeur à renvoyer.

Voici un exemple de fonction qui calcule la somme de deux nombres et renvoie le résultat :

``` bash
somme () {
   local resultat=$(( $1 + $2 ))
   return $resultat
}
```

Dans cette fonction, "$1" et "$2" font référence aux deux premiers paramètres. La commande "local" est utilisée pour créer une variable locale qui n'est visible que dans la fonction. La valeur de la somme est stockée dans la variable "resultat", puis renvoyée à l'aide de la commande "return".

Pour appeler cette fonction et stocker la valeur renvoyée dans une variable, utilisez la commande suivante :

``` bash
somme 5 10
resultat=$?

echo "La somme est : $resultat"
```

La première commande appelle la fonction "somme" avec les paramètres 5 et 10. La valeur renvoyée est stockée dans la variable spéciale "$?". On utilise ensuite la variable "resultat" pour afficher la somme

## Conclusion

Les fonctions en Bash sont un outil puissant qui peut aider à rendre les scripts plus modulaires et plus facilement compréhensibles. Avec les fonctions, vous pouvez encapsuler des blocs de code complexes, les réutiliser plusieurs fois et les modifier facilement sans avoir à changer tout le script.

# Créer un menu avec Select

## Introduction

Le constructeur de contrôle de flux "select" permet de créer un menu interactif dans un script Bash. Avec "select", l'utilisateur peut sélectionner une option dans une liste prédéfinie à l'aide de chiffres ou de lettres, et le script effectuera une action en fonction de l'option sélectionnée.

## Syntaxe

Voici la syntaxe de base de "select" :

``` bash
select variable in option1 option2 option3
do
   case $variable in
      option1) instructions ;;
      option2) instructions ;;
      option3) instructions ;;
      *) echo "Option invalide. Veuillez réessayer." ;;
   esac
done
```

Explication de la syntaxe :

- "variable" est le nom de la variable qui contiendra l'option sélectionnée par l'utilisateur.
- "option1", "option2", "option3" sont les options disponibles dans le menu.
- "case" est utilisé pour vérifier quelle option a été sélectionnée et exécuter les instructions correspondantes.
- "esac" marque la fin de la clause "case".
- "\*)" est utilisé pour traiter toutes les options invalides qui ne sont pas prises en compte dans le cas.

Voici un exemple de menu interactif simple :

``` bash
select fruit in Pommes Bananes Oranges Quitter
do
   case $fruit in
      Pommes) echo "Vous avez choisi Pommes." ;;
      Bananes) echo "Vous avez choisi Bananes." ;;
      Oranges) echo "Vous avez choisi Oranges." ;;
      Quitter) echo "Au revoir !" ; break ;;
      *) echo "Option invalide. Veuillez réessayer." ;;
   esac
done
```

Dans cet exemple, l'utilisateur peut sélectionner l'une des options "Pommes", "Bananes", "Oranges" ou "Quitter". Si l'utilisateur choisit "Quitter", le script affiche "Au revoir !" et quitte la boucle "select". Si l'utilisateur choisit une option invalide, le script affiche "Option invalide. Veuillez réessayer.".

## Conclusion

"select" est un outil utile pour créer des menus interactifs dans les scripts Bash. Il permet aux utilisateurs de sélectionner des options à partir d'une liste prédéfinie et simplifie l'interaction avec le script.