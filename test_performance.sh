#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE="_debug"}

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
fi

extract="${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-extract-from-config --config-file=${CURDIR}/config.xml"

#$extract --key=zookeeper
#exit
TIME="\t%e,\t%M" /usr/bin/time $TIMEV httperf --num-conns=1000 --rate=1000 --port=`$extract --key=http_port` --uri=/?query=SELECT%201
TIME="\t%e,\t%M" /usr/bin/time $TIMEV ${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-performance-test --port `$extract --key=tcp_port` --r ${CURDIR}/../dbms/tests/performance --skip-tags=long $* > ${CURDIR}/performance${BUILD_TYPE}.`hostname`.`date '+%Y%M%''d%H%M%''S'`.json
