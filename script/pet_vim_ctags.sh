#!/bin/sh
scandir="/www/pet"
ctags --languages=-JavaScript --tag-relative=yes -f ~/tags -R $scandir

