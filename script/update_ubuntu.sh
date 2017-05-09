#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
sudo /usr/bin/apt-get update
sudo /usr/bin/apt-get -y dist-upgrade
sudo /usr/bin/apt-get -y autoremove
sudo /usr/bin/apt-get -y autoclean

sudo rm -f /etc/ssl/certs/CNNIC_ROOT.pem
sudo rm -f /usr/share/ca-certificates/mozilla/CNNIC_ROOT.crt
