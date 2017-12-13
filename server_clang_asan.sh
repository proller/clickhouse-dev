#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang_asan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$pwd/cmake_clang.sh -DCMAKE_BUILD_TYPE=Asan -DENABLE_TCMALLOC=0 -DENABLE_UNWIND=0 -DUNBUNDLED=0
$pwd/make.sh
env ASAN_OPTIONS=detect_odr_violation=0 $pwd/server.sh

#  | llvm-symbolizer-devel | c++filt
