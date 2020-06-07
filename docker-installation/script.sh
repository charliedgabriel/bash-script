#!/bin/bash

if [ "$(whoami)" != 'root' ]; then
    sudo apt-get update
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update -y
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
    sudo usermod -aG docker $USER
    while true; do
        read -p "Host/Instance need to reboot! Please answer yes or no: " yn
        case $yn in
            [Yy]* ) sudo reboot; break;;
            [Nn]* ) exit;;
            * ) 
        esac
    done
else
        echo "Prefered run on general users."
fi