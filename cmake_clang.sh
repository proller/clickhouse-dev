#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export BUILD_TYPE=${BUILD_TYPE:="_clang"} 

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    MINUS=""
else
    MINUS="-"
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    SORT_VERSION=""
else
    SORT_VERSION="--version-sort"
fi

set +e

CC=${CC:=`which clang-devel`}
CC=${CC:=`bash -c "compgen -c clang | grep 'clang$MINUS[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
CXX=${CXX:=`which clang++-devel`}
CXX=${CXX:=`bash -c "compgen -c clang++ | grep 'clang++$MINUS[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
CC=${CC:=clang}
CXX=${CXX:=clang++}

set -e


mkdir -p $CURDIR/../build$BUILD_TYPE && cd $CURDIR/../build$BUILD_TYPE

. $CURDIR/cmake.sh -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DCMAKE_ASM_COMPILER=`which ${CC}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*


#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
