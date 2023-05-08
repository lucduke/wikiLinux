
# Utilisation de la commande `ip`

La commande `ip` est un outil très puissant pour la gestion des réseaux sous Linux. Elle permet de configurer les interfaces réseau, de gérer les routes et les tunnels, de configurer les règles de pare-feu, et bien plus encore.

## Syntaxe de base

La syntaxe de base de la commande `ip` est la suivante :

```bash
ip [OPTIONS] OBJECT {COMMAND | help}
```

Les options sont des arguments facultatifs qui peuvent être utilisés pour personnaliser le comportement de la commande. Les objets sont les éléments du réseau que vous souhaitez configurer, tels que les interfaces, les routes, les tunnels, etc. Les commandes sont des actions spécifiques que vous pouvez effectuer sur ces objets, telles que la création, la suppression ou la modification.

## Exemples d'utilisation

Voici quelques exemples courants d'utilisation de la commande `ip` :

### Afficher les informations sur toutes les interfaces réseau

```bash
ip address
```

Cette commande affiche les informations sur toutes les interfaces réseau, telles que leur adresse IP, leur masque de sous-réseau et leur adresse MAC.

### Afficher les informations sur les interfaces réseau ayant une IPv4

```bash
ip -4 address
```

### Lister les interfaces réseau UP

```bash
ip link show up
```

### Configurer une adresse IP statique pour une interface

```bash
ip addr add 192.168.1.10/24 dev eth0
```

Cette commande configure l'adresse IP `192.168.1.10` avec un masque de sous-réseau de `24` bits pour l'interface `eth0`.


### Afficher la table de routage

```bash
ip route show
```


### Ajouter une route vers un réseau distant

```bash
ip route add 192.168.2.0/24 via 192.168.1.1 dev etho
```

Cette commande ajoute une route vers le réseau `192.168.2.0` avec un masque de sous-réseau de `24` bits, via la passerelle `192.168.1.1` et l'interface réseau `eth0`


### Afficher des statistiques sur les interfaces réseau

```bash
ip -s -h link
```

## Conclusion

La commande `ip` est un outil très utile pour la gestion des réseaux sous Linux. Ce tutoriel a couvert quelques exemples courants d'utilisation de la commande, mais il existe de nombreuses autres fonctionnalités avancées que vous pouvez explorer. Pour en savoir plus sur la commande `ip`, vous pouvez consulter la page de manuel avec la commande `man ip`.