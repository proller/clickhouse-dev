#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CUR_DIR/../build$BUILD_TYPE"}
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

env BUILD_TYPE="_clang_release" TEST_OPT="-j `nproc`" $CUR_DIR/ctest.sh
