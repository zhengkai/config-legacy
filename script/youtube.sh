#!/bin/bash

listfile='/www/youtube/url.txt'

(
    flock -x -n 200 || exit 1

	for (( ; ; ));  do

		sleep 1

		if [ ! -f $listfile ]; then
			continue
		fi

		tmpfile=`tempfile`
		mv $listfile $tmpfile

		echo start
		cat $tmpfile

		nohup /usr/local/bin/youtube-dl \
			--cache-dir "/home/zhengkai/.cache/youtube-dl" \
			--format bestvideo+bestaudio \
			--output "/home/zhengkai/sync/youtube/%(title)s-%(id)s.%(ext)s" \
			--no-part \
			--batch-file $tmpfile \
			2>&1 &

		sleep 5

		rm -f $tmpfile

	done

) 200>/tmp/youtube_dl.lock
