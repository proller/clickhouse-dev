#!/usr/bin/env bash
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

valgrind --log-file=${LOG_DIR}log$BUILD_TYPE.valgrind.log $CUR_DIR/../build${BUILD_TYPE}/dbms/programs/clickhouse-server --config=$CUR_DIR/config.xml
# --tool=memcheck, cachegrind, callgrind, helgrind, drd, massif, lackey, none, exp-sgcheck, exp-bbv, exp-dhat,