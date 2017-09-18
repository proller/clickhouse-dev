#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo $CURDIR
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Debug
