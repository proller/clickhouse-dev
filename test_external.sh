#!/usr/bin/env bash

#pwd=`pwd`
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#cd ../dbms/tests/
#./clickhouse-test -c "../../clang_msan/dbms/src/Server/clickhouse-client --config ${pwd}/config-client.xml "
#./clickhouse-test --no-shard -c "../../build/dbms/src/Server/clickhouse-client --config ${pwd}/config-client.xml "
cd ${pwd}/../dbms/tests/external_dictionaries/
./generate_and_test.py --port=`${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-extract-from-config --config-file=${pwd}/config.xml --key=tcp_port` --no_break --no_mongo  --no_mysql $*
