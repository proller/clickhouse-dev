#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CURDIR/../build$BUILD_TYPE"}

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
fi

cd $BUILD_DIR
# env -u CCACHE_PREFIX
TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 make -j$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse-bundle $*
