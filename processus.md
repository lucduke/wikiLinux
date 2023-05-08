# Les processus



## Lister les processus

```bash
# Pour lister les processus du shell actif
ps -f
# Pour lister tous les processus actifs d'un user donné
ps -f -u christophe
# Pour lister tous les processus
ps -efH
ps aux
# Pour afficher les PID d'un programme
pidof <nom_programme>
# Pour lister tous les processus d'un programme
ps -f -C bash
# Pour afficher les informations d'un processus ID
ps -f -q <PID>
```



## Stopper les processus

```bash
kill <pid>
# Pour arrêter tous les processus d'un programme
killall <nom_programme>
```

