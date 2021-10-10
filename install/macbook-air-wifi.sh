#!/bin/bash

### Check if root
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi


sudo apt update

sudo apt-get install linux-headers-$(uname -rlsed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms -y

sudo modprobe -r b44 b43 b43legacy ssb brcmsmac

sudo modprobe wl
