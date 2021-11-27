# Utilisation d'anacron

Anacron sert à lancer automatiquement des tâches informatiques (sauvegardes ou autres) à des intervalles prédéfinis (tout comme cron).

Anacron utilise des indications de temps relatives (« une fois par jour / par semaine / par mois »). Si vous avez demandé une tâche toute les semaines, et que votre PC est démarré seulement au bout de 10 jours, anacron constatera le retard, et lancera donc la tâche juste après le démarrage de votre PC.



## Configurer anacron (root)

On édite le fichier de configuration

```shell
sudo nano /etc/anacrontab
```



Le fichier de configuration présente la structure suivante :

- intervalle = nombre de jour entre les lancements.
- délai = nombre de minutes entre le démarrage du PC et le lancement de la tâche : pour ne pas ralentir le démarrage PC, pour ne pas lancer plusieurs tâches en même temps (à ce titre, vérifiez qu'une tâche déjà dans le fichier ne se lance pas au même nombre de minutes après le démarrage que la nouvelle).
- étiquette = nom de la tâche (choisi par vous). Attention, jamais d'espace vide ou de slash.
- commande = une commande bash, le nom d'un programme, d'un script …. les espaces vides sont autorisés.



Exemple de commandes

```
1	10	nettoyage.log	find /var/log/ -type f -regex '.*\.[0-9]+\.gz$' -delete
1	20	netoyage.journal	journalctl --vacuum-time=1d > /dev/null 2>&1
```



## Configurer anacron (utilisateur courant)

On crée les 3 répertoires nécessaires

```shell
mkdir ~/.anacron ~/.anacron/etc ~/.anacron/spool
```

On crée le fichier texte de configuration

```
touch ~/.anacron/etc/anacrontab
```

On édite le fichier de configuration

```shell
nano ~/.anacron/etc/anacrontab
```

Et on ajoute les données suivantes en pensant à personnaliser VOTRE_IDENTIFIANT

```
# Ceci est mon anacrontab perso.

SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/home/VOTRE_IDENTIFIANT/.anacron

1	10	thumb.flush1	find ~/.thumbnails -type f -ctime +7 -delete
1	11	thumb.flush2	find ~/.cache/thumbnails -type f -ctime +7 -delete
```

Enfin, on edite son fichier profil

```shell
nano ~/.profil
```

Et on ajoute cette ligne à la fin

```
/usr/sbin/anacron -s -t ${HOME}/.anacron/etc/anacrontab -S ${HOME}/.anacron/spool
```



## Suivre l'execution des jobs

Pour consulter la dernière execution d'un job

```shell
cat /var/spool/anacron/<id_job>
```

