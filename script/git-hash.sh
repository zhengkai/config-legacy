#!/bin/bash

HASH=`git rev-parse HEAD 2>/dev/null || :`
if [ -z "$HASH" ]; then
	exit 1
fi

HASH="${HASH:0:20}"

ST=`git status -s -u`
if [ -n "$ST" ]; then
	HASH="${HASH:0:16}-dirty"
fi

echo $HASH
