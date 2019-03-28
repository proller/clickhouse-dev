#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE="_release"}

if [[ "$OSTYPE" == "FreeBSD"* ]] || [[ "$OSTYPE" == "darwin"* ]]; then
    # fix for external rdkafka
    CMAKE_ADD+=" -DUSE_INTERNAL_LZ4_LIBRARY=0 "
fi

. $CURDIR/cmake${CMAKE_SCRIPT_POSTFIX}.sh -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 -DUSE_INTERNAL_JEMALLOC_LIBRARY=1 -DCMAKE_BUILD_TYPE=RELWITHDEBINFO $CMAKE_ADD \
 \
$*

# -DCMAKE_EXE_LINKER_FLAGS=-v \
# -DUSE_EMBEDDED_COMPILER=0 \
