# Le réseau



## Lister les interfaces réseaux

```bash
# Lister les interfaces réseaux
ip addr

# Lister les paquets émis / reçus
ip -s -h -a link

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



## Explorer son réseau local

```shell
# Découvrir les PC du réseau local (via un ping)
sudo nmap --dns-servers 192.168.1.1 -sn 192.168.1.*

# Découvrir les caractéristiques d'un PC distant
sudo nmap -Pn -A -O 192.168.1.101
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

