#!/usr/bin/env bash
set -e

export BUILD_TYPE=_tsan
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$pwd/cmake${BUILD_TYPE}.sh
$pwd/make.sh
$pwd/server.sh
