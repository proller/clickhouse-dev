#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}
export BUILD_TYPE=${BUILD_TYPE="_debug"}

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
fi

extract="${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-extract-from-config --config-file=${CUR_DIR}/config.xml"

env TIME="\t%e,\t%M" /usr/bin/time $TIMEV httperf --num-conns=1000 --rate=1000 --port=`$extract --key=http_port` --uri=/?query=SELECT%201
env ASAN_OPTIONS=detect_odr_violation=0 TIME="\t%e,\t%M" /usr/bin/time $TIMEV ${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-performance-test --port `$extract --key=tcp_port` --skip-tags=long --input-files ${CUR_DIR}/../dbms/tests/performance/*.xml $* > ${LOG_DIR}/performance${BUILD_TYPE}.`hostname`.`date '+%Y%M%''d%H%M%''S'`.json
