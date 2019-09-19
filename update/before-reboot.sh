#!/bin/bash

CHECK="/var/run/reboot-required"
if [ ! -e "$CHECK" ]; then
	exit
fi

NODE="${HOME}/build/node/run.sh"
if [ -e "$NODE" ]; then
	"$NODE"
fi

SS="${HOME}/build/shadowsocks/run.sh"
if [ -e "$SS" ]; then
	"$SS"
fi
