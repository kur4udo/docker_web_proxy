#!/bin/bash

sudo apt update
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

cd /home/ubuntu
git clone https://github.com/kur4udo/docker_web_proxy.git

cd /home/ubuntu/docker_web_proxy/docker
sudo docker-compose up -d