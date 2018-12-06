#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_release"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CUR_DIR/cmake_release.sh $*
# -DUSE_STATIC_LIBRARIES=1 -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=0 -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DENABLE_RDKAFKA=0
. $CUR_DIR/make.sh clickhouse-bundle
bash $CUR_DIR/server.sh
