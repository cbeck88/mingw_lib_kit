#!/bin/bash

set -e
set -u

# Mingw SDL development libraries can be downloaded here: https://www.libsdl.org/download-2.0.php
# We also downloaded the source distribution, it does not take that long to compile from source

export DEP_ROOT="$PWD"

rm -rf SDL2-2.0.3

tar xvzf SDL2-2.0.3.tar.gz

# Hack
cp Toolchain-mingw.cmake SDL2-2.0.3

cd SDL2-2.0.3
mkdir build
cd build
#../configure --host=i686-w64-mingw32 --prefix="$DEP_ROOT" --enable-static CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/lib"

cmake -DCMAKE_INSTALL_PREFIX="$DEP_ROOT" -DCMAKE_TOOLCHAIN_FILE="Toolchain-mingw.cmake" -DSDL_RENDER=OFF -DSDL_ATOMIC=OFF -DSDL_AUDIO=OFF -DSDL_THREADS=OFF  -DSDL_TIMERS=OFF -DSDL_STATIC=OFF -DDIRECTX=OFF ..

make
make install
cd ../..

# Remove some stuff we don't need
rm lib/*SDL2*

# This is the script for just extracting the binary distribution
#../configure

#tar xvzf SDL2-devel-2.0.3-mingw.tar.gz
#cd SDL2-2.0.3/i686-w64-mingw32/
#cp lib/libSDL2.a ../../lib
#cp lib/libSDL2.dll.a ../../lib
#cp bin/SDL2.dll ../../bin
#cp -r include/SDL2 ../../include
#cd ../..
