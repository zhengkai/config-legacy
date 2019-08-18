#!/bin/bash

list=(

	npm
	node-sass
	@angular/cli
	@angular/core
	eslint
	tslint
	wscat
	typescript

)

# ----------------------------------------------------------------------------

export NG_CLI_ANALYTICS=ci

sudo chown zhengkai:zhengkai -R ~/.npm

DIR=`readlink -f "$0"` && DIR=`dirname "$DIR"` && cd "$DIR" || exit 1

BIN='/usr/local/bin/npm'
if [ ! -e "$BIN" ]; then
	>&2 echo no $BIN
	exit 1
fi

for item in "${list[@]}"
do
	npm install -g "${item}"
	hash -r
done
