#!/bin/bash -ex

DIR=$(readlink -f "$0") && DIR=$(dirname "$DIR") && cd "$DIR" || exit 1

cd "${DIR}/dotfiles"
for FILE in *; do

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

cd "${DIR}/dotfiles/copy"
for FILE in *; do

	SRC="$DIR/dotfiles/copy/$FILE"
	TARGET="$HOME/.$FILE"

	if [ ! -f "$SRC" ]; then
		continue
	fi

	if [ -e "$TARGET" ]; then
		continue
	fi

	cp "$SRC" "$TARGET"
done

if [ -z "$DISPLAY" ]; then
	cp -R "${DIR}/dotfiles/moc" ~/.moc
fi

ZSH="$HOME/.zshrc"
if [ -h "$ZSH" ]; then
	rm "$ZSH"
fi
ln -s "$DIR/zsh/index.zsh" "$ZSH"
