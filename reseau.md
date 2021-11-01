# Le réseau



## Lister les interfaces réseaux

```bash
ip addr
# Pour afficher les routeurs utilisés
ip route
```



## Tester la connectivité

```bash
ping google.fr
# Pour limiter à 5 tentatives
ping -c 5 google.fr
```



## Afficher les entrées DNS d'un domaine

```bash
dig google.fr
```



## Télécharger un fichier

```bash
# Pour affichage contenu d'une page web
curl <url>
# Pour téléchargement d'une page web
wget <url>
curl -o <fichier_output> <url>
# Pour téléchargement récursif des liens contenus dans la page
wget -r <url>
```

