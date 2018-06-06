#!/usr/bin/env bash

set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
#. ${CURDIR}/build.sh

#env PATH=$PATH:${CURDIR}/../build$BUILD_TYPE/dbms/programs/ \
 ${CURDIR}/../build$BUILD_TYPE/dbms/programs/clickhouse-server --config=$CURDIR/config.xml $* 2>&1 | tee server.$BUILD_TYPE.log
