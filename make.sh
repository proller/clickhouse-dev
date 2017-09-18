#!/usr/bin/env bash -e

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
mkdir -p ${pwd}/../build$BUILD_TYPE && cd ${pwd}/../build$BUILD_TYPE
TIME="\t%e,\t%M" /usr/bin/time -v  nice -n20 make -j -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
