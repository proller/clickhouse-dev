#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
cd ${CURDIR}/../dbms/tests/

export BUILD_TYPE=${BUILD_TYPE:="_debug"}

# env CLICKHOUSE_URL=http://localhost:18123/

./clickhouse-test --testname --no-shard --no-zookeeper -c "${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse-client --config ${CURDIR}/clickhouse-client.xml" $*

# --no-shard --no-zookeeper --ssl --port 9440
