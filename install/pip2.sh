#!/bin/bash

### Check if root
if[ "$EUID"-ne0 ]
	thenecho"Please run as root!"
	exit
fi

mkdir -p /opt/pip/
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o /opt/pip/get-pip.py
python /opt/pip/get-pip.py
echo "Install pip2 modules with: python -m pip install <module>"
