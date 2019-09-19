#!/bin/bash
cd $(dirname `readlink -f $0`)

if [ ! -e ~/.ssh/authorized_keys ] && [ -f ~/.ssh/id_rsa.pub ]; then
	cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys
fi

sudo chown -R zhengkai:zhengkai /home/zhengkai

sudo cp ../file/sudoers_nopassword /etc/sudoers.d/nopassword

mkdir -p ~/.tmp/vim-undo
mkdir -p ~/.tmp/vim-swap
mkdir -p ~/.tmp/ssh-mux
mkdir -p ~/.backup
mkdir -p ~/.Trash
touch ~/.backup/.wget_cookie
touch ~/.backup/.curl_cookie

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq vim
sudo update-alternatives --set editor /usr/bin/vim.basic

sudo sh -c 'echo "Asia/Shanghai" > /etc/timezone'
sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

list=(`cat list-aptget`)
sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq ${list[@]}

sudo apt-get remove -y fonts-droid

sudo adduser zhengkai www-data

touch ~/.viminfo
sudo chown -R zhengkai:zhengkai ~/

mkdir -p ~/script
if [ ! -e "$HOME/script/daily.sh" ]; then
	cp ../script/customize/daily.sh ~/script/
fi

./desktop.sh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-update-rc --no-fish --no-bash --64

../update/npm.sh
../update/pip.sh

cd $(dirname `readlink -f $0`)
