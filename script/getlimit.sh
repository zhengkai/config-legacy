#!/bin/bash

if [ -z "$1" ]; then
	>&2 echo 'empty input'
	exit 1
fi

PS=`pgrep "$1"`
if [ -z "$PS" ]; then
	>&2 echo 'found nothing'
	exit 1
fi

echo 'pid = '$PS

for PID in "${PS[@]}"; do
	echo
	echo $PID':'

	if [ "$2" == 'full' ]; then
		cat /proc/$PID/limits
	else
		cat /proc/$PID/limits | grep 'Max open files'
	fi
	echo
done
