#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/aptget"`);

sudo sh -c 'echo "PRC" > /etc/timezone'
sudo cp /usr/share/zoneinfo/PRC /etc/localtime

sudo apt-get update
sudo apt-get install -y ${list[@]}
