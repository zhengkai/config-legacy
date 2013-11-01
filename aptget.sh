#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/aptget"`);

sudo update-alternatives --config editor

sudo apt-get update
sudo apt-get install -y ${list[@]}

sudo sh -c 'echo "Asia/Shanghai" > /etc/timezone'
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

sudo pear install doc.php.net/pman
