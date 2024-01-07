sudo apt update 
sudo apt-get remove --purge 'thunderbird*' 'libreoffice*'
sudo apt-get autoremove
sudo apt-get clean
sudo apt update

sudo apt install wget curl ssh -y
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget https://dl.google.com/dl/android/studio/ide-zips/2022.2.1.20/android-studio-2022.2.1.20-linux.tar.gz

sudo apt install -y software-properties-common qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager ca-certificates gnupg lsb-release \
wget nano vim gnome-console gnome-text-editor git gh python3 python3-pip python3-virtualenv python3-dev build-essential libssl-dev libffi-dev net-tools python3-venv software-properties-common \
gpg apt-transport-https vlc filezilla python3-distutils openjdk-18-jdk ./google-chrome-stable*

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install code -y
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y

tar -zxvf android-studio-2022.2.1.20-linux.tar.gz
sudo mv android-studio /opt/
sudo ln -sf /opt/android-studio/bin/studio.sh /bin/android-studio
rm -f android-studio-2*

sudo vim /usr/share/applications/android-studio.desktop
[Desktop Entry]
Version=1.0
Type=Application
Name=Android Studio
Comment=Android Studio
Exec=bash -i "/opt/android-studio/bin/studio.sh" %f
Icon=/opt/android-studio/bin/studio.png
Categories=Development;IDE;
Terminal=false
StartupNotify=true
StartupWMClass=jetbrains-android-studio
Name[en_GB]=android-studio.desktop

sudo snap install pycharm-educational --classic
