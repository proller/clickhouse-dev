#!/usr/bin/env bash -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=_debug
$CURDIR/build.sh
gdb -ex run --args ../build${BUILD_TYPE}/dbms/src/Server/clickhouse --config=config.xml
