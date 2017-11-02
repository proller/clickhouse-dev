#!/usr/bin/env bash

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export BUILD_TYPE=${BUILD_TYPE:="_clang"} 

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    MINUS=""
else
    MINUS="-"
fi

compiler=`which clang-devel`
if [ -z ${compiler} ]; then
    compiler=`bash -c "compgen -c clang | grep 'clang$MINUS[[:digit:]]' | sort --version-sort --reverse | head -n1"`
fi
compilerpp=`which clang++-devel`
if [ -z ${compilerpp} ]; then
    compilerpp=`bash -c "compgen -c clang++ | grep 'clang++$MINUS[[:digit:]]' | sort --version-sort --reverse | head -n1"`
fi

mkdir -p $CURDIR/../build$BUILD_TYPE && cd $CURDIR/../build$BUILD_TYPE

cmake .. -DCMAKE_CXX_COMPILER=`which ${compilerpp}` -DCMAKE_C_COMPILER=`which ${compiler}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*


#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
