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
	echo 'dictionary "'$2'" no exists' 1>&2
	exit 1
fi
if [ ! -d "$2" ]; then
	echo 'not a dictionary "'$2'"' 1>&2
	exit 1
fi

echo -e "\tset acl\n\n\tgroup: "$1"\n\t  dir: "$2"\n"

cd $2
pwd
echo

echo setfacl -d -R -m g:$1:rwx $2
setfacl -d -R -m g:$1:rwx $2
echo

echo setfacl'    '-R -m g:$1:rwX $2
setfacl -R -m g:$1:rwX $2
echo
