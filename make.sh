#!/usr/bin/env bash
set -e

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
TIMEV=""
else
TIMEV="-v"
fi

pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
mkdir -p ${pwd}/../build$BUILD_TYPE && cd ${pwd}/../build$BUILD_TYPE
# env -u CCACHE_PREFIX

TIME="\t%e,\t%M" /usr/bin/time $TIMEV nice -n20 make -j$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
