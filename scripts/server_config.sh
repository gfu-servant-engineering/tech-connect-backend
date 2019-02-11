#!/bin/bash

echo
echo "uninstalling old docker versions..."
echo
sudo apt-get remove docker docker-engine docker.io containerd runc

echo
echo "setting up docker repository..."
echo
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo
echo "installing docker CE..."
echo
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

echo
echo "cloning strapi-docker repository..."
echo
git clone https://github.com/strapi/strapi-docker && cd strapi-docker
sudo apt-get install docker-compose

echo
echo "strapi-docker has been cloned!"
echo
echo "      ***********************************************************************"
echo "to run the initial strapi project run: sudo docker-compose up"
echo "to view remote host on local host run: ssh -L <port>:localhost:<port> <user>@<IP>"
echo "      ***********************************************************************"
echo
