#!/bin/bash

HOSTNAME=`hostname`

if [ "$HOSTNAME" == 'Freya' ] || [ "$HOSTNAME" == 'Tesla' ]; then
	youtube-dl -f bestvideo+bestaudio \
		--merge-output-format mkv \
		-o "/sync/youtube/%(title)s-%(id)s.%(ext)s" \
		"$@"
	exit
fi

if [ "$HOSTNAME" == 'Monk' ]; then
	youtube-dl --proxy 192.168.1.212:8118 \
		-f bestvideo+bestaudio \
		--merge-output-format mkv \
		-o "/share/youtube/%(title)s-%(id)s.%(ext)s" \
		"$@"
	exit
fi

echo 'Neither Monk nor Freya'
