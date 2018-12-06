#!/usr/bin/env bash

set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
. $CURDIR/cmake$BUILD_TYPE.sh $*
. $CURDIR/make.sh
