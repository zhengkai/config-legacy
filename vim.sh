#!/bin/bash

VIM_DIR="$HOME/.vim"

if [ -e "$VIM_DIR" ]; then
	echo "$VIM_DIR ready been installed"
	exit
fi

git clone git@github.com:zhengkai/vimrc.git "$VIM_DIR"

mkdir "$HOME/.tmp/vim-undo"
cd "$VIM_DIR"
git submodule update --init --recursive
#vim +PlugInstall +qall
