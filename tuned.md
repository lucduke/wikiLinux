# Tuned : Optimisez les performances de votre système Linux

![Tuned Logo](https://tuned-project.org/img/tuned-logo.png)

**Tuned** est un démon de réglage de performances pour systèmes Linux, conçu pour optimiser automatiquement les paramètres du système en fonction de cas d'utilisation spécifiques. Développé initialement par Red Hat, il est aujourd'hui largement utilisé sur les distributions Fedora, CentOS, RHEL et d'autres systèmes dérivés.

## 🚀 Pourquoi utiliser Tuned ?

Dans un environnement Linux, les performances peuvent varier selon les configurations matérielles et logicielles. Tuned simplifie l'optimisation en proposant :

- **Des profils prédéfinis** pour différents workloads (serveurs, postes de travail, virtualisation, etc.).
- **Un ajustement dynamique** des paramètres système (CPU, disque, réseau, énergie).
- **Une personnalisation fine** via des profils personnalisables.

## 🔧 Fonctionnalités clés

- **Profils prêts à l'emploi** :
  - `throughput-performance` : Maximise le débit (idéal pour les serveurs).
  - `powersave` : Réduit la consommation énergétique (pour les portables).
  - `latency-performance` : Minimise la latence (applications temps réel).
  - `virtual-guest`/`virtual-host` : Optimisé pour la virtualisation.

- **Adaptation en temps réel** : Ajuste les paramètres selon la charge de travail.
- **Intégration avec D-Bus** : Permet un contrôle dynamique via des scripts ou API.
- **Surveillance active** : Réagit aux événements système (ex : passage sur batterie).

## 🛠 Installation et utilisation

### Installation

```bash
# Sur Fedora/CentOS/RHEL :
sudo dnf install tuned

# Sur Ubuntu/Debian :
sudo apt install tuned
```

###  Démarrer le service

```bash
sudo systemctl start tuned && sudo systemctl enable tuned
```

### Vérifier le profil actif

```bash
tuned-adm active
```

### Lister les profils disponibles

```bash
tuned-adm list
```

### Activer un profil

```bash
sudo tuned-adm profile throughput-performance
```
