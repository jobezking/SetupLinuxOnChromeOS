#!/bin/sh

## KVM ##
sudo apt-get install software-properties-common -y
sudo apt-get update && sudo apt-get upgrade -y 
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y

## Docker ##
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo docker run hello-world
sudo groupadd docker && sudo usermod -aG docker $USER && newgrp docker

##App Stores ##
sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
sudo apt-get update && sudo apt-get upgrade -y
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt-get install gnome-software gnome-packagekit -y
sudo apt install libsquashfuse0 squashfuse fuse -y
sudo apt install snapd -y
#Close terminal and reopen terminal 
sudo snap install snap-store
sudo apt install plasma-discover -y
sudo apt-get update && sudo apt-get dist-upgrade && sudo apt-get upgrade -y

### Install browsers ##
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/chrome.list
sudo apt-get update
sudo apt-get install google-chrome-stable firefox-esr -y

## Google Cloud Platform SDK Python3 Java VSCode Android Studio Terraform ##

sudo apt install git python3 python3-pip python3-virtualenv python3-dev build-essential libssl-dev libffi-dev wget ssh net-tools python3-venv software-properties-common default-jdk -y
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

#https://code.visualstudio.com/docs/setup/linux

sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install vim terraform code -y

type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

### Android Studio

sudo apt update && sudo apt install default-jdk -y
sudo flatpak install flathub com.google.AndroidStudio -y

## Google Cloud SDK

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

sudo apt-get install apt-transport-https ca-certificates gnupg curl -y

curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

sudo apt-get update && sudo apt-get install google-cloud-sdk -y

sudo apt-get install google-cloud-sdk-app-engine-python \
google-cloud-sdk-app-engine-python-extras \
google-cloud-sdk-app-engine-java \
google-cloud-sdk-app-engine-go  \
google-cloud-sdk-bigtable-emulator  \
google-cloud-sdk-cbt  \
google-cloud-sdk-cloud-build-local \
google-cloud-sdk-datalab \
google-cloud-sdk-datastore-emulator \
google-cloud-sdk-firestore-emulator \
google-cloud-sdk-pubsub-emulator  \
kubectl -y

gcloud init
