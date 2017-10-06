#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# --config `pwd`/clickhouse-client.xml
time ${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --performance-test --port `${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse extract-from-config --config-file=${pwd}/config.xml --key=tcp_port` --r ${pwd}/../dbms/tests/performance $* > performance.`hostname`.`date '+%Y%M%''d%H%M%''S'`.json
