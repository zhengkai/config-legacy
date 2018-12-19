#!/bin/bash

list=(

	npm
	@angular/cli
	eslint
	tslint
	wscat

)

# ----------------------------------------------------------------------------

BIN='/usr/local/bin/npm'
if [ ! -e "$BIN" ]; then
	>&2 echo no $BIN
	exit 1
fi

for item in "${list[@]}"
do
	sudo npm install -g "${item}"
done
