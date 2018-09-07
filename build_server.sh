#!/usr/bin/env bash
set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export MAKE_TARGET="clickhouse-server clickhouse-client clickhouse-extract-from-config"
. ${CUR_DIR}/build.sh
. ${CUR_DIR}/server.sh $*
