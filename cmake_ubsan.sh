#!/bin/bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$CURDIR/cmake.sh -DCMAKE_BUILD_TYPE=Ubsan