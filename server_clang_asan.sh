#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_asan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $pwd/cmake_clang.sh -DSANITIZE=address -DUNBUNDLED=0 \
 $*
# -DNO_WERROR=0 -DENABLE_RDKAFKA=0
. $pwd/make.sh
export  ASAN_OPTIONS=detect_odr_violation=0
. $pwd/server.sh

#  | llvm-symbolizer-devel | c++filt
# -DENABLE_TCMALLOC=0 -DENABLE_UNWIND=0