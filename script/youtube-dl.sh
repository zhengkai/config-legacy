#!/bin/bash

HOSTNAME=`hostname`

if [ -z "$1" ]; then
	>&2 echo 'no url'
	exit 1
fi

if [ "$HOSTNAME" == 'Freya' ]; then

	if [ ! -d '/monk/youtube' ]; then
		>&2 echo 'sshfs error'
		exit 1
	fi

	cd /tmp
	setsid youtube-dl -f bestvideo+bestaudio \
		--merge-output-format mkv \
		-o "/tmp/youtube/%(title)s-%(id)s.%(ext)s" \
		--exec "/home/zhengkai/conf/script/youtube-mv.sh" \
		"$@"
	exit
fi

if [ "$HOSTNAME" == 'Tesla' ]; then

	if [ ! -d '/youtube' ]; then
		>&2 echo 'no dir /youtube'
		exit 1
	fi

	cd /youtube
	setsid youtube-dl -f bestvideo+bestaudio \
		--merge-output-format mkv \
		-o "/youtube/%(title)s-%(id)s.%(ext)s" \
		"$@"
	exit
fi

if [ "$HOSTNAME" == 'Monk' ]; then
	setsid ssh freya /home/zhengkai/conf/script/youtube-dl.sh "$@"
	exit
fi

echo 'Neither Monk nor Freya'
