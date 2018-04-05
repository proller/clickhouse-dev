#!/usr/bin/env bash

set -x
#set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE="_debug"}
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

export BUILD_TYPE=${BUILD_TYPE="_clang"}
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

export BUILD_TYPE=${BUILD_TYPE="clang_asan"}
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

export BUILD_TYPE=${BUILD_TYPE="_asan"}
#sh $CUR_DIR/build.sh all
. $CUR_DIR/make.sh all
. $CUR_DIR/ctest.sh

