#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# --config `pwd`/clickhouse-client.xml

extract="${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse extract-from-config --config-file=${pwd}/config.xml"

httperf --num-conns=1000 --rate=1000 --port=`$extract --key=http_port` --uri=/?query=SELECT%201
time ${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --performance-test --port `$extract --key=tcp_port` --r ${pwd}/../dbms/tests/performance $* > performance.`hostname`.`date '+%Y%M%''d%H%M%''S'`.json
