#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
#export BUILD_TYPE=_debug
$CURDIR/build.sh
gdb -ex run --args $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse server --config=config.xml
