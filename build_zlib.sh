#!/bin/bash
set -e
set -u

# Based on openttd cross-compilation instructions found here:
# https://wiki.openttd.org/Cross-compiling_for_Windows

rm -rf zlib-1.2.8

export DEP_ROOT="$PWD"

tar xvzf zlib-1.2.8.tar.gz
cd zlib-1.2.8
#  automatic replacement
#sed -e s/"PREFIX ="/"PREFIX = i686-w64-mingw32-posix-"/ -i win32/Makefile.gcc
#make -f win32/Makefile.gcc
#BINARY_PATH="$DEP_ROOT/bin/" INCLUDE_PATH="$DEP_ROOT/include/" LIBRARY_PATH="$DEP_ROOT/lib/" make -f win32/Makefile.gcc install
#cp zlib1.dll ../bin/
#cp zlib1.dll ../bin/libz.dll
#^ comment this out to use static zlib instead
#cd ..
#rm lib/libz.a

cp ../Toolchain-mingw.cmake .
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX="$DEP_ROOT" -DCMAKE_TOOLCHAIN_FILE="Toolchain-mingw.cmake" ..
make -j3
make install
cd ../..
rm -f lib/*
