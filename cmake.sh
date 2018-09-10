#!/usr/bin/env bash
set -e
set -x

CUR_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
export BUILD_TYPE=${BUILD_TYPE:="_debug"}
export BUILD_DIR=${BUILD_DIR:="$CUR_DIR/../build$BUILD_TYPE"}
export CH_DIR=${CH_DIR:="$CUR_DIR/.."}

COMPILER_MINUS="-"
if [[ "$OSTYPE" == "darwin"* ]]; then
    SORT_VERSION=""
elif [[ "$OSTYPE" == "FreeBSD"* ]]; then
    COMPILER_MINUS=""
else
    SORT_VERSION="--version-sort"
fi

if [[ `lsb_release -cs` == "trusty" ]] || [[ "$OSTYPE" == "darwin"* ]] || [[ "$OSTYPE" == "FreeBSD"* ]]; then
    CC=${CC:=`bash -c "compgen -c gcc | grep 'gcc${COMPILER_MINUS}[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
    CXX=${CXX:=`bash -c "compgen -c g++ | grep 'g++${COMPILER_MINUS}[[:digit:]]' | sort $SORT_VERSION --reverse | head -n1"`}
fi

CC=${CC:=gcc}
CXX=${CXX:=g++}

#CC=gcc-7
#CXX=g++-7

mkdir -p $BUILD_DIR && cd $BUILD_DIR

rm $BUILD_DIR/CMakeCache.txt || true

if [[ "$OSTYPE" == "FreeBSD"* ]]; then
    CMAKE_OS+=" -DCOMPILER_FLAGS='-DLZ4_DISABLE_DEPRECATE_WARNINGS=1' "
#-DENABLE_CAPNP=0 
    CMAKE_OS+=" -DENABLE_MYSQL=0 "
    CMAKE_OS+=" -DUSE_INTERNAL_ZLIB_LIBRARY=0 "
    CMAKE_OS+=" -DENABLE_RDKAFKA=0 "
fi

#CMAKE_OS+=" -DCXX11_ABI=ENABLE "
#CMAKE_OS+=" -DCXX11_ABI=0 "

CMAKE_OS+=" -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DCMAKE_ASM_COMPILER=`which ${CC}` "
CMAKE_OS+=" -DUSE_DEBUG_HELPERS=1 "

if [[ "$OSTYPE" == "darwin"* ]]; then
# ld: unknown option: --color-diagnostics
    CMAKE_OS+=""
elif [ -n "`which ninja`" ]; then
    CMAKE_OS+="-G Ninja"
fi

if [[ `uname -i || echo ""` == "aarch64" ]]; then
    CMAKE_OS+=" -DUSE_INTERNAL_ZOOKEEPER_LIBRARY=0 "
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CMAKE_OS+=" -DENABLE_EMBEDDED_COMPILER=0 "
    #CMAKE_OS+="-DLINKER_SUPPORTS_COLOR_DIAGNOSTICS=0"
    #CMAKE_OS+=" -DUSE_INTERNAL_LZ4_LIBRARY=0 "
    #CMAKE_OS+=""
else
    CMAKE_OS+=""
fi
    #CMAKE_OS+=" -DUSE_INTERNAL_POCO_LIBRARY=1 -DUSE_INTERNAL_CCTZ_LIBRARY=1 -DUSE_INTERNAL_RE2_LIBRARY=1 -DUSE_INTERNAL_BOOST_LIBRARY=1 "
    #CMAKE_OS+=" -DLLVM_VERSION=7 "

    #CMAKE_OS+=" -DUNBUNDLED=1 "
    #CMAKE_OS+=" -DENABLE_EMBEDDED_COMPILER=0 "
    #CMAKE_OS+=" -DINTERNAL_COMPILER_EXECUTABLE=clang++-6.0 -DINTERNAL_LINKER_EXECUTABLE=ld.lld-6.0 -DINTERNAL_COMPILER_BIN_ROOT=/usr/bin/ "

if [ -n "" ]; then
    #ln -s $BUILD_DIR/dbms/src/Common/config_version.h  $CH_DIR/dbms/src/Common/config_version.h || true
    #CMAKE_OS+=" -DINTERNAL_COMPILER_HEADERS=${CH_DIR} -DINTERNAL_COMPILER_HEADERS_ROOT=/usr/share/clickhouse/headers/ "
    CMAKE_OS+=" -DINTERNAL_COMPILER_EXECUTABLE=$BUILD_DIR/dbms/programs/clickhouse-clang -DINTERNAL_LINKER_EXECUTABLE=$BUILD_DIR/dbms/programs/clickhouse-lld "
fi

cmake $CH_DIR -DNO_WERROR=1 -DUSE_STATIC_LIBRARIES=0 -DSPLIT_SHARED_LIBRARIES=1 -DCLICKHOUSE_SPLIT_BINARY=1 -DUSE_INTERNAL_JEMALLOC_LIBRARY=0  -DCMAKE_BUILD_TYPE=Debug $CMAKE_OS \
 \
$*


# -DINTERNAL_COMPILER_HEADERS=${CH_DIR} -DINTERNAL_COMPILER_HEADERS_ROOT=/usr/share/clickhouse/headers/ \
# -DENABLE_CRYPTO=0 -DENABLE_NETSSL=0 \
# -DUSE_INTERNAL_SSL_LIBRARY=1 \
# -DUSE_INTERNAL_CCTZ_LIBRARY=1 -DUSE_INTERNAL_POCO_LIBRARY=0 -DUSE_INTERNAL_BOOST_LIBRARY=0 -DUSE_INTERNAL_CITYHASH_LIBRARY=1 -DLLVM_CONFIG_EXECUTABLE=`which llvm-config50` \
# -DENABLE_CAPNP=0 -DCapnProto_DEBUG=1
# -DCMAKE_EXE_LINKER_FLAGS=-v
# -DENABLE_JEMALLOC=0


#cmake .. -DCMAKE_CXX_COMPILER=`which ${CXX}` -DCMAKE_C_COMPILER=`which ${CC}` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug $*
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-8` -DCMAKE_C_COMPILER=`which gcc-8` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-7` -DCMAKE_C_COMPILER=`which gcc-7` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
#cmake .. -DCMAKE_CXX_COMPILER=`which g++-6` -DCMAKE_C_COMPILER=`which gcc-6` -DUSE_STATIC_LIBRARIES=0 -DCMAKE_BUILD_TYPE=Debug
