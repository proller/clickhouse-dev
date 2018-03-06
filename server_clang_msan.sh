#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_msan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $pwd/cmake_clang.sh -DCMAKE_BUILD_TYPE=Msan -DSAN_DEBUG=1 -DENABLE_TCMALLOC=0 -DENABLE_UNWIND=0 -DUNBUNDLED=0 \
 $*
. $pwd/make.sh
. $pwd/server.sh | llvm-symbolizer-7 | c++filt
