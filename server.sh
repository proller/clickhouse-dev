#!/usr/bin/env bash

set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
#. ${CUR_DIR}/build.sh

VERSION=`${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-client --version-clean`
SERVER_CONFIG_OPT="--compiler_headers=$BUILD_DIR/dbms/programs/clang/headers/$VERSION/ --compiler_headers=$BUILD_DIR/dbms/programs/clang/headers/$VERSION/ --compiler_headers_root=$BUILD_DIR/dbms/programs/clang/headers/$VERSION/"

#env PATH=$PATH:${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/ \
${CUR_DIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-server --config=$CUR_DIR/config.xml $* -- $SERVER_CONFIG_OPT 2>&1 | tee $CUR_DIR/log$BUILD_TYPE.server.stdout.log
