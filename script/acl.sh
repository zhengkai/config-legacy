#!/bin/bash

echo

if [ "$(id -u)" != "0" ]; then
	echo "This script must be run as root" 1>&2
	exit 1
fi

if [ -z "$1" ]; then
	echo 'no group name' 1>&2
	exit 1
fi

GROUP="$(getent group $1)"
if [ -z "$GROUP" ]; then
	echo 'no group "'$1'"' 1>&2
	exit 1
fi

if [ -z "$2" ]; then
	echo 'no dictionary' 1>&2
	exit 1
fi

if [ ! -e "$2" ]; then
	echo 'dictionary "$2" no exists' 1>&2
	exit 1
fi
if [ ! -d "$2" ]; then
	echo 'not a dictionary "'$2'"' 1>&2
	exit 1
fi

echo -e "\tset acl\n\n\tgroup: "$1"\n\t  dir: "$2"\n"

cd $2

pwd

echo setfacl -d -R -m group:$1:rwx $2
setfacl -d -R -m group:$1:rwx $2

#setfacl -Rm u:$1:rw,d:u:$1:rwx $2

find . \( -type f -exec setfacl -m group:$1:rw  '{}' ';' \) \
	-o \( -type d -exec setfacl -m group:$1:rwx '{}' ';' \)

#find . \( -type f -exec setfacl -m g:$1:rw '{}' ';' \) \
#	-o \( -type d -exec setfacl -m g:$1:rwx '{}' ';' \)

# file
#find . -type f -exec setfacl -m group:$1:rw  {} \;

# dir
#find . -type d -exec setfacl -m group:$1:rwx {} \;
