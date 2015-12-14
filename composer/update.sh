#!/bin/bash

cd $(dirname `readlink -f $0`)

COMPOSER='/usr/local/bin/composer'

if [ ! -x $COMPOSER ]; then
	curl -sS https://getcomposer.org/installer | sudo php -- --install-dir="$(dirname $COMPOSER)" --filename=composer
fi

sudo $COMPOSER self-update 2>&1

COMPOSER_DIR=$HOME'/.composer'

if [ ! -d $COMPOSER_DIR ]; then
	if [ -e $COMPOSER_DIR ]; then
		echo
		echo 'ERROR: '$COMPOSER_DIR' is not a dir'
		echo
		exit 1
	fi

	mkdir $COMPOSER_DIR
	ln -s $PWD'/composer.json' $COMPOSER_DIR

fi

COMPOSER_JSON=$COMPOSER_DIR'/composer.json'
if [ ! -e $COMPOSER_JSON ]; then
	ln -s $PWD'/composer.json' $COMPOSER_JSON
fi

PHPCS_RULESET=$COMPOSER_DIR'/vendor/squizlabs/php_codesniffer/CodeSniffer.conf'
if [ ! -e $PHPCS_RULESET ]; then
	ln -s $PWD'/CodeSniffer.conf' $PHPCS_RULESET
fi

$COMPOSER global update
