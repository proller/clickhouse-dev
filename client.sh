#!/usr/bin/env bash

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
${pwd}/../build${BUILD_TYPE}/dbms/src/Server/clickhouse-client --config ${pwd}/clickhouse-client.xml $*
