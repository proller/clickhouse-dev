#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_minimal_unbundled"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

CMAKE_OS+=" -DUNBUNDLED=1 "
. $CUR_DIR/server_minimal.sh $*
