#!/bin/sh
bakname="/backup/iconfans_db_`date +%y%m%d_%H%M`.sql.gz"

dir=`dirname $bakname`

find $dir -mtime +35 -exec rm -f {} \; 

/usr/bin/mysqldump --default-character-set=gbk --set-charset=TRUE --add-drop-database --add-drop-table --add-locks --hex-blob --quick --user=user --password=jtmu3fGvGJ15hL7 --databases iconfans_bbs | gzip --best > $bakname

