sudo apt install wget curl ssh -y
sudo snap remove firefox
sudo apt-get remove --purge 'thunderbird*' 'libreoffice*'
sudo apt-get autoremove
sudo apt-get clean
#https://askubuntu.com/questions/1399383/how-to-install-firefox-as-a-traditional-deb-package-without-snap-in-ubuntu-22
sudo install -d -m 0755 /etc/apt/keyrings
wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
#The fingerprint should be 35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); print "\n"$0"\n"}'
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla
sudo apt-get update && sudo apt-get install firefox
sudo snap install pycharm-community --classic
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo add-apt-repository ppa:deadsnakes/ppa  #Python repo
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg  #Microsoft Visual Studio code repo
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt update

# for KVM
sudo apt install -y qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils virtinst libvirt-daemon virt-manager
# for development
sudo apt install -y software-properties-common  ca-certificates gnupg lsb-release code git gh \
wget nano vim gnome-console gnome-text-editor python3 python3-pip python3-virtualenv python3-dev build-essential libssl-dev libffi-dev net-tools python3-venv software-properties-common \
gpg apt-transport-https vlc filezilla python3-distutils openjdk-18-jdk ./google-chrome-stable*

sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y
#for VMware 
echo "sudo echo /etc/fstab >> vmhgfs-fuse /mnt/hgfs  fuse defaults,allow_other   0   0" | sudo tee -a /etc/fstab

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
