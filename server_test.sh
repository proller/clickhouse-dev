#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}

export ARGS="-V -j $(nproc || sysctl -n hw.ncpu || echo 2)"
. ${CURDIR}/build.sh
. $CURDIR/make.sh test
