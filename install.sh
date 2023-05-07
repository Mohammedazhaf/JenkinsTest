#!/bin/bash

# Mise à jour des paquets
sudo apt update

# Installation d'Apache2
sudo apt install apache2 -y

# Installation de Java 11 JDK
sudo apt install openjdk-11-jdk -y

# Ajout de la clé GPG de Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

# Ajout du dépôt Jenkins à la liste des sources APT
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

# Mise à jour des paquets pour prendre en compte les nouveaux dépôts
sudo apt update

# Installation de Jenkins
sudo apt install jenkins -y

# Installation des paquets nécessaires pour Docker
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Ajout de la clé GPG de Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Ajout du dépôt Docker à la liste des sources APT
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Mise à jour des paquets pour prendre en compte les nouveaux dépôts
sudo apt update

# Installation de Docker et de ses dépendances
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Ajout de l'utilisateur courant au groupe docker
sudo usermod -aG docker $USER

# Redémarrage du service Jenkins
sudo systemctl restart jenkins
