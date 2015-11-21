#!/bin/bash
set -e
set -u

rm -rf libpng-1.6.17

# Based on openttd cross-compilation instructions here:
# https://wiki.openttd.org/Cross-compiling_for_Windows

export DEP_ROOT="$PWD"

tar xvzf libpng-1.6.17.tar.gz
cd libpng-1.6.17
#./configure --host=i686-w64-mingw32 --prefix="$DEP_ROOT" --with-bin-configs="no" --enable-static=false CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/bin" 
CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/bin" ./configure --host=i686-w64-mingw32 --disable-static --with-bin-configs=no --prefix="$DEP_ROOT"
make
make install
cd ..

cp bin/libpng16-16.dll bin/libpng16.dll

# Cleanup some stuff we don't need
rm -f bin/pngfix*
rm -f bin/png-fix*
rm -f bin/libpng16-config
rm -f bin/libpng-config
