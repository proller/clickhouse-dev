#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_tsan"}
. $CURDIR/cmake.sh -DSANITIZE=thread -DUNBUNDLED=0 $*
# -DCMAKE_C_COMPILER=`which clang-devel` -DCMAKE_CXX_COMPILER=`which clang++-devel`
