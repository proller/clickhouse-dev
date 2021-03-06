#!/usr/bin/env bash

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CUR_DIR/../build$BUILD_TYPE"}
export ROOT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)

if [[ "$OSTYPE" == "darwin"* ]]; then
    TIMEV=""
elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
    TIMEV=""
else
    TIMEV="-v"
    MAKEL="-l $((`nproc || sysctl -n hw.ncpu || echo 2`*2))"
fi

if [[ $(echo `distcc --show-hosts | wc -l` || echo 0) == "0" ]]; then
    export -n CCACHE_PREFIX
    MAKEJ=${MAKEJ=-j $(nproc || sysctl -n hw.ncpu || echo 2)}
#elif [[ `uname -i || echo ""` == "aarch64" ]]; then
#    MAKEJ=${MAKEJ=-j 1}
else
    MAKEJ=${MAKEJ=-j $(distcc -j || echo 0)}
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    IONICE="ionice -c Idle"
fi

set -e

cd $BUILD_DIR

MAKE_TARGET=${MAKE_TARGET:=$*}
MAKE_TARGET=${MAKE_TARGET:=clickhouse-bundle}

# env -u CCACHE_PREFIX \
env CCACHE_BASEDIR=$ROOT_DIR TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 $IONICE cmake --build . -- $MAKEJ $MAKEL $MAKE_TARGET


#old:
#if [ -f rules.ninja ]; then
#    MAKE=ninja
#else
#    MAKE=make
#fi
#TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 $IONICE $MAKE $MAKEJ $MAKEL $MAKE_TARGET
