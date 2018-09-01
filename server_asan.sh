#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_asan"}
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
. $pwd/cmake${BUILD_TYPE}.sh
. $pwd/make.sh
export ASAN_OPTIONS=detect_odr_violation=0
. $pwd/server.sh -- --logger.console=0 2>&1 | asan_symbolize-6.0 | c++filt | tee log$BUILD_TYPE.asan.log
cat log$BUILD_TYPE.server.stdout.log | asan_symbolize-6.0 | c++filt > log$BUILD_TYPE.server.stdout.filt.log
