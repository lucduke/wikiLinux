# Création d'un serveur SAMBA/CIFS

## Étape 1 : Installation de Samba

Tout d'abord, assurez-vous d'être connecté à votre serveur Debian 12 en tant qu'administrateur (utilisateur root) ou avec des privilèges sudo. Ouvrez un terminal et suivez ces étapes :

Mettez à jour vos dépôts et installez Samba :

```bash
sudo apt update
sudo apt install samba samba-common cifs-utils -y
```
Une fois l'installation terminée, Samba sera prêt à être configuré.

## Étape 2 : Configuration de Samba

Ouvrez le fichier de configuration Samba à l'aide d'un éditeur de texte (par exemple, nano ou vim) :

```bash
sudo nano /etc/samba/smb.conf
```

Localisez la section `[global]`. C'est là que vous pouvez spécifier des paramètres globaux pour le serveur Samba. Voici quelques exemples de paramètres que vous pourriez définir :

```text
workgroup = NOM_DU_GROUPE_DE_TRAVAIL
server string = Description_du_serveur
security = user
```
Remplacez `NOM_DU_GROUPE_DE_TRAVAIL` par le nom de votre groupe de travail Windows et `Description_du_serveur` par une description pour votre serveur.

Ajoutez des sections pour chaque partage que vous souhaitez créer. Par exemple, pour créer un partage appelé "PartageDocuments", ajoutez :

```bash
[PartageDocuments]
  path = \chemin\vers\le\dossier
  comment = Partage de documents
  browseable = Yes
  writeable = Yes
  only guest = no
  create mask = 0775
  directory mask = 0775 
  public = no
```

Remplacez `\chemin\vers\le\dossier` par le chemin absolu du dossier que vous souhaitez partager.

Sauvegardez vos modifications et quittez l'éditeur.

## Étape 3 : Création d'utilisateurs Samba

Créez un utilisateur Samba en utilisant la commande smbpasswd. Assurez-vous que cet utilisateur existe déjà sur votre système et qu'il dispose des droits pour écrire dans le répertoire partagé.

```bash
sudo smbpasswd -a nom_utilisateur
```

Vous serez invité à définir un mot de passe pour cet utilisateur.

## Étape 4 : Redémarrage de Samba

Après avoir configuré Samba, redémarrez les services Samba et NetBIOS pour appliquer les modifications que vous avez apportées à la configuration :

```bash
sudo systemctl restart smbd
sudo systemctl restart nmbd
```

## Étape 5 : Autorisations de pare-feu

Si vous avez un pare-feu activé sur votre serveur Debian, vous devrez peut-être autoriser le trafic Samba. Par exemple, si vous utilisez UFW :

```bash
sudo ufw allow Samba
```

Assurez-vous d'ajuster vos règles de pare-feu en fonction de votre configuration.

## Étape 6 : Accéder aux partages depuis un client

Sur un ordinateur Windows, ouvrez l'Explorateur de fichiers et entrez l'adresse IP ou le nom du serveur dans la barre d'adresse, par exemple `\\adresse_ip_du_serveur` ou `\\nom_du_serveur`. Vous devriez voir les partages que vous avez configurés.

Lorsqu'on vous demande des informations d'identification, entrez le nom d'utilisateur Samba et le mot de passe que vous avez créés à l'étape 3.
 
C'est tout ! Vous avez configuré avec succès un serveur Samba sur Debian 12 pour partager des fichiers avec des clients Windows. N'oubliez pas d'adapter ce tutoriel à vos besoins spécifiques et à votre configuration.