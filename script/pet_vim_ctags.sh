#!/bin/sh
scandir="/www/pet"

ctags --languages=php \
	--sort=yes \
	--extra=+q \
	--fields=+l \
	--tag-relative=yes \
	-f ~/tags \
	-R $scandir

