#!/bin/bash
set -e

export DEP_ROOT=`pwd`/..
cp ../Toolchain-mingw.cmake .

rm -rf build_cmake
mkdir build_cmake
cd build_cmake
#cmake ..
cmake -DCMAKE_TOOLCHAIN_FILE="../Toolchain-mingw.cmake" -DCMAKE_INSTALL_PREFIX="$DEP_ROOT" ..
make VERBOSE=1
cp ../audio.wav .
