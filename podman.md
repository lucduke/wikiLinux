# Wiki Podman

Ce wiki présente une vue d'ensemble de Podman, une alternative sécurisée à Docker qui gère les conteneurs sans démon.

## Introduction

Podman (Pod Manager) permet de créer, exécuter et gérer des conteneurs de manière sécurisée. Sans dépendre d'un démon central, il met en avant une approche sans privilèges et est compatible avec les commandes Docker.

## Installation

### Sur Fedora/CentOS/RHEL

Utilisez dnf pour installer Podman :

```bash
sudo dnf install podman
```

### Sur Debian/Ubuntu

Installez Podman via apt :

```bash
sudo apt-get update
sudo apt-get install podman
```

## Utilisation de base

- **Lister les conteneurs**  
    Affiche tous les conteneurs (actifs et inactifs) :

    ```bash
    podman ps -a
    ```

- **Démarre un conteneur en mode interactif** :

    ```bash
    podman run -it <ID_du_conteneur> /bin/sh
    ```

- **Exécuter une commande dans un conteneur**  

    ```bash
    podman exec -it <ID_du_conteneur> /bin/sh
    ```

- **Démarrer un conteneur**  

    ```bash
    podman start <ID_du_conteneur>
    ```

- **Arrêter un conteneur**  

    ```bash
    podman stop <ID_du_conteneur>
    ```

- **Supprimer un conteneur**

    ```bash
    podman rm <ID_du_conteneur>
    ```

- **Afficher les logs d'un conteneur**

    ```bash
    podman logs <ID_du_conteneur>
    ```

## Gestion des Images

- **Lister les images**

    ```bash
    podman images
    ```

- **Télécharger une image**

    ```bash
    podman pull <nom_image>
    ```

- **Construire une image**

    ```bash
    podman build -t <nom_image> .
    ```

- **Supprimer une image**

    ```bash
    podman rmi <ID_image>
    ```

- **Supprimer toutes les images inutilisées**

    ```bash
    podman image prune -a
    ```

- **Mettre à jour une image**

    ```bash
    podman auto-update
    ```

## Gestion des Volumes

- **Lister les volumes**

    ```bash
    podman volume ls
    ```

- **Créer un volume**

    ```bash
    podman volume create <nom_volume>
    ```

- **Supprimer un volume**

    ```bash
    podman volume rm <nom_volume>
    ```

## Réseaux

- **Lister les réseaux**

    ```bash
    podman network ls
    ```

- **Créer un réseau**

    ```bash
    podman network create <nom_reseau>
    ```

- **Supprimer un réseau**

    ```bash
    podman network rm <nom_reseau>
    ```

## Interaction avec la CLI Journalctl (pour les conteneurs en mode service)

- **Afficher les logs détaillés récents**

    ```bash
    journalctl -xe
    ```

- **Voir les logs en temps réel des conteneurs gérés par systemd**

    ```bash
    journalctl -u <nom_du_service>.service -f
    ```

- **Voir les 100 dernières lignes des logs**

    ```bash
    journalctl -u <nom_du_service>.service -n 100 --no-pager
    ```

- **Activer au démarrage un service Podman géré par systemd**

    ```bash
    systemctl enable <nom_du_service>.service
    ```

- **Démarrer un service Podman géré par systemd**

    ```bash
    systemctl start <nom_du_service>.service
    ```

- **Arrêter un service Podman géré par systemd**

    ```bash
    systemctl stop <nom_du_service>.service
    ```

- **Redémarrer un service Podman géré par systemd**

    ```bash
    systemctl restart <nom_du_service>.service
    ```

- **Vérifier le statut d'un service Podman géré par systemd**

    ```bash
    systemctl status <nom_du_service>.service
    ```

## Les Pods et la Sécurité

- **Les Pods**  
    Podman gère les "pods", qui regroupent plusieurs conteneurs partageant des ressources comme le réseau, à la manière de Kubernetes.

- **Sécurité**  
    L'exécution sans privilèges réduit les risques et permet un environnement de conteneurisation plus sûr.

## Comparaison avec Docker

- Podman ne nécessite pas de démon pour fonctionner.
- Les commandes restent largement compatibles avec Docker.
- L'accent est mis sur la sécurité et l'exécution sans privilèges.

## Ressources Supplémentaires

- [Documentation Officielle](https://podman.io/)
- [GitHub Podman](https://github.com/containers/podman)
- Tutoriels et guides pour approfondir la gestion de conteneurs et des pods.

## Conclusion

Podman offre une alternative robuste et sécurisée à Docker. Grâce à son architecture sans démon et sa gestion avancée des pods, il constitue un outils intéressant pour le développement et la production de conteneurs.
