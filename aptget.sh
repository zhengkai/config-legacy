#!/bin/bash
dir=$(dirname `readlink -f $0`);
list=(`cat "$dir/aptget"`);

sudo apt-get update
sudo apt-get install -y ${list[@]}

