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

BIN='/usr/local/bin/npm'
if [ ! -e "$BIN" ]; then
	>&2 echo no $BIN
	exit 1
fi

for item in "${list[@]}"
do
	npm install -g "${item}"
done
