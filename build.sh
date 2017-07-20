#!/bin/sh

mkdir -p ../build
cd ../build
cmake .. -DCMAKE_C_COMPILER_LAUNCHER=`which ccache` -DCMAKE_CXX_COMPILER_LAUNCHER=`which ccache` -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug \

# -DENABLE_MYSQL=0

#cmake .. -DCMAKE_C_COMPILER_LAUNCHER=`which ccache` -DCMAKE_CXX_COMPILER_LAUNCHER=`which ccache` -DCMAKE_CXX_COMPILER=`which clang++` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#time nice -n20 make -j$(nproc || sysctl -n hw.ncpu || echo 2) -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
time env CCACHE_PREFIX=distcc nice -n20 make -j -l$(nproc || sysctl -n hw.ncpu || echo 2) clickhouse $*
