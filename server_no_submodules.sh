#!/usr/bin/env bash

set -e

export BUILD_TYPE=${BUILD_TYPE="_no_submodules"}
CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

cd ${CUR_DIR}/..
BRANCH=`git rev-parse --abbrev-ref HEAD`
ROOT_DIR=${CUR_DIR}/../build${BUILD_TYPE}
mkdir -p $ROOT_DIR
cd $ROOT_DIR
wget -O ch.zip https://github.com/proller/ClickHouse/archive/${BRANCH}.zip
unzip -ou ch.zip
. ${ROOT_DIR}/ClickHouse-${BRANCH}/utils/build/build_debian_unbundled_split.sh

#cd ${ROOT_DIR}/ClickHouse-${BRANCH}
#mkdir -p build
#cd build
#cmake .. && ninja
