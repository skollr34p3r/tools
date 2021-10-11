#!/bin/bash

#Sudo Check
if [ `id -u` -eq 0 ]
then
        echo "Running as root user :)"
else
        echo "Please run with sudo!"
        exit 1
fi

mkdir -p /opt/pip/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o /opt/pip/get-pip.py
sudo python /opt/pip/get-pip.py
echo "Install pip2 modules with: python -m pip install <module>"
