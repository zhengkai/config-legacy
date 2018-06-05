#!/bin/bash
cd $(dirname `readlink -f $0`);
list=(`cat list-desktop`);

sudo apt-get update
sudo apt-get install -y ${list[@]}

if [ -e /usr/share/applications/tilda.desktop ]; then
	mkdir -p ~/.config/autostart
	cp /usr/share/applications/tilda.desktop ~/.config/autostart
fi

gsettings set org.gnome.desktop.interface enable-animations false
