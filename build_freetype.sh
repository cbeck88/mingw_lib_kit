#!/bin/bash
set -e
set -u

# Based on openttd cross-compilation instructions here:
# https://wiki.openttd.org/Cross-compiling_for_Windows

export DEP_ROOT="$PWD"

#wget http://sourceforge.net/projects/freetype/files/freetype2/2.4.10/freetype-2.4.10.tar.gz
tar zxvf freetype-2.4.10.tar.gz
cd freetype-2.4.10
#./configure --host=i686-w64-mingw32 --prefix="$DEP_ROOT" --enable-static CPPFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/lib"
./configure --host=i686-w64-mingw32 --prefix="$DEP_ROOT" --disable-static --enable-shared --without-zlib CFLAGS=-I"$DEP_ROOT/include/" LDFLAGS=-L"$DEP_ROOT/bin" CC="i686-w64-mingw32-gcc-posix"
make
make install
cd ..

# Remove some stuff we don't need
rm bin/freetype-config
#cp bin/libfreetype-6.dll bin/libfreetype.dll

# Binary gnu package from here
#   http://gnuwin32.sourceforge.net/packages/freetype.htm
# You are recomended to use the source compilation instead

#tar xvzf freetype-2.3.5-1-bin.tar.gz
#cd bin
#rm *.exe
#cd ..
