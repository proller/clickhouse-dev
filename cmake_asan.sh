#!/bin/sh

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Asan
