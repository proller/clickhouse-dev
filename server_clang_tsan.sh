#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_tsan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

. $pwd/cmake_clang.sh -DCMAKE_BUILD_TYPE=Tsan -DSAN_DEBUG=1 -DENABLE_TCMALLOC=0 -DENABLE_UNWIND=0 -DUNBUNDLED=0 \
 $*

# -DNO_WERROR=1 -DENABLE_RDKAFKA=0 -DCCACHE_FOUND=0


. $pwd/make.sh
export TSAN_OPTIONS=second_deadlock_stack=1
. $pwd/server.sh
