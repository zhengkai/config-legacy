#!/bin/sh
/usr/bin/rsync --bwlimit=100 -avzC --timeout=600 --delete --delete-after --include='distributions/*.exe' rsync.php.net::phpweb /www/manual/php
