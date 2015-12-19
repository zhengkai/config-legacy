#!/bin/bash
listfile='/tmp/youtube-url.txt'
(
    flock -x -n 200 || exit 1

	for (( ; ; ));  do

		sleep 1

		if [ ! -f $listfile ]; then
			continue
		fi

		tmpfile=`tempfile`
		sudo chown zhengkai:zhengkai $listfile
		mv $listfile $tmpfile

		echo start
		cat $tmpfile

		nohup /usr/bin/youtube-dl \
			--cache-dir "/home/zhengkai/.cache/youtube-dl" \
			--format bestvideo+bestaudio \
			--merge-output-format mkv \
			--output "/sync/youtube/%(title)s-%(id)s.%(ext)s" \
			--no-part \
			--batch-file $tmpfile \
			2>&1 &

		sleep 5

		rm -f $tmpfile

	done

) 200>/tmp/youtube-dl.lock
