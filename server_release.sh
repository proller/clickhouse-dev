#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE:="_release"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$pwd/cmake.sh -DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6`
$pwd/make.sh VERBOSE=1
$pwd/server.sh
