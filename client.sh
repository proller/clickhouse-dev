#!/usr/bin/env bash

export BUILD_TYPE=${BUILD_TYPE:="_debug"}

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
${CUR_DIR}/../build${BUILD_TYPE}/dbms/src/Server/clickhouse-client --config ${CUR_DIR}/clickhouse-client.xml --stacktrace $*

# cat ../dbms/tests/queries/0_stateless/00700_extract.sql | ./client.sh -n --ignore-error
