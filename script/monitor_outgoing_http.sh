#!/bin/bash

IF='eth0'

sudo tcpflow -p -c -i $IF port 80 2>/dev/null \
	| grep --line-buffered '^Host: ' \
	| stdbuf -o0 cut -b '7-' \
	| cronolog '/log/tcp/%Y.%m/%d'
