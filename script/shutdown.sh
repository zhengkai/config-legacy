#!/bin/bash

if [ -z "$DISPLAY" ]; then
	>&2 echo only run in X11
	exit 1
fi

cd $(dirname `readlink -f $0`)

echo apt update ...
./update-ubuntu.sh

../update/before-reboot.sh

echo shutdown
sudo shutdown -P 0
