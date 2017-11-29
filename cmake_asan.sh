#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_asan"}
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Asan -DENABLE_TCMALLOC=0 -DENABLE_UNWIND=0 -DUNBUNDLED=0
