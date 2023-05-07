#!/bin/bash

sudo apt-get update

sudo apt-get install -y apache2

sudo apt-get update -y

sudo apt-get install -y openjdk-11-jdk

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/bin/java

sudo rm /etc/apt/sources.list.d/jenkins.list

echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9B7D32F2D50582E6

sudo apt-get update -y

sudo apt-get install -y jenkins

sudo apt-get update -y

sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

sudo apt-get install -y docker-ce docker-ce-cli containerd.io

sudo groupadd docker

sudo usermod -aG docker $USER

newgrp docker 

sudo chmod 666 /var/run/docker.sock
