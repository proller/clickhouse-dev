#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
cd ${CURDIR}/../dbms/tests/

# env CLICKHOUSE_URL=http://localhost:18123/

export CLICKHOUSE_CONFIG=${CLICKHOUSE_CONFIG:=$CURDIR/config.xml}

./clickhouse-test --testname --binary ${CURDIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --configclient ${CURDIR}/clickhouse-client.xml $*

# --no-shard --no-zookeeper --ssl --port 9440
