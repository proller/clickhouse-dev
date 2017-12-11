#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}

valgrind --log-file=server.valgrind.$BUILD_TYPE.log $CURDIR/../build${BUILD_TYPE}/dbms/src/Server/clickhouse-server --config=$CURDIR/config.xml
# --tool=memcheck, cachegrind, callgrind, helgrind, drd, massif, lackey, none, exp-sgcheck, exp-bbv, exp-dhat,