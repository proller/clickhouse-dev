#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_clang_asan"}
. $CURDIR/cmake_clang.sh -DSANITIZE=thread -DUNBUNDLED=0 $*
