#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=_tsan
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Tsan -DENABLE_LIBTCMALLOC=0 -DENABLE_UNWIND=0
