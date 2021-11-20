# Les journaux



## Connaitre la taille prise par les journaux

```bash
journalctl --disk-usage
```



## Nettoyer les journaux

```shell
# Pour ne garder que 24h
sudo journalctl --vacuum-time=1d > /dev/null 2>&1
```

