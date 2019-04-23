#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CUR_DIR/../build$BUILD_TYPE"}
LOG_DIR=${LOG_DIR=$CUR_DIR/log/}

if [[ "$OSTYPE" == "darwin"* ]]; then
    TIMEV=""
elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
fi

MAKEJ="-j $(nproc || sysctl -n hw.ncpu || echo 2)"

if [[ `uname -i || echo ""` == "aarch64" ]]; then
    MAKEJ="-j 1"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    IONICE="ionice -c Idle"
fi

[ -z "$NO_V" ] && V=-V

set -e

cd $BUILD_DIR

env ASAN_OPTIONS=detect_odr_violation=0 LOG_DIR=$LOG_DIR CLICKHOUSE_LOG=${LOG_DIR}log$BUILD_TYPE.server.log TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 $IONICE ctest $V $MAKEJ
