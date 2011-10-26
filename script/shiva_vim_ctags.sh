#!/bin/sh
scandir="/www/shiva"

ctags --languages=-JavaScript \
	--extra=+q \
	--sort \
	--fields=+l \
	--tag-relative=yes \
	--language-force=PHP \
	-f ~/tags \
	-R $scandir

