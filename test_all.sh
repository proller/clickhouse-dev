#!/usr/bin/env bash

set -x
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

for type in _debug _clang _clang_asan _clang_tsan _asan _tsan _release; do
    echo "Run $type"
    export BUILD_TYPE=$type
    export LOG_DIR=$CUR_DIR/log/
    #bash $CUR_DIR/build.sh | tee log-build$type.log
    bash $CUR_DIR/build.sh | tee log$type.build.log && bash $CUR_DIR/ctest.sh | tee log$type.ctest.log || true
    #bash $CUR_DIR/make.sh all
    echo "Done $type"
done
