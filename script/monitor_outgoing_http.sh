#!/bin/bash

HOST="`hostname`"

case $HOST in
	'Monk')
		IF='enp2s0f0'
		;;
	'Tesla')
		IF='enp2s0'
		;;
	*)
		IF='eth0'
		;;
esac

echo $HOST $IF

sudo tcpflow -p -c -i $IF port 80 2>/dev/null \
	| grep --line-buffered '^Host: ' \
	| stdbuf -o0 cut -b '7-' \
	| cronolog '/log/tcp/%Y.%m/%d'
