#!/bin/bash

# The Duke Of Puteaux
# Rejoins moi sur Youtube: https://www.youtube.com/channel/UCsJ-FHnCEvtV4m3-nTdR5QQ

# USAGE

# SOURCES

# VARIABLES

echo "---------------"
echo "Debut du script"
echo "---------------"
# MAJ  Github
echo -e "\nMAJ Repo wikiLinux"
git pull
git add .
git commit -m "Update"
git push origin main

echo -e "\n-------------"
echo "Fin du script"
echo "-------------"