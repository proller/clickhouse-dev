#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_msan"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

. $CUR_DIR/cmake_clang.sh -DSANITIZE=memory -DUNBUNDLED=0 $*
. $CUR_DIR/make.sh
. $CUR_DIR/server.sh | llvm-symbolizer-7 | c++filt | tee ${LOG_DIR}log$BUILD_TYPE.msan.log
