#!/bin/bash

TARGET_DIR='/backup/'`hostname`

if [[ ! -d $TARGET_DIR || ! -w $TARGET_DIR ]]; then
	echo 'can not write dir '$TARGET_DIR
	exit 1
fi

SKIP_DB=('information_schema' 'performance_schema' 'mysql' 'sys')

for DB_NAME in `echo 'show databases' | mysql -N`; do

	for SKIP in ${SKIP_DB[@]}; do
		if [[ $SKIP == $DB_NAME ]]; then
			continue 2
		fi
	done

	echo
	echo $DB_NAME

	FILENAME="$TARGET_DIR/$DB_NAME/`date +%Y_%m`/${DB_NAME}_db_`date +%Y%m%d_%H%M`.sql.gz"
	echo $FILENAME

	DIRNAME=`dirname "$FILENAME"`
	echo $DIRNAME

	mkdir -p $DIRNAME 2>/dev/null || {
		echo
		echo 'ERROR: create dir '$DIRNAME' fail'
		continue
	}

	find `dirname "$DIRNAME"` -mtime +35 -exec rm -f {} \;

	mysqldump \
	 --default-character-set=utf8mb4 \
	 --set-charset=TRUE \
	 --add-drop-database \
	 --add-drop-table \
	 --add-locks \
	 --hex-blob \
	 --quick \
	 --databases "$DB_NAME" | gzip --best > $FILENAME

done

echo

exit

#
#
# dir=`dirname $bakname`
#
# find $dir -mtime +35 -exec rm -f {} \;
#
# /usr/bin/mysqldump \
#  --default-character-set=utf8 \
#  --set-charset=TRUE \
#  --add-drop-database \
#  --add-drop-table \
#  --add-locks \
#  --hex-blob \
#  --quick \
#  --databases iconfans_bbs | gzip --best > $bakname
