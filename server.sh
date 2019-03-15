#!/usr/bin/env bash

set -e

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}
mkdir -p $LOG_DIR
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
#. ${CUR_DIR}/build.sh

BUILD_DIR=${BUILD_DIR:=${CUR_DIR}/../build$BUILD_TYPE}
VERSION=`$BUILD_DIR/dbms/programs/clickhouse-client --version-clean`
SERVER_CONFIG_OPT="--compiler_executable_root=${INTERNAL_COMPILER_BIN_ROOT:=$BUILD_DIR/dbms/programs/} --compiler_headers=$BUILD_DIR/dbms/programs/clang/headers/$VERSION/ --compiler_headers_root=$BUILD_DIR/dbms/programs/clang/headers/$VERSION/"

[ ! -f server.crt ] && openssl req -subj "/CN=localhost" -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout server.key -out server.crt
[ ! -f dhparam.pem ] && openssl dhparam -out dhparam.pem 1024

#env PATH=$PATH:$BUILD_DIR/dbms/programs/ \
$BUILD_DIR/dbms/programs/clickhouse-server --config=$CUR_DIR/config.xml $* -- $SERVER_CONFIG_OPT 2>&1 | tee $LOG_DIR$BUILD_TYPE.server.console.log


# cat clickhouse-server.log  | grep -aF "<Debug> executeQuery: (from " | perl -lpe 's/^.*executeQuery: \(from \S+\) (.*)/$1;/' | head -n50 > last50.log
