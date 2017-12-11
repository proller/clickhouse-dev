#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
#./clickhouse-test -c "../../clang_msan/dbms/src/Server/clickhouse-client --config ${CURDIR}/config-client.xml "
#./clickhouse-test --no-shard -c "../../build/dbms/src/Server/clickhouse-client --config ${CURDIR}/config-client.xml "

cd ${CURDIR}/../dbms/tests/external_dictionaries/
./generate_and_test.py --client="${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-client" --port=`${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-extract-from-config --config-file=${CURDIR}/config.xml --key=tcp_port` --no_break --no_mongo --no_mysql $*
