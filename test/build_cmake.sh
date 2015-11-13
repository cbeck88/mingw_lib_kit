#!/bin/bash
set -e
rm -rf build_cmake
mkdir build_cmake
cd build_cmake
#cmake ..
cmake -DCMAKE_TOOLCHAIN_FILE="../../Toolchain-mingw.cmake" ..
make VERBOSE=1
cp ../audio.wav .
