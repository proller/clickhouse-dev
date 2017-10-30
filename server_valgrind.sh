#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
valgrind $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse server --config=$pwd/config.xml
