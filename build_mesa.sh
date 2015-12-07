#!/bin/bash
# This part based on https://wiki.qt.io/Cross_compiling_Mesa_for_Windows
# also see https://www.freshports.org/graphics/libosmesa/

# Note you must install byacc, flex, bison packages for this to work
# https://www.freshports.org/graphics/libosmesa/

set -e

rm -rf Mesa-10.4.7

tar -xvf MesaLib-10.4.7.tar.bz2

export DEP_ROOT="$PWD"
export LLVM="$DEP_ROOT/llvm-3.4/llvm-3.4.build"
#export LLVM="$DEP_ROOT"

cd Mesa-10.4.7

# Hack to make it use our compiler i686-w64-mingw32-g??-posix...
set -e "s|'gcc'\n|'gcc-posix'\n|g" -i scons/crossmingw.py
set -e "s|'g++'\n|'g++-posix'\n|g" -i scons/crossmingw.py

#-L${MINGW_PREFIX}/${MINGW_TARGET}/lib
#INC="-I${MINGW_PREFIX}/${MINGW_TARGET}/include -I${DEP_ROOT}/include"
#CFLAGS=$INC CXXFLAGS=$INC 
#LDFLAGS="-static -s " scons build=release platform=windows toolchain=crossmingw machine=x86 gles=yes libgl-gdi
scons build=release platform=windows toolchain=crossmingw machine=x86 gles=yes libgl-gdi

cp -a build/windows-x86/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
cp -a build/windows-x86/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"
#cp -a build/windows-x86-debug/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
#cp -a build/windows-x86-debug/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"
cp -r include/* "$DEP_ROOT/include"
cd ..
