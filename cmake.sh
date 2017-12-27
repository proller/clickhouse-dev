#!/usr/bin/env bash

set -x

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CURDIR/../build$BUILD_TYPE"}
export CH_DIR=${CH_DIR:="$CURDIR/.."}

CC=${CC:=`bash -c "compgen -c gcc | grep 'gcc-[[:digit:]]' | sort --version-sort --reverse | head -n1"`}
CXX=${CXX:=`bash -c "compgen -c g++ | grep 'g++-[[:digit:]]' | sort --version-sort --reverse | head -n1"`}

mkdir -p $BUILD_DIR && cd $BUILD_DIR

rm $BUILD_DIR/CMakeCache.txt

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    CMAKE_OS=" -DCOMPILER_FLAGS='-DLZ4_DISABLE_DEPRECATE_WARNINGS=1' -DUNBUNDLED=1 "
else
    CMAKE_OS=" -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DCMAKE_ASM_COMPILER=`which ${CC}` "
fi

if [[ `uname -i ` == "aarch64" ]]; then
    CMAKE_OS+=""
else
    CMAKE_OS+=" -DUSE_EMBEDDED_COMPILER=1 "
fi


cmake $CH_DIR -DCXX11_ABI= -DNO_WERROR=1 -DUSE_STATIC_LIBRARIES=0 -DSPLIT_SHARED_LIBRARIES=1 -DCLICKHOUSE_SPLIT_BINARY=1 -DCMAKE_BUILD_TYPE=Debug -DSAN_DEBUG=1 $CMAKE_OS \
 \
$*

# -DUSE_INTERNAL_CCTZ_LIBRARY=1 -DUSE_INTERNAL_POCO_LIBRARY=0 -DUSE_INTERNAL_BOOST_LIBRARY=0 -DUSE_INTERNAL_CITYHASH_LIBRARY=1 \

#cmake .. -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
