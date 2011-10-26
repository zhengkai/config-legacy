#!/bin/sh
scandir="/www/pet"

ctags --languages=PHP \
	--extra=+q \
	--exclude=*.js \
	--exclude=*.jpg \
	--exclude=*.png \
	--sort=yes \
	--fields=+l \
	--tag-relative=yes \
	--language-force=PHP \
	-f ~/tags \
	-R $scandir

