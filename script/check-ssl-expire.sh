#!/bin/bash

DOMAIN="${1:-soulogic.com}"
PORT="${2:-443}"

TIME=`echo | timeout 10 openssl s_client -showcerts -servername "$DOMAIN" -connect "${DOMAIN}:${PORT}" 2>/dev/null | openssl x509 -noout -dates | grep notAfter | cut -d '=' -f 2`

if [ -z "$TIME" ]; then
	exit 1
fi

if [ -z "$3" ]; then
	echo domain: $DOMAIN
	echo "  port: $PORT"
	echo expire: `TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M:%S' -d "$TIME"`
else
	date '+%s' -d "$TIME"
fi
