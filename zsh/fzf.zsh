#!/bin/bash

if [ -e $HOME/.fzf.zsh ]; then
	source $HOME/.fzf.zsh
	bindkey '^p' fzf-file-widget
fi
