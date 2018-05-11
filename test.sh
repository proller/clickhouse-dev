#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
cd ${CUR_DIR}/../dbms/tests/

# env CLICKHOUSE_URL=http://localhost:18123/

#export CLICKHOUSE_CONFIG=${CLICKHOUSE_CONFIG:=$CUR_DIR/config.xml}
export CLICKHOUSE_TMP=${CUR_DIR}/tmp

./clickhouse-test --testname --binary ${CUR_DIR}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --configclient ${CUR_DIR}/clickhouse-client.xml --configserver ${CUR_DIR}/config.xml $*

# --no-shard --no-zookeeper --ssl --port 9440
