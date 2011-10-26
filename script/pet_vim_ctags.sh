#!/bin/sh
scandir="/www/pet"

ctags --languages=-JavaScript \
	--extra=+q \
	--sort=yes \
	--fields=+l \
	--tag-relative=yes \
	--language-force=PHP \
	-f ~/tags \
	-R $scandir

