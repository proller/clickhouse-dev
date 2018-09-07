#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_asan"}

# CMAKE_FLAGS+=" -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 -DUSE_INTERNAL_LLVM_LIBRARY=0 "

. $CUR_DIR/cmake.sh -DSANITIZE=address -DUNBUNDLED=0 $CMAKE_FLAGS $*
