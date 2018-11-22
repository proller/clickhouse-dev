#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
#./clickhouse-test -c "../../clang_msan/dbms/programs/clickhouse-client --config ${CUR_DIR}/config-client.xml "
#./clickhouse-test --no-shard -c "../../build/dbms/programs/clickhouse-client --config ${CUR_DIR}/config-client.xml "

cd ${CUR_DIR}/../dbms/tests/external_dictionaries/
./generate_and_test.py --client="${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-client" --port=`${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-extract-from-config --config-file=${CUR_DIR}/config.xml --key=tcp_port` --no_break --no_mongo --no_mysql $*
