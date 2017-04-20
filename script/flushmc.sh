#!/bin/bash

# 找到本地所有 memcached，清缓存（flush_all）

LIST=(`pgrep memcached`)

for PID in "${LIST[@]}"; do
	{
		SEARCH=(`sudo netstat -nltp | grep $PID | grep -Po '([^\ ]*):\d+'`)
		if [ -z "$SEARCH" ]; then
			continue
		fi
		for ADDR in "${SEARCH[@]}"; do

			HOST=${ADDR%:*}
			PORT=${ADDR##*:}

			MD_RETURN=`echo 'flush_all' | nc $HOST $PORT`
			RESULT='OK'
			if [ ${MD_RETURN//[[:space:]]/} != $RESULT ]; then
				RESULT='FAIL'
			fi

			printf '%4s pid = %-6s addr = %-10s port = %s\n' $RESULT $PID',' $HOST',' $PORT

		done
	} &
done

wait
