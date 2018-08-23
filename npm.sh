#!/bin/bash

if [ ! -e '/usr/local/bin/npm' ]; then
	exit
fi

cd $(dirname `readlink -f $0`)

list=(`cat ./npm`)

for pack in "${list[@]}"; do
	sudo npm install -g $pack
done
