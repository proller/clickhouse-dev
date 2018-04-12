#!/usr/bin/env bash

set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export MAKE_TARGET=clickhouse-server
. ${CURDIR}/build.sh
. ${CURDIR}/server.sh $*
