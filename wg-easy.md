# Installation de WireGuard-Easy sur mon VPS Ionos

## Pré-requis

- Un VPS avec une distribution Linux (Debian, Ubuntu, etc.)
- Accès root ou sudo sur le VPS

## Étapes d'installation

1. Mettre à jour le système

   ```bash
   sudo apt update && sudo apt upgrade -y
   ```

2. Installer WireGuard

   ```bash
   sudo apt update && sudo apt install -y wireguard
   ```

3. Vérifier l'installation

   ```bash
   wg --version
   ```

## Configuration de wg-easy dans un conteneur Podman

1. Installer Podman

   ```bash
   sudo apt install -y podman
   ```

2. Créer les répertoires nécessaires

   ```bash
   sudo mkdir -p /etc/containers/systemd/wg-easy
   sudo mkdir -p /etc/containers/volumes/wg-easy
    ```

3. Création du fichier service pour wg-easy

    ```bash
    sudo cat <<EOF > /etc/containers/systemd/wg-easy/wg-easy.container

    [Container]
    ContainerName=wg-easy
    Image=ghcr.io/wg-easy/wg-easy:15
    AutoUpdate=registry

    Volume=/etc/containers/volumes/wg-easy:/etc/wireguard:Z
    Network=wg-easy.network
    PublishPort=51820:51820/udp
    PublishPort=51821:51821/tcp

    # this is used to allow access over HTTP
    # remove this when using a reverse proxy
    Environment=INSECURE=true

    AddCapability=NET_ADMIN
    AddCapability=SYS_MODULE
    AddCapability=NET_RAW
    Sysctl=net.ipv4.ip_forward=1
    Sysctl=net.ipv4.conf.all.src_valid_mark=1
    Sysctl=net.ipv6.conf.all.disable_ipv6=0
    Sysctl=net.ipv6.conf.all.forwarding=1
    Sysctl=net.ipv6.conf.default.forwarding=1

    [Install]

    # this is used to start the container on boot
    WantedBy=default.target
    EOF
    ```

4. Création du fichier réseau pour wg-easy

    ```bash
    cat <<EOF > /etc/containers/systemd/wg-easy/wg-easy.network
    [Network]
    NetworkName=wg-easy
    IPv6=true
    EOF
    ```

5. Chargement des modules WireGuard et nft_masq

    ```bash
    sudo modprobe wireguard && sudo modprobe nft_masq
    ```

6. Création du fichier de chargement des modules au démarrage

    ```bash
    sudo cat <<EOF > /etc/modules-load.d/wg-easy.conf
    wireguard
    nft_masq
    EOF
    ```

7. Activer et démarrer le service wg-easy

    ```bash
    sudo systemctl daemon-reload
    sudo systemctl start wg-easy
    ```

## Accéder à l'interface web de wg-easy

- Ouvrez votre navigateur web et accédez à `http://<IP_DE_VOTRE_VPS>:51821`

- Pensez à configurer votre pare-feu pour autoriser le trafic sur les ports 51820 (UDP) et 51821 (TCP)
