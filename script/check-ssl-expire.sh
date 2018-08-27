#!/bin/bash

if [ -z "$1" ]; then
	>&2 echo 'empty domain'
	exit 1
fi

DOMAIN="$1"

TIME=`echo | openssl s_client -showcerts -servername "$DOMAIN" -connect "${DOMAIN}:443" 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d '=' -f 2`

if [ -z "$TIME" ]; then
	exit 1
fi

date -d "$TIME" +"%s"
