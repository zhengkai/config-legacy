#!/bin/sh
scandir="/www/shiva"
ctags --languages=-JavaScript --tag-relative=yes -f ~/tags -R $scandir

