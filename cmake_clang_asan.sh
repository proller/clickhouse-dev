#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_clang_asan"}

# CMAKE_FLAGS+=" -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 "

. $CURDIR/cmake_clang.sh -DSANITIZE=address -DUNBUNDLED=0 $CMAKE_FLAGS $*
