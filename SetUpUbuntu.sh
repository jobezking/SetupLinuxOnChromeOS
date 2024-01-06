sudo apt-get update && sudo apt-get upgrade -y 

sudo apt-get install -y software-properties-common qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager install ca-certificates curl gnupg lsb-release \
wget nano vim gnome-console gnome-text-editor git gh python3 python3-pip python3-virtualenv python3-dev build-essential libssl-dev libffi-dev wget ssh net-tools python3-venv software-properties-common \
gpg apt-transport-https vlc filezilla openjdk-18-jdk

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install vim code ./google-chrome-stable* -y
sudo apt update
