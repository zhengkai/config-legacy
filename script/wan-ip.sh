#!/bin/bash

function checkip() {
	echo
	echo "check $1"
	local IP=`curl -s --max-time 10 "$1"`
	echo
	echo "  ip: $IP"
	if [[ -n "$IP" ]]; then
		echo
		geoiplookup "$IP"
	fi
}

checkip "https://soulogic.com/ip"
checkip "https://ifconfig.io/ip"
