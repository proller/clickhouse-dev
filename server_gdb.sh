#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export ASAN_OPTIONS=${ASAN_OPTIONS:="abort_on_error=1"}

#export BUILD_TYPE=${BUILD_TYPE:=_debug}
#$CURDIR/build.sh

gdb -ex run --args $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse server --config=config.xml

# -ex 'set pagination off' -ex 'set logging on' -ex "set logging file gdb.log" -ex 'continue' -ex 'thread apply all backtrace' -ex 'detach' -ex 'quit'
