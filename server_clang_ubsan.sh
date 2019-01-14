#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_ubsan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

. $pwd/cmake_clang.sh -DSANITIZE=undefined -DUNBUNDLED=0 \
 $*

. $pwd/make.sh
. $pwd/server.sh
