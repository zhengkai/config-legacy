#!/bin/bash

HASH=`git rev-parse --short HEAD 2>/dev/null || :`
if [ -z "$HASH" ]; then
	exit 1
fi
ST=`git status -s -u`
if [ -n "$ST" ]; then
	HASH="${HASH}-dirty"
fi

BRANCH=`git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1/"`
if [[ "$BRANCH" == *"("* ]]; then
	BRANCH=''
else
	BRANCH="${BRANCH}:"
fi

echo "${BRANCH}${HASH}"
