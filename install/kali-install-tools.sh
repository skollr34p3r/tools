#!/bin/bash

if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

### Upgrade prompt ###
read -p "Do you want to upgrade? y/n: " prompt
if [[ "$prompt" =~ ^([yY][eE][sS]|[yY])$  ]]
	then
    echo "#### Upgrading ####"
    sudo apt update && sudo apt upgrade -y
else
    echo "### Updating Only ###"
    sudo apt update
fi

### More wordlists
sudo apt install seclists -y

## Unzip rockyou only if zipped file exists
#gunzip /usr/share/wordlists/rockyou.txt.gz

##add on for enum4linux for more functionality
sudo apt install ldapscripts -y

## Brute force tools
sudo apt install brutespray -y



#### Unknown additional tools from notes ###
#sudo apt install python-xlrd -y
#sudo apt install xsltproc
#update-java-alternatives --jre -s java-1.7.0-openjdk-amd64
#sudo apt install erlang-base-hipe
#git clone https://github.com/trustedsec/ptf
#git clone https://github.com/sameera-madushan/Print-My-Shell
