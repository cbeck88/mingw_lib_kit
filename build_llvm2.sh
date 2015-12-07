#!/bin/bash
set -e

export DEP_ROOT="$PWD"

rm -rf llvm-3.6

tar -xf llvm-3.6.0.src.tar.xz
mv llvm-3.6.0.src llvm-3.6

cd llvm-3.6

# Make it use ccache if found
if hash ccache 2>/dev/null; then
  sed -e "s|# FIXME: It may be removed when we use 2.8.12.|set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)\nSET(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS \"\")\nSET(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS \"\")\n|p" -i CMakeLists.txt
  echo "build_llvm found ccache"
  export CCACHE_CPP2=yes
else
  echo "*** build_llvm.sh: ccache was not detected... you may regret this... ***"
fi

cp ../Toolchain-mingw.cmake .
mkdir build
cd build

cmake -DCMAKE_BUILD_TYPE="Release" -DCMAKE_CROSSCOMPILING=True -DLLVM_TABLEGEN="/usr/bin/llvm-tblgen" \
-DCMAKE_INSTALL_PREFIX="$DEP_ROOT" -DCMAKE_TOOLCHAIN_FILE="Toolchain-mingw.cmake" \
-DLLVM_TARGET_ARCH="i686-w64-mingw32" -DLLVM_TARGETS_TO_BUILD="X86" \
-DLLVM_ENABLE_THREADS="OFF" \
-DLLVM_BUILD_TOOLS="OFF" -DLLVM_BUILD_TESTS="OFF" -DLLVM_BUILD_RUNTIME="OFF" \
-DLLVM_INCLUDE_EXAMPLES="OFF" -DLLVM_INCLUDE_DOCS="OFF" -DLLVM_INCLUDE_TOOLS="OFF" \
-DLLVM_INCLUDE_TESTS="OFF" ..
#-DLLVM_PARALLEL_COMPILE_JOBS=3 ..
make -j3
cd ../..

cp -ar llvm-3.6/include include
