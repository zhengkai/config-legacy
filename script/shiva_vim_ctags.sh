#!/bin/sh
scandir="/www/shiva"

ctags --languages=-JavaScript \
	--extra=+q \
	--sort \
	--fields=+l \
	--tag-relative=yes \
	--language-force=PHP \
	--regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \
	-f ~/tags \
	-R $scandir

