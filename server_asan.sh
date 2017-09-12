#!/bin/bash -e

export BUILD_TYPE=_asan
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$pwd/cmake.sh -DCMAKE_BUILD_TYPE=Asan
$pwd/make.sh
$pwd/server.sh
