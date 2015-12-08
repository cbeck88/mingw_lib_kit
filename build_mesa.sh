#!/bin/bash
# This part based on https://wiki.qt.io/Cross_compiling_Mesa_for_Windows
# also see https://www.freshports.org/graphics/libosmesa/

# Note you must install byacc, flex, bison packages for this to work
# https://www.freshports.org/graphics/libosmesa/

set -e

#export MESA_VER=Mesa-10.4.7
export MESA_VER=mesa-10.6.9

rm -rf "$MESA_VER"

#tar -xvf "$MESA_VER".tar.bz2
tar -xvf "$MESA_VER".tar.gz

export DEP_ROOT="$PWD"
#export LLVM="$DEP_ROOT/llvm-3.4/llvm-3.4.build"
#export LLVM="$DEP_ROOT"

cd "$MESA_VER"

# Hack to make it use our compiler i686-w64-mingw32-g??-posix...
sed -e "s|'gcc'$|'gcc-posix'|g" -i scons/crossmingw.py
sed -e "s|'g++'$|'g++-posix'|g" -i scons/crossmingw.py

# Apply patch described by qt folks
#sed -e "s|#include <limits>|#include<limits>\n#define M_PI_2          1.57079632679489661923\n#define M_PI_4          0.78539816339744830962\n|g" -i src/glsl/builtin_functions.cpp

#-L${MINGW_PREFIX}/${MINGW_TARGET}/lib
#INC="-I${MINGW_PREFIX}/${MINGW_TARGET}/include -I${DEP_ROOT}/include"
#CFLAGS=$INC CXXFLAGS=$INC 
#LDFLAGS="-static -s " scons build=release platform=windows toolchain=crossmingw machine=x86 gles=yes libgl-gdi
LDFLAGS="-shared-libgcc " \
CFLAGS="-march=i686 -pipe -D_USE_MATH_DEFINES" \
CXXFLAGS="-march=i686 -pipe -std=c++11 -D_USE_MATH_DEFINES" \
scons build=release platform=windows toolchain=crossmingw machine=generic gles=yes llvm=no debug=yes texture_float=no verbose=yes libgl-gdi

cp -a build/windows/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
cp -a build/windows/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"

#cp -a build/windows-x86/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
#cp -a build/windows-x86/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"
#cp -a build/windows-x86-debug/gallium/targets/libgl-gdi/opengl32.dll "$DEP_ROOT/bin/"
#cp -a build/windows-x86-debug/mapi/shared-glapi/libglapi.dll "$DEP_ROOT/bin"
cp -r include/* "$DEP_ROOT/include"
cd ..
