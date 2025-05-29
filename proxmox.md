# Proxmox VE

## Gestion des erreurs
### Welcome to grub
Si vous voyez l'erreur "Welcome to grub" lors du démarrage de Proxmox, cela peut indiquer un problème avec le chargeur de démarrage GRUB. Voici quelques étapes pour résoudre ce problème :
1. **Insérer une clef USB avec l'ISO de Proxmox VE**
2. **Démarrer à partir de la clef USB**
   - Assurez-vous que votre BIOS/UEFI est configuré pour démarrer à partir de la clef USB.
3. **Choisir l'option "Rescue a Proxmox VE installation"**
4. **Une fois dans l'environnement de secours, exécuter les commandes suivantes**

    ```bash
    umount /boot/efi
    proxmox-boot-tool init /dev/nvme0n1p2
    ```
