#!/bin/bash
# This part based on https://wiki.qt.io/Cross_compiling_Mesa_for_Windows
# also see https://www.freshports.org/graphics/libosmesa/
set -e

rm -rf llvm-3.4

tar -xvf llvm-3.4.src.tar.gz

export DEP_ROOT="$PWD"
export PYTHON=`which python` #/usr/bin/python2
#export TOOLCHAIN_DIR="/opt/mingw32/i686-w64-mingw32"
#export TOOLCHAIN_BIN="/opt/mingw32/bin"
#export TOOLCHAIN_DIR="/usr/i686-w64-mingw32"
#export TOOLCHAIN_BIN="/usr/bin"
#export TOOLCHAIN_PREFIX=/home/chris/mingw-src/prefix
export TOOLCHAIN_PREFIX=/usr
export TOOLCHAIN_TARGET=i686-w64-mingw32
export TOOLCHAIN_DIR=${TOOLCHAIN_PREFIX}/${TOOLCHAIN_TARGET}
export TOOLCHAIN_BIN=${TOOLCHAIN_PREFIX}/bin


if hash ccache 2>/dev/null; then

  export CC="ccache ${TOOLCHAIN_BIN}/${TOOLCHAIN_TARGET}-gcc-posix"
  export CXX="ccache ${TOOLCHAIN_BIN}/${TOOLCHAIN_TARGET}-g++-posix"
  export CCACHE_CPP2=yes

else
  echo "*** build_llvm.sh: ccache was not detected... you may regret this... ***"
fi

cd llvm-3.4
mkdir build
cd build
echo 'ac_cv_have_decl_strerror_s=${ac_cv_have_decl_strerror_s=no}' > config.cache
#../configure -C --prefix="$DEP_ROOT/llvm-3.4/llvm-3.4.build" --host=i686-w64-mingw32 --enable-optimized --disable-assertions --disable-pthreads --enable-targets=x86 --enable-bindings=none --disable-libffi --with-c-include-dirs=/usr/i686-w64-mingw32 --with-gcc-toolchain=/usr/i686-w64-mingw32 --with-default-sysroot=/usr/i686-w64-mingw32

../configure -C --prefix="$DEP_ROOT/llvm-3.4/llvm-3.4.build" --host=${TOOLCHAIN_TARGET} --enable-optimized --disable-assertions --disable-pthreads --enable-targets=x86 --enable-bindings=none --disable-libffi --with-c-include-dirs=${TOOLCHAIN_DIR} #--with-gcc-toolchain=${TOOLCHAIN_DIR} --with-default-sysroot=${TOOLCHAIN_DIR} #CC=$CC CXX=$CXX
#INC="-I${MINGW_PREFIX}/${MINGW_TARGET}/include -I${DEP_ROOT}/include"
#CFLAGS=$INC 
LDFLAGS="-static-libgcc -static-libstdc++ -static " make -j3 install

#^ LDFLAGS were added because of 
#http://stackoverflow.com/questions/12921911/mingw-libgcc-s-sjlj-1-dll-is-missing
#http://stackoverflow.com/questions/14225083/linking-with-static-libstdc-flag-on-mingw-4-7-1

