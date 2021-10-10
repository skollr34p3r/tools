#!/bin/bash

#Sudo Check
if [ `id -u` -eq 0 ]
then
        echo "Running as root user :)"
else
        echo "Please run with sudo!"
        exit 1
fi


sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install seclists curl enum4linux feroxbuster impacket-scripts nbtscan nikto nmap onesixtyone oscanner redis-tools smbclient smbmap snmp sslscan sipvicious tnscmd10g whatweb wkhtmltopdf -y

cd /opt/
sudo python3 -m pip install git+https://github.com/Tib3rius/AutoRecon.git

echo "INSTALL COMPLETED!"
