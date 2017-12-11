#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE:="_release"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$pwd/cmake.sh -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 -DCMAKE_BUILD_TYPE=RELWITHDEBINFO
$pwd/make.sh VERBOSE=1
$pwd/server.sh
