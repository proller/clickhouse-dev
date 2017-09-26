#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${pwd}/../dbms/tests/
./clickhouse-test --no-shard -c "${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --client --config ${pwd}/clickhouse-client.xml" $*
