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

## Configurer une IP fixe sous debian 11
Pour configurer une adresse IP fixe sous Debian 11, vous devez modifier le fichier de configuration réseau. Voici les étapes à suivre :

1- Ouvrez un terminal sur votre système Debian 11.

2- Connectez-vous en tant qu'utilisateur root ou utilisez la commande `sudo` pour exécuter les commandes en tant qu'administrateur.

3- Localisez le fichier de configuration réseau `interfaces` situé dans le répertoire `/etc/network/`. Vous pouvez l'ouvrir avec un éditeur de texte tel que Nano ou Vim. Par exemple :

```bash
sudo nano /etc/network/interfaces
```

4- Dans le fichier `interfaces`, vous devriez voir une section décrivant votre interface réseau. Par défaut, cela ressemble à quelque chose comme ceci :
```makefile
auto eth0
iface eth0 inet dhcp
```

Vous devez modifier cette section pour spécifier l'adresse IP fixe. Remplacez `dhcp` par `static` et ajoutez les informations d'adresse IP, de masque de sous-réseau et de passerelle par défaut. Par exemple :

```makefile
auto eth0
iface eth0 inet static
address 192.168.1.100
netmask 255.255.255.0
gateway 192.168.1.1
```

Dans cet exemple, l'adresse IP `192.168.1.100`, le masque de sous-réseau `255.255.255.0` et la passerelle par défaut `192.168.1.1` sont utilisés. Assurez-vous d'adapter ces valeurs à votre réseau.

5- Vous pouvez également spécifier des adresses IP pour les serveurs DNS en ajoutant les lignes suivantes :
```makefile
dns-nameservers adresse_IP_DNS1 adresse_IP_DNS2
```

Par exemple, pour utiliser les serveurs DNS de Google, vous pouvez ajouter :
```makefile
dns-nameservers 8.8.8.8 8.8.4.4
```

6- Enregistrez les modifications et fermez l'éditeur de texte. Dans Nano, vous pouvez appuyer sur `Ctrl + O` pour enregistrer le fichier, puis `Ctrl + X` pour le fermer.

7- Redémarrez le service réseau pour appliquer les modifications :
```bash
sudo systemctl restart networking.service
```

Après avoir suivi ces étapes, votre interface réseau utilisera l'adresse IP fixe que vous avez configurée. Veuillez noter que certaines distributions Debian, comme Debian 11, utilisent Netplan pour la configuration réseau par défaut. Si vous utilisez Netplan, vous devrez modifier le fichier de configuration Netplan approprié au lieu du fichier `interfaces`.