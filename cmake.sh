#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

compiler=`bash -c "compgen -c gcc | grep 'gcc-[[:digit:]]' | sort --version-sort --reverse | head -n1"`
compilerpp=`bash -c "compgen -c g++ | grep 'g++-[[:digit:]]' | sort --version-sort --reverse | head -n1"`

mkdir -p $CURDIR/../build$BUILD_TYPE && cd $CURDIR/../build$BUILD_TYPE

cmake .. -DCMAKE_CXX_COMPILER=`which ${compilerpp}` -DCMAKE_C_COMPILER=`which ${compiler}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*

#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
