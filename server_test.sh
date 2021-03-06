#!/usr/bin/env bash

# env TEST_OPT="-- 99999|505" bash -x ./server_test.sh

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}

# magic args for ctest
export ARGS="-V -j $(nproc || sysctl -n hw.ncpu || echo 2)"

. ${CURDIR}/build.sh
. $CURDIR/make.sh test
