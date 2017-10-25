#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_msan"}
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Msan
