
## Afficher la variable PATH

```bash
echo $PATH
```

## Ajouter temporairement un nouveau chemin dans la variable PATH

```bash
# Dans cet exemple, on ajouter le sous-répertoire bin dans notre home
PATH=$PATH:~/bin
```

## Ajouter un un nouveau chemin dans la variable PATH (modification persistente)

On édite son fichier bashrc

```bash
nano .bashrc
```

On ajoute le code suivant

```bash
if [ -d ~/bin ]
then
	PATH=$PATH:~/bin
fi
```
