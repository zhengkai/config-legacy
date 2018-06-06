#!/bin/sh
export DEBIAN_FRONTEND=noninteractive
sudo /usr/bin/apt-get update
sudo /usr/bin/apt-get -y -q dist-upgrade
sudo /usr/bin/apt-get -y -q autoremove
sudo /usr/bin/apt-get -y -q autoclean

sudo rm -f /etc/ssl/certs/CNNIC_ROOT.pem
sudo rm -f /usr/share/ca-certificates/mozilla/CNNIC_ROOT.crt
