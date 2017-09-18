#!/usr/bin/env bash

#pwd=`pwd`
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

#export BUILD_TYPE=_asan

mkdir -p ../build$BUILD_TYPE && cd ../build$BUILD_TYPE
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

$pwd/cmake$BUILD_TYPE.sh

#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#-DENABLE_VECTORCLASS=1
#-DGCC_INSTALL_PREFIX=6.2.0
#-DGCC_INSTALL_PREFIX=/usr/lib/gcc/x86_64-linux-gnu/6.2.0
# -DENABLE_MYSQL=0

$pwd/make.sh
#time nice -n20 make -j$(nproc || sysctl -n hw.ncpu || echo 2) -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
#TIME="\t%e,\t%M" /usr/bin/time -v  nice -n20 make -j -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
