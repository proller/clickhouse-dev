#!/bin/bash

#mkdir -p ../build && cd ../build
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*

#cmake .. -DCMAKE_CXX_COMPILER=`which clang-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug

#cmake .. -DCMAKE_CXX_COMPILER=`which clang-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
