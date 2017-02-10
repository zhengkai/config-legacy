#!/bin/bash

IF='eth0'

if [ `hostname` == "Tesla" ]; then
	IF='enp2s0'
fi

sudo tcpflow -p -c -i $IF port 80 2>/dev/null \
	| grep --line-buffered '^Host: ' \
	| stdbuf -o0 cut -b '7-' \
	| cronolog '/log/tcp/%Y.%m/%d'
