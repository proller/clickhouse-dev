#!/usr/bin/env bash

set -e
set -x 

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

env SANITIZER=address ${CUR_DIR}/../release
env BUILD_TYPE=debug ${CUR_DIR}/../release
${CUR_DIR}/../release
${CUR_DIR}/../utils/build/build_debian_unbundled.sh
${CUR_DIR}/../release --no-pbuilder
