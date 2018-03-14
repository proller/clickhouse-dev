#!/usr/bin/env bash
set -e
set -x

CURDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CURDIR/../build$BUILD_TYPE"}
export CH_DIR=${CH_DIR:="$CURDIR/.."}

COMPILER_MINUS="-"
if [[ "$OSTYPE" == "darwin"* ]]; then
    SORT_VERSION=""
elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
    COMPILER_MINUS=""
else
    SORT_VERSION="--version-sort"
fi

CC=${CC:=`bash -c "compgen -c gcc | grep 'gcc${COMPILER_MINUS}[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
CXX=${CXX:=`bash -c "compgen -c g++ | grep 'g++${COMPILER_MINUS}[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}

CC=${CC:=gcc}
CXX=${CXX:=g++}

mkdir -p $BUILD_DIR && cd $BUILD_DIR

rm $BUILD_DIR/CMakeCache.txt || true

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    CMAKE_OS+=" -DCOMPILER_FLAGS='-DLZ4_DISABLE_DEPRECATE_WARNINGS=1'  -DENABLE_CAPNP=0 "
fi

CMAKE_OS+=" -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DCMAKE_ASM_COMPILER=`which ${CC}` "

if [[ `uname -i || echo ""` == "aarch64" ]]; then
    CMAKE_OS+=" -DUSE_INTERNAL_ZOOKEEPER_LIBRARY=0 "
else
    CMAKE_OS+=" -DENABLE_EMBEDDED_COMPILER=1 "
fi

cmake $CH_DIR -DNO_WERROR=1 -DUSE_STATIC_LIBRARIES=0 -DSPLIT_SHARED_LIBRARIES=1 -DCLICKHOUSE_SPLIT_BINARY=1 -DCMAKE_BUILD_TYPE=Debug -DSAN_DEBUG=1 $CMAKE_OS \
 \
$*

# -DUSE_INTERNAL_CCTZ_LIBRARY=1 -DUSE_INTERNAL_POCO_LIBRARY=0 -DUSE_INTERNAL_BOOST_LIBRARY=0 -DUSE_INTERNAL_CITYHASH_LIBRARY=1 -DLLVM_CONFIG_EXECUTABLE=`which llvm-config50` \

#cmake .. -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
