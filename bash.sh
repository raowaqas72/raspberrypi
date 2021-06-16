#!/bin/bash
echo "This is the first boot"
sudo netplan generate
sudo netplan apply
sudo chmod +x /etc/rc.local
sudo systemctl enable rc-local
sudo systemctl start rc-local.service	

sudo apt install python3-pip
sudo apt-get update

sudo apt-get -y upgrade

sudo apt-get -y install git

curl https://packages.microsoft.com/config/ubuntu/18.04/multiarch/prod.list > ./microsoft-prod.list
sudo cp ./microsoft-prod.list /etc/apt/sources.list.d/
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo cp ./microsoft.gpg /etc/apt/trusted.gpg.d/
sudo apt-get update

sudo apt-get -y install moby-engine
sudo apt-get -y install zfsutils-linux 
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo apt-get -y install aziot-edge=1.2* aziot-identity-service=1.2*
   	