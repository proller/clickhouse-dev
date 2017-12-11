#!/usr/bin/env bash

#pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
pwd=$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)

for i in {1..90000}; do
 echo $i
 sleep 0.1
 ${pwd}/../build${BUILD_TYPE}/dbms/src/Server/clickhouse-client --config ${pwd}/clickhouse-client.xml  --query='KILL QUERY WHERE 1'
done
