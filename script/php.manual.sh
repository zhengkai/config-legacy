#!/bin/sh
/usr/bin/rsync --bwlimit=100 -avzC --timeout=600 --delete --delete-after \
 --exclude='.git' \
 --include='manual/en/' --include='manual/en/**' --exclude='manual/**' \
 --exclude='distributions' \
 rsync.php.net::phpweb /www/manual/php

