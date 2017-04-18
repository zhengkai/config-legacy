#!/bin/bash

cd $(dirname `readlink -f $0`)

list=(`cat ./npm`)

for pack in "${list[@]}"; do
	sudo npm install -g $pack
done
