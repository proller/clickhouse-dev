#!/usr/bin/env bash
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}
export BUILD_TYPE=${BUILD_TYPE:="_asan"}

. $CUR_DIR/cmake${BUILD_TYPE}.sh
. $CUR_DIR/make.sh
export ASAN_OPTIONS=detect_odr_violation=0
#export ASAN_SYMBOLIZER_PATH=`which asan_symbolize-7`
export ASAN_SYMBOLIZER_PATH=`which llvm-symbolizer`
. $CUR_DIR/server.sh -- --logger.console=0 2>&1 | tee ${LOG_DIR}log$BUILD_TYPE.asan.log
#. $CUR_DIR/server.sh -- --logger.console=0 2>&1 | asan_symbolize-6.0 | c++filt | tee ${LOG_DIR}log$BUILD_TYPE.asan.log
#cat log$BUILD_TYPE.server.stdout.log | asan_symbolize-6.0 | c++filt > ${LOG_DIR}log$BUILD_TYPE.server.stdout.filt.log
