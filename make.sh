#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CURDIR/../build$BUILD_TYPE"}

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
    MAKEL="-j $(nproc || sysctl -n hw.ncpu || echo 2)"
fi

if [[ $(`distcc --show-hosts | wc -l` || echo 0) == "0" ]]; then
    export -n CCACHE_PREFIX
    MAKEJ="-j $(nproc || sysctl -n hw.ncpu || echo 2)"
else
    MAKEJ="-j $(distcc -j || echo 0)"
fi

set -e

cd $BUILD_DIR
# env -u CCACHE_PREFIX \
TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 make $MAKEJ $MAKEL clickhouse-bundle $*
