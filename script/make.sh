#!/bin/bash

# 不断往上递归，看哪个目录有 Makefile 可以 make

DIR=`pwd`

while [ "$DIR" != '/' ]
do

	FILE="${DIR}/Makefile"

	if [ -e "$FILE" ]; then
		cd "$DIR"
		make "$@"
		break
	fi

	DIR=`dirname "$DIR"`
done
