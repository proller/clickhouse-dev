#!/bin/sh

pwd=`pwd`

#type=_asan

mkdir -p ../build$type && cd ../build$type
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#$pwd/cmake.sh
$pwd/cmake$type.sh

#cmake .. -DCMAKE_CXX_COMPILER=`which clang-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#cmake .. -DCMAKE_CXX_COMPILER=`which clang-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

# -DENABLE_MYSQL=0

#time nice -n20 make -j$(nproc || sysctl -n hw.ncpu || echo 2) -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
time env CCACHE_PREFIX=distcc nice -n20 make -j -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
