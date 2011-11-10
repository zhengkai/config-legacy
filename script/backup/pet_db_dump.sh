#!/bin/sh
database="pet"
bakname="/backup/pet/pet_db_`date +%y%m%d_%H%M`.sql.gz"

dir=`dirname $bakname`

if [ ! -e $dir ];
then
	mkdir -p $dir
fi

if [ ! -d $dir ];
then
	exit 1
fi

file_count=`\ls $dir | wc -l`

if [ $file_count -gt 36 ];
then
	find $dir -mtime +36 -exec rm -f {} \;
fi

mysqldump --databases $database | gzip --best > $bakname

