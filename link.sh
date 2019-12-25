#!/bin/bash -ex

DIR=`readlink -f "$0"` && DIR=`dirname "$DIR"` && cd "$DIR" || exit 1

ls dotfiles | while read -r FILE; do

	SRC="$DIR/dotfiles/$FILE"
	TARGET="$HOME/.$FILE"

	if [ ! -f "$SRC" ]; then
		continue
	fi

	if [ -h "$TARGET" ]; then
		rm "$TARGET"
	fi

	ln -s "$SRC" "$TARGET"
done

ls dotfiles/copy | while read -r FILE; do

	SRC="$DIR/dotfiles/copy/$FILE"
	TARGET="$HOME/.$FILE"

	if [ ! -f "$SRC" ]; then
		continue
	fi

	cp "$SRC" "$TARGET"
done

ZSH="$HOME/.zshrc"
if [ -h "$ZSH" ]; then
	rm "$ZSH"
fi
ln -s "$DIR/zsh/index.zsh" "$ZSH"
