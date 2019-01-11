#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_split"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CUR_DIR/cmake.sh -DSPLIT_SHARED_LIBRARIES=0 -DCLICKHOUSE_SPLIT_BINARY=1 $*
. $CUR_DIR/make.sh clickhouse-bundle
. $CUR_DIR/server.sh
