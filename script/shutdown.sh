#!/bin/bash

if [ -z "$DISPLAY" ]; then
	>&2 echo only run in X11
	exit 1
fi

cd $(dirname `readlink -f $0`)

echo apt update ...
nohup ./update-ubuntu.sh 2>/dev/null

echo shutdown
sudo shutdown -P 0 2>/dev/null
