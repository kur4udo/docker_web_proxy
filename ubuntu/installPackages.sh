#!/bin/bash
#
# Description: Script sets up all needed components for docker and docker-compose on Ubuntu.
#

sudo apt update

sudo apt -y install awscli

sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt install -y docker-ce docker-ce-cli containerd.io
sudo apt install -y docker-compose
sudo docker swarm init
sudo usermod -aG docker $USER
