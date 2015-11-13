#!/bin/bash
set -e
set -u

rm -rf libpng-1.6.17

# Based on openttd cross-compilation instructions here:
# https://wiki.openttd.org/Cross-compiling_for_Windows

export DEP_ROOT="$PWD"

tar xvzf libpng-1.6.17.tar.gz
cd libpng-1.6.17
./configure --host=i686-w64-mingw32 --prefix="$DEP_ROOT" CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/lib"
#./configure --host=i686-w64-mingw32 --disable-static --prefix="$DEP_ROOT" CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/lib"
make
make install
cd ..

# Cleanup some stuff we don't need
rm bin/pngfix*
rm bin/png-fix*
rm bin/libpng16-config
rm bin/libpng-config
rm lib/libpng.a
rm lib/libpng.la
