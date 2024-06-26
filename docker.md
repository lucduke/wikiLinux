# Commandes Docker utiles



## Monitoring

```bash
# lister tous les conteneurs lancés
sudo docker ps

# lister tous les conteneurs lancés (y compris ceux stoppés)
sudo docker ps -a

# lister les images associés aux conteneurs lancés
sudo docker images

# lister les images de tous les conteneurs
sudo docker images -a

# lister les différents réseaux docker
sudo docker network ls
```



## Gestion

```bash
# Lancer un conteneur
sudo docker start <ID>
sudo docker start <NAME>

# Arrêter un conteneur
sudo docker stop <ID>
sudo docker stop <NAME>

# Lancer un shell dans un conteneur
sudo docker exec -it <ID> /bin/bash
sudo docker exec -it <NAME> /bin/bash

# Supprimer un conteneur
sudo docker rm <ID>
sudo docker rm <NAME>

# Afficher les logs d'un conteneur
sudo docker logs <ID> -f --tail 50
sudo docker logs <NAME> -f --tail 50

# Afficher l'espace disque utilisé par les conteneurs / images
sudo docker system df

# Supprimer les conteneurs / reseaux / images / volumes non utilisés
sudo docker system prune -a

# Ou de façon unitaire
sudo docker network prune
sudo docker image prune
sudo docker volume prune
```

