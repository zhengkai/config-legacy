#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/aptget"`);

sudo update-alternatives --config editor

sudo apt-get update
sudo apt-get install -y ${list[@]}

sudo pear install doc.php.net/pman

