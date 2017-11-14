#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${pwd}/../dbms/tests/

# env CLICKHOUSE_URL=http://localhost:18123/

#./clickhouse-test --no-shard --no-zookeeper -c "${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --client --ssl --port 9440 --config ${pwd}/clickhouse-client.xml" $*
./clickhouse-test --testname --no-shard --no-zookeeper -c "${pwd}/../build$BUILD_TYPE/dbms/src/Server/clickhouse --client  --config ${pwd}/clickhouse-client.xml" $*
