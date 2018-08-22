#!/bin/bash

HOSTNAME=`hostname`

if [ -z "$1" ]; then
	>&2 echo 'no url'
	exit 1
fi

if [ "$HOSTNAME" == 'Freya' ]; then

	cd /tmp
	youtube-dl -f bestvideo+bestaudio \
		--merge-output-format mkv \
		-o "/tmp/youtube/%(title)s-%(id)s.%(ext)s" \
		--exec "/home/zhengkai/conf/script/youtube-mv.sh" \
		"$@"
	exit
fi

if [ ! -d '/youtube' ]; then
	>&2 echo 'no dir /youtube'
	exit 1
fi

cd /youtube
youtube-dl -f bestvideo+bestaudio \
	--merge-output-format mkv \
	-o "/youtube/%(title)s-%(id)s.%(ext)s" \
	"$@"
exit
