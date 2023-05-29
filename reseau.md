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

## Configurer ses serveurs DNS sous debian 11
Voici les étapes pour configurer l'adresse du serveur DNS sous Debian 11 en utilisant systemd :

1- Ouvrez un terminal sur votre système Debian 11.

2- Connectez-vous en tant qu'utilisateur root ou utilisez la commande sudo pour exécuter les commandes en tant qu'administrateur.

3- Utilisez la commande suivante pour ouvrir le fichier de configuration systemd-resolved :

```bash
sudo nano /etc/systemd/resolved.conf
```

Dans le fichier resolved.conf, recherchez la ligne commençant par DNS=. Si vous ne voyez pas cette ligne, vous pouvez l'ajouter à la fin du fichier.

Sur la ligne DNS=, spécifiez les adresses IP de vos serveurs DNS séparées par des espaces ou des virgules. Par exemple, pour utiliser les serveurs DNS de Google, vous pouvez ajouter :

```makefile
DNS=8.8.8.8 8.8.4.4
```

Si vous le souhaitez, vous pouvez également ajouter la ligne FallbackDNS= et spécifier des adresses IP de serveurs DNS de secours, qui seront utilisées si les serveurs DNS principaux échouent.

Enregistrez les modifications et fermez l'éditeur de texte en utilisant Nano (Ctrl + O pour enregistrer, puis Ctrl + X pour fermer).

Redémarrez le service systemd-resolved pour appliquer les modifications :

```bash
sudo systemctl restart systemd-resolved.service
```

Après avoir suivi ces étapes, systemd utilisera les serveurs DNS que vous avez configurés pour résoudre les noms de domaine.