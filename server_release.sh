#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_release"}
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CURDIR/cmake_release.sh $*
# -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DENABLE_RDKAFKA=0
. $CURDIR/make.sh
# VERBOSE=1
. $CURDIR/server.sh
