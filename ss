# Utilisation de la commande ss

La commande `ss` (abréviation de "socket statistics") est un utilitaire de ligne de commande pour Linux qui permet de fournir des informations détaillées sur les sockets (points de connexion) réseau en cours d'utilisation sur votre système. La commande `ss` peut être très utile pour diagnostiquer des problèmes de réseau, surveiller les connexions actives, etc.

## Installation de la commande ss

La commande `ss` est généralement préinstallée sur les systèmes Debian 11. Si elle n'est pas déjà installée sur votre système, vous pouvez l'installer en utilisant la commande suivante :

```bash
sudo apt update
sudo apt install iproute2
```

## Afficher toutes les connexions TCP et UDP établies

```bash
ss -ut
```

## Afficher les sockets en cours d'utilisation

Pour afficher tous les sockets en cours d'utilisation sur votre système, utilisez la commande suivante :

```bash
ss -utap
```

Cette commande affichera une liste de tous les sockets en cours d'utilisation, y compris les sockets en écoute, les sockets établis, etc. Pour afficher des informations plus détaillées sur les sockets en cours d'utilisation, vous pouvez utiliser des options supplémentaires avec la commande `ss`.

Pour connaitre la correspondace entre les numéros de port et les services, éditer le fichier `/etc/services`

Pour avoir le résulat sans cette correspondance

```bash
ss -natup
```

## Filtrer les sockets en cours d'utilisation

La commande `ss` peut également être utilisée pour filtrer les sockets en cours d'utilisation en fonction de différents critères. Par exemple, pour afficher uniquement les sockets en écoute, vous pouvez utiliser la commande suivante :

```bash
ss -l
```

De même, vous pouvez utiliser d'autres options pour filtrer les sockets en fonction de leur état (`-s`), de leur famille de protocoles (`-f`), de leur type (`-t`), etc.

## Afficher les statistiques de sockets

La commande `ss` peut également être utilisée pour afficher des statistiques sur les sockets en cours d'utilisation sur votre système. Pour afficher des statistiques de sockets, utilisez la commande suivante :

```bash
ss -s
```

Cette commande affichera des statistiques détaillées sur les sockets, y compris le nombre total de sockets en cours d'utilisation, le nombre de sockets en écoute, le nombre de sockets établis, etc.

## Conclusion

La commande `ss` est un outil puissant pour surveiller les sockets réseau en cours d'utilisation sur votre système. En utilisant les options appropriées, vous pouvez filtrer les sockets en fonction de différents critères et afficher des informations détaillées sur les sockets en cours d'utilisation. La commande `ss` peut être utile pour diagnostiquer les problèmes de réseau, surveiller les connexions actives, etc.