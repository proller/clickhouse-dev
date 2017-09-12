#!/bin/bash -e

export BUILD_TYPE=_tsan
pwd=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

mkdir -p $pwd/../build$BUILD_TYPE && cd $pwd/../build$BUILD_TYPE
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DCMAKE_BUILD_TYPE=Tsan -DUSE_LIBCXX=1 -DNO_WERROR=1 -DCCACHE_FOUND=0
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++` -DCMAKE_C_COMPILER=`which clang` -DCMAKE_BUILD_TYPE=Tsan -DUSE_LIBCXX=1 -DNO_WERROR=1 -DCCACHE_FOUND=0
CXX=clang++ CC=clang cmake .. -DCMAKE_BUILD_TYPE=Tsan -DUSE_LIBCXX=1 -DNO_WERROR=1 -DCCACHE_FOUND=0
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DCMAKE_BUILD_TYPE=Tsan -DNO_WERROR=1

#$pwd/cmake.sh -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DCMAKE_BUILD_TYPE=Tsan -DUSE_LIBCXX=1 -DNO_WERROR=1
$pwd/make.sh
$pwd/server.sh
