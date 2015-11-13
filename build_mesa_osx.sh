#!/bin/bash
# This part based on https://wiki.qt.io/Cross_compiling_Mesa_for_Windows

# Note you must install byacc, flex, bison packages for this to work
# https://www.freshports.org/graphics/libosmesa/

set -e

rm -rf Mesa-10.4.7

tar -xvf MesaLib-10.4.7.tar.bz2

export DEP_ROOT="$PWD"
export LLVM="$DEP_ROOT/llvm-3.4/llvm-3.4.build"

cd Mesa-10.4.7

#./configure -C --with-llvm-prefix=$LLVM --host=i686-w64-mingw32 --enable-gles1 --enable-gles2 --enable-gallium-llvm --with-gallium-drivers="r300" --enable-shared-glapi

#--disable-llvm-shared-libs
#LDFLAGS="-static -s" make
LDFLAGS="-static -s" scons build=release gles=yes
#cp -a build/windows-x86/gallium/targets/libgl-gdi/opengl32.dll $DEP_ROOT/bin/
#cp -a build/windows-x86/mapi/shared-glapi/libglapi.dll $DEP_ROOT/bin
cp -r include/* "$DEP_ROOT/include"
cd ..
