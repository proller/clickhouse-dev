#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p ../build$BUILD_TYPE && cd ../build$BUILD_TYPE
$CURDIR/cmake$BUILD_TYPE.sh
$CURDIR/make.sh
