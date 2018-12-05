#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_unbundled"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CUR_DIR/cmake.sh -DUNBUNDLED=1 $*
. $CUR_DIR/make.sh clickhouse-bundle
. $CUR_DIR/server.sh
