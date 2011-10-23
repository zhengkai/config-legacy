#!/bin/sh
scandir="/www/shiva"
ctags --languages=-JavaScript -a --extra=+q --tag-relative=yes -f ~/tags -R $scandir

