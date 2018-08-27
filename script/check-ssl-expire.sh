#!/bin/bash

DOMAIN="${1:-soulogic.com}"
PORT="${2:-443}"
DATE="${3}"

TIME=`echo | openssl s_client -showcerts -servername "$DOMAIN" -connect "${DOMAIN}:443" 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d '=' -f 2`

if [ -z "$TIME" ]; then
	exit 1
fi

if [ -n "$DATE" ]; then
	echo domain: $DOMAIN
	echo "  port: $PORT"
	echo expire: `TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M:%S' -d "$TIME"`
else
	date '+%s' -d "$TIME"
fi
