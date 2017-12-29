#!/usr/bin/env bash
set -e

export BUILD_TYPE=${BUILD_TYPE:="_clang"}
CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
$CURDIR/build_server.sh
