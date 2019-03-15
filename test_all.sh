#!/usr/bin/env bash

set -x
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}
mkdir -p $LOG_DIR

for type in _debug _clang _clang_asan _clang_tsan _clang_ubsan _asan _tsan _release _split; do
    echo "Run $type"
    export BUILD_TYPE=$type
    #bash $CUR_DIR/build.sh | tee ${LOG_DIR}log$type.build.log
    bash $CUR_DIR/build.sh | tee ${LOG_DIR}log$type.build.log && bash $CUR_DIR/ctest.sh | tee ${LOG_DIR}log$type.ctest.log || true
    #bash $CUR_DIR/make.sh all
    echo "Done $type"
done
