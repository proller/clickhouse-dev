#!/usr/bin/env bash

set -x
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

for type in _debug _clang _clang_asan _clang_tsan _asan _tsan _release; do
    echo "Run $type"
    export BUILD_TYPE=$type
    #bash $CUR_DIR/build.sh
    bash $CUR_DIR/build.sh | tee log-build$type.log && bash $CUR_DIR/ctest.sh | tee log-ctest$type.log || true
    #bash $CUR_DIR/make.sh all
    echo "Done $type"
done

exit



export BUILD_TYPE=_clang
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

export BUILD_TYPE=clang_asan
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

export BUILD_TYPE=_asan
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh
