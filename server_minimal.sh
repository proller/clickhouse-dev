#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_minimal"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CUR_DIR/cmake.sh -DENABLE_LIBRARIES=0 $*
. $CUR_DIR/make.sh clickhouse-bundle
. $CUR_DIR/server.sh
