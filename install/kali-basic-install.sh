#!/bin/bash

### Check if root
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

### Update and enable download over https
sudo apt update
echo "### Enabling Secure File Download ###"
sudo apt install apt-transport-https -y

### Upgrade prompt
read -p "Do you want to upgrade? y/n: " prompt
if [[ "$prompt" =~ ^([yY][eE][sS]|[yY])$  ]]
	then
    echo "#### Upgrading ####"
    sudo apt update && sudo apt upgrade -y
else
    echo "### Skipping Upgrade ###"
    
fi

### Disable sleep mode
sudo systemctl mask sleep.target suspend.target hibernate.target hybridsleep-target

### Remove default keys
sudo mkdir /etc/ssh/default_kali_keys
sudo mv /etc/ssh/ssh_host_* /etc/ssh/default_kali_keys/
sudo dpkg-reconfigure openssh-server

### More wordlists and directiry busting tools
sudo apt install seclists ffuf -y

## Brute force login tools
sudo apt install brutespray -y

## AD Testing Tools
sudo apt install ldapscripts bloodhound veil -y

### Install exploit compiling packages
sudo apt install mingw-w64 -y
sudo apt install g++-multilib -y

## Remove dos NSE Scripts
sudo rm /usr/share/nmap/scripts/broadcast-avahi-dos.nse
sudo rm /usr/share/nmap/scripts/smb-vuln-regsvc-dos.nse

## Additional Random Tools
sudo apt install eyewitness curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y
sudo apt install gedit nfs-common python3-pip libimage-exiftool-perl -y
#terminator dradis rdesktop brasero xdotool telnet libncurses5-dev traceroute build-essential chromium-bsu vlc mpv cifs-utils scrot filezilla libreoffice golang tree dnsutils coolkey t50 krb5-user

# PRIVESC SCRIPTS
cd /opt
sudo git clone https://github.com/bitsadmin/wesng.git
cd /opt/wesng
sudo python3 setup.py install


#### Unknown additional tools from notes ###
#sudo apt install python-xlrd -y
#sudo apt install xsltproc
#update-java-alternatives --jre -s java-1.7.0-openjdk-amd64
#sudo apt install erlang-base-hipe
#git clone https://github.com/trustedsec/ptf
#git clone https://github.com/sameera-madushan/Print-My-Shell

#remove unused packages
sudo apt autoclean
sudo apt -y autoremove

#COMPLETE#
echo "INSTALL COMPLETED!"
