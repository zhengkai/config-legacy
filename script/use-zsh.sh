#!/bin/bash

ZSH='/bin/zsh'

echo
echo $HOSTNAME
echo
echo sudo chsh -s $ZSH $USER

if [ ! -x $ZSH ]; then
	echo not $ZSH
	exit
fi

if [[ "$HOSTNAME" =~ ^(Tesla|Freya|Lydia|Monk)$ ]]; then

	sudo chsh -s $ZSH $USER

	echo changed
fi
