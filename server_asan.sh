#!/usr/bin/env bash
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}
export BUILD_TYPE=${BUILD_TYPE:="_asan"}

. $CUR_DIR/cmake${BUILD_TYPE}.sh
. $CUR_DIR/make.sh
export ASAN_OPTIONS=detect_odr_violation=0
. $CUR_DIR/server.sh -- --logger.console=0 2>&1 | asan_symbolize-6.0 | c++filt | tee ${LOG_DIR}log$BUILD_TYPE.asan.log
cat log$BUILD_TYPE.server.stdout.log | asan_symbolize-6.0 | c++filt > ${LOG_DIR}log$BUILD_TYPE.server.stdout.filt.log
