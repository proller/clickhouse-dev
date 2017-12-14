#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE:="_release"}
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$CURDIR/cmake_release.sh $*
$CURDIR/make.sh
$CURDIR/server.sh
