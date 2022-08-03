#!/bin/sh

sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
sudo apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager -y
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo apt install docker-ce docker-ce-cli containerd.io -y 
sudo usermod -aG docker $USER && newgrp docker docker version && sudo systemctl status docker docker run hello-world
sudo apt install flatpak -y && sudo apt-get install gnome-software gnome-packagekit -y && sudo apt install libsquashfuse0 squashfuse fuse -y
sudo apt install plasma-discover terraform -y
sudo apt install git python3 python3-pip python3-virtualenv python3-dev build-essential libssl-dev libffi-dev wget -y
sudo apt install -ssh net-tools python3-venv software-properties-common default-jdk code vim -y 
sudo apt install default-jdk -y && sudo apt update && sudo apt install android-studio -y
sudo apt-get install google-cloud-sdk -y
sudo apt-get install google-cloud-sdk-app-engine-python \
google-cloud-sdk-app-engine-python-extras \
google-cloud-sdk-app-engine-java \
google-cloud-sdk-app-engine-go \
google-cloud-sdk-bigtable-emulator \
google-cloud-sdk-cbt \
google-cloud-sdk-cloud-build-local \
google-cloud-sdk-datalab \
google-cloud-sdk-datastore-emulator \
google-cloud-sdk-firestore-emulator \
google-cloud-sdk-pubsub-emulator \
kubectl -y
