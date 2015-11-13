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

cd Mesa-10.4.7

LDFLAGS="-static -s" scons build=release platform=windows toolchain=crossmingw machine=x86 gles=yes libgl-gdi

cp -a build/windows-x86/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
cp -a build/windows-x86/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"
cp -r include/* "$DEP_ROOT/include"
cd ..
