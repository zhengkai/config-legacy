#!/bin/sh
sudo /usr/bin/apt-get update
sudo /usr/bin/apt-get -y dist-upgrade
sudo /usr/bin/apt-get -y autoremove
sudo /usr/bin/apt-get -y autoclean

