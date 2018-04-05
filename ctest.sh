#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CURDIR/../build$BUILD_TYPE"}

if [[ "$OSTYPE" == "darwin"* ]]; then
    TIMEV=""
elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
fi

if [[ $(echo `distcc --show-hosts | wc -l` || echo 0) == "0" ]]; then
    export -n CCACHE_PREFIX
    MAKEJ="-j $(nproc || sysctl -n hw.ncpu || echo 2)"
elif [[ `uname -i || echo ""` == "aarch64" ]]; then
    MAKEJ="-j 1"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    IONICE="ionice -c Idle"
else
    MAKEJ="-j $(distcc -j || echo 0)"
fi

set -e

cd $BUILD_DIR

TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 $IONICE ctest -V $MAKEJ
