#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_asan"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

. $CUR_DIR/cmake_clang_asan.sh $CMAKE_FLAGS $*
. $CUR_DIR/make.sh
export ASAN_OPTIONS=detect_odr_violation=0
. $CUR_DIR/server.sh -- --logger.console=0 2>&1 | tee ${LOG_DIR}log$BUILD_TYPE.asan.log
cat ${LOG_DIR}log$BUILD_TYPE.asan.log | asan_symbolize-6.0 | c++filt > ${LOG_DIR}log$BUILD_TYPE.asan.filt.log


#. $CUR_DIR/server.sh | llvm-symbolizer-6.0 | c++filt
#. $CUR_DIR/server.sh -- --logger.console=0 2>&1 | asan_symbolize-6.0 | c++filt | tee ${LOG_DIR}log$BUILD_TYPE.asan.log
#cat ${LOG_DIR}log$BUILD_TYPE.server.stdout.log | asan_symbolize-6.0 | c++filt > ${LOG_DIR}log$BUILD_TYPE.server.stdout.filt.log
#. $CUR_DIR/server_gdb.sh | llvm-symbolizer-devel | c++filt
#  | llvm-symbolizer-devel | c++filt
