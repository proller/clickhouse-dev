#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_release"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $CUR_DIR/cmake_release.sh $*
. $CUR_DIR/make.sh clickhouse-bundle

#strip ${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse ||:
# sudo setcap cap_net_admin=+ep ${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse ||:

bash $CUR_DIR/server.sh
