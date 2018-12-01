#!/bin/bash

if [ ! -w '/usr/local/lib/node_modules' ]; then
	>&2 echo can not write /usr/local/lib/node_modules
	exit 1
fi

if [ ! -w '/usr/local/bin' ]; then
	>&2 echo can not write /usr/local/bin
	exit 1
fi

npm install -g npm@latest

npm install -g @angular/cli
