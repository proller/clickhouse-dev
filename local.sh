#!/usr/bin/env bash

export BUILD_TYPE=${BUILD_TYPE:="_debug"}

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export MAKE_TARGET=clickhouse-local
bash $CUR_DIR/make.sh
${CUR_DIR}/../build${BUILD_TYPE}/dbms/programs/clickhouse-local $*
