#!/usr/bin/env bash
set -e

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

export BUILD_TYPE=${BUILD_TYPE:="_clang"} 

COMPILER_MINUS="-"
if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    COMPILER_MINUS=""
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    SORT_VERSION=""
else
    SORT_VERSION="--version-sort"
fi
if [[ `uname -i || echo ""` == "aarch64" ]]; then
    CMAKE_OS+=" -DARCH_NATIVE=0 " # clang: error: the clang compiler does not support '-march=native'
fi


set +e

if [[ `lsb_release -cs` == "trusty" ]] || [[ "$OSTYPE" == "FreeBSD"* ]]; then
    #CC=${CC:=`which clang-devel`}
    CC=${CC:=`bash -c "compgen -c clang | grep 'clang$COMPILER_MINUS[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
    #CXX=${CXX:=`which clang++-devel`}
    CXX=${CXX:=`bash -c "compgen -c clang++ | grep 'clang++$COMPILER_MINUS[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
fi

CC=${CC:=clang}
CXX=${CXX:=clang++}

#CC=clang-5.0
#CXX=clang++-5.0
#CC=clang-6.0
#CXX=clang++-6.0

#CMAKE_OS+=" -DINTERNAL_COMPILER_EXECUTABLE=clang++-6.0 -DINTERNAL_LINKER_EXECUTABLE=ld.lld-6.0 -DINTERNAL_COMPILER_BIN_ROOT=/usr/bin/ "

set -e

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    CMAKE_OS+=" -DUNBUNDLED=1 "
fi

mkdir -p $CURDIR/../build$BUILD_TYPE && cd $CURDIR/../build$BUILD_TYPE

. $CURDIR/cmake.sh -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DCMAKE_ASM_COMPILER=`which ${CC}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $CMAKE_OS $*


#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-4.0` -DCMAKE_C_COMPILER=`which clang-4.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-5.0` -DCMAKE_C_COMPILER=`which clang-5.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-6.0` -DCMAKE_C_COMPILER=`which clang-6.0` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which clang++-7` -DCMAKE_C_COMPILER=`which clang-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
