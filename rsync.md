# Guide complet de rsync sous Linux

## Table des matières

1. [Introduction](#introduction)
2. [Syntaxe de base](#syntaxe-de-base)
3. [Options les plus courantes](#options-les-plus-courantes)
4. [Synchronisation locale](#synchronisation-locale)
5. [Synchronisation distante via SSH](#synchronisation-distante-via-ssh)
6. [Synchronisation depuis un serveur distant](#synchronisation-depuis-un-serveur-distant)
7. [Options avancées](#options-avancées)
8. [Exemples pratiques](#exemples-pratiques)
9. [Bonnes pratiques](#bonnes-pratiques)

---

## Introduction

`rsync` (Remote Sync) est un utilitaire Linux puissant pour synchroniser des fichiers et des répertoires, localement ou entre deux machines. Il utilise un algorithme de delta-transfer qui ne transfère que les différences entre les fichiers source et destination, ce qui le rend très efficace.

**Installation** (si non présent) :

```bash
# Debian/Ubuntu
sudo apt install rsync

# Fedora/RHEL/CentOS
sudo dnf install rsync
# ou
sudo yum install rsync

# Arch Linux
sudo pacman -S rsync
```

---

## Syntaxe de base

```bash
rsync [options] source destination
```

- **source** : le fichier ou répertoire à copier
- **destination** : l'emplacement de destination

> **Important** : Avec rsync, un `/` final sur un répertoire source change le comportement :
> - `rsync -a /src/dir /dest` → crée `/dest/dir/` avec le contenu
> - `rsync -a /src/dir/ /dest` → copie le contenu directement dans `/dest/`

---

## Options les plus courantes

| Option | Description |
|--------|-------------|
| `-a` | Mode archive (équivalent à `-rlptgoD`) |
| `-v` | Mode verbeux (affiche les détails) |
| `-z` | Compression pendant le transfert |
| `-h` | Affichage des tailles en format lisible |
| `-P` | Affiche la progression + reprend les transferts interrompus |
| `-n` | Simulation (dry-run) — montre ce qui serait fait sans exécuter |
| `--delete` | Supprime dans la destination les fichiers absents de la source |
| `--exclude` | Exclut des fichiers/répertoires selon un motif |
| `--include` | Inclut des fichiers/répertoires (utile avec --exclude) |
| `-u` | Update — ne remplace pas les fichiers plus récents à la destination |
| `--progress` | Affiche la progression du transfert |
| `--stats` | Affiche des statistiques après le transfert |
| `-e` | Spécifie le shell à utiliser (ex: `ssh`) |
| `--log-file` | Écrit un journal des opérations dans un fichier |

### Détail du mode archive `-a`

L'option `-a` combine plusieurs flags :

| Flag | Rôle |
|------|------|
| `-r` | Récursif (parcourt les sous-répertoires) |
| `-l` | Conserve les liens symboliques |
| `-p` | Conserve les permissions |
| `-t` | Conserve les dates de modification |
| `-g` | Conserve le groupe |
| `-o` | Conserve le propriétaire (nécessite root) |
| `-D` | Conserve les fichiers de périphériques et spéciaux |

---

## Synchronisation locale

### Copier un répertoire vers un autre emplacement local

```bash
# Copier /home/user/documents vers /backup/documents
rsync -av /home/user/documents/ /backup/documents/
```

### Synchronisation avec suppression des fichiers obsolètes

```bash
# La destination sera un miroir exact de la source
rsync -av --delete /home/user/documents/ /backup/documents/
```

### Simulation avant exécution

```bash
# Toujours tester avec -n avant de lancer une vraie synchronisation
rsync -avn --delete /home/user/documents/ /backup/documents/
```

### Exclure certains fichiers

```bash
# Exclure les fichiers .log et le répertoire cache
rsync -av --exclude='*.log' --exclude='cache/' /home/user/documents/ /backup/documents/

# Exclure depuis un fichier de motifs
rsync -av --exclude-from='exclusions.txt' /home/user/documents/ /backup/documents/
```

Contenu typique de `exclusions.txt` :
```
*.log
*.tmp
cache/
.git/
node_modules/
```

---

## Synchronisation distante via SSH

### Prérequis

- SSH doit être installé et fonctionnel sur les deux machines
- Authentification par clé SSH recommandée pour éviter de saisir le mot de passe à chaque fois

```bash
# Générer une clé SSH (si ce n'est pas déjà fait)
ssh-keygen -t ed25519

# Copier la clé sur le serveur distant
ssh-copy-id user@serveur_distant
```

### Envoyer des fichiers vers un serveur distant

```bash
# Syntaxe générale
rsync -avz -e ssh [source_locale] [user]@[hote_distant]:[chemin_distant]

# Exemple concret
rsync -avz -e ssh /home/user/documents/ user@192.168.1.100:/home/user/backup/
```

### Utiliser un port SSH personnalisé

```bash
# Si le serveur SSH écoute sur le port 2222
rsync -avz -e 'ssh -p 2222' /home/user/documents/ user@serveur:/home/user/backup/
```

### Synchroniser depuis un serveur distant vers la machine locale

```bash
# Syntaxe générale
rsync -avz -e ssh [user]@[hote_distant]:[chemin_distant] [destination_locale]

# Exemple concret
rsync -avz -e ssh user@192.168.1.100:/home/user/data/ /home/user/backup/data/
```

### Synchronisation entre deux serveurs distants

```bash
# Depuis un serveur A vers un serveur B (via la machine locale)
rsync -avz -e ssh user@serveur_a:/data/ user@serveur_b:/backup/
```

---

## Synchronisation depuis un serveur distant

### Télécharger un répertoire complet

```bash
# Avec progression visible
rsync -avz --progress -e ssh user@serveur:/var/www/html/ /home/user/site_web/
```

### Reprendre un transfert interrompu

```bash
# L'option -P reprend automatiquement les transferts partiels
rsync -avzP -e ssh user@serveur:/chemin/grand_fichier.iso /home/user/
```

### Synchronisation avec miroir exact

```bash
# La destination devient identique à la source distante
rsync -avz --delete -e ssh user@serveur:/home/user/project/ /home/user/project/
```

---

## Options avancées

### Limiter la bande passante

```bash
# Limiter à 1000 Ko/s (1 Mo/s)
rsync -avz --bwlimit=1000 -e ssh /home/user/data/ user@serveur:/backup/
```

### Copier uniquement les fichiers plus récents

```bash
# Ne transfère que si la source est plus récente
rsync -avu /home/user/documents/ /backup/documents/
```

### Conserver les fichiers supprimés côté source

```bash
# Au lieu de supprimer, déplace les fichiers obsolètes vers un dossier backup
rsync -av --delete --backup --backup-dir=/backup/old_files/ /source/ /dest/
```

### Synchronisation basée sur la taille uniquement (ignorer la date)

```bash
rsync -av --size-only /source/ /dest/
```

### Exclure selon la taille des fichiers

```bash
# Exclure les fichiers de plus de 100 Mo
rsync -av --max-size='100m' /source/ /dest/

# Exclure les fichiers de moins de 10 Ko
rsync -av --min-size='10k' /source/ /dest/
```

### Transférer uniquement certains types de fichiers

```bash
# Ne transférer que les fichiers .jpg et .png
rsync -av --include='*.jpg' --include='*.png' --exclude='*' /source/ /dest/
```

> **Note** : L'ordre des `--include` et `--exclude` est important. rsync applique les règles dans l'ordre. Le `--exclude='*'` final attrape tout ce qui n'a pas été inclus.

---

## Exemples pratiques

### 1. Backup quotidien d'un répertoire personnel

```bash
rsync -avh --delete --log-file=/var/log/rsync-backup.log /home/user/ /backup/user/
```

### 2. Déploiement d'un site web

```bash
# Simulation d'abord
rsync -avn --delete --exclude='.git' --exclude='.env' ./build/ user@serveur:/var/www/html/

# Puis exécution réelle
rsync -avz --delete --exclude='.git' --exclude='.env' ./build/ user@serveur:/var/www/html/
```

### 3. Migration de données entre serveurs

```bash
# Avec compression, progression et reprise possible
rsync -avzP --stats -e 'ssh -p 2222' user@ancien_serveur:/home/ user@nouveau_serveur:/home/
```

### 4. Synchronisation de photos depuis un appareil

```bash
rsync -av --progress --exclude='Thumbs.db' /media/user/CAMERA/DCIM/ /home/user/Photos/
```

### 5. Sauvegarde incrémentale avec horodatage

```bash
DATE=$(date +%Y-%m-%d_%H%M%S)
rsync -av --delete --link-dest=/backup/current/ /home/user/ /backup/$DATE/
rm /backup/current
ln -s /backup/$DATE /backup/current
```

> Cette technique utilise des liens matériels (`--link-dest`) pour économiser l'espace disque tout en ayant des snapshots complets.

---

## Bonnes pratiques

### 1. Toujours tester avec `--dry-run` (`-n`)

```bash
# Vérifier ce qui va être fait
rsync -avn --delete /source/ /dest/
```

### 2. Utiliser le slash final correctement

```bash
# Copie le CONTENU de source/ dans dest/
rsync -a /source/ /dest/

# Copie le RÉPERTOIRE source dans dest/ (crée dest/source/)
rsync -a /source /dest/
```

### 3. Utiliser SSH pour les transferts distants

Toujours privilégier SSH pour sécuriser les transferts réseau :

```bash
rsync -avz -e ssh source/ user@host:dest/
```

### 4. Automatiser avec cron

```bash
# Éditer la crontab
crontab -e

# Backup toutes les nuits à 2h du matin
0 2 * * * /usr/bin/rsync -avz --delete /home/user/ /backup/user/ >> /var/log/rsync-cron.log 2>&1
```

### 5. Vérifier l'intégrité après transfert

```bash
# L'option -c force la vérification par checksum (plus lent mais plus sûr)
rsync -avc /source/ /dest/
```

### 6. Gérer les permissions et propriétaires

```bash
# Pour conserver les propriétaires, exécuter en root ou avec sudo
sudo rsync -av /source/ /dest/
```

---

## Résumé des commandes essentielles

| Action | Commande |
|--------|----------|
| Copie locale basique | `rsync -av source/ dest/` |
| Simulation | `rsync -avn source/ dest/` |
| Miroir avec suppression | `rsync -av --delete source/ dest/` |
| Vers serveur distant | `rsync -avz -e ssh source/ user@host:dest/` |
| Depuis serveur distant | `rsync -avz -e ssh user@host:source/ dest/` |
| Avec progression | `rsync -avzP source/ dest/` |
| Avec exclusion | `rsync -av --exclude='motif' source/ dest/` |
| Limiter bande passante | `rsync -avz --bwlimit=1000 source/ dest/` |

---

## Ressources

- Page de manuel : `man rsync`
- Aide rapide : `rsync --help`
- Documentation officielle : https://rsync.samba.org/
- Générateur de commandes rsync : https://rsyncinator.app
