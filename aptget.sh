#!/bin/bash
dir=$(dirname `readlink -f $0`)
list=(`cat "$dir/aptget"`)

sudo apt-get update

sudo apt-get install -y vim
#sudo update-alternatives --config editor
sudo update-alternatives --set editor /usr/bin/vim.basic

sudo apt-get install -y ${list[@]}

sudo apt-get remove -y fonts-droid

sudo sh -c 'echo "Asia/Shanghai" > /etc/timezone'
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

mkdir -p ~/.tmp
mkdir -p ~/.backup

bashcomp_dir='/etc/bash_completion.d'
if [ -d $bashcomp_dir ]; then
	sudo cp "$dir/file/pman" $bashcomp_dir
fi

sudo easy_install3 -U pip

HOME=/root sudo pip install --upgrade httpie
HOME=/root sudo pip install --upgrade qrcode
