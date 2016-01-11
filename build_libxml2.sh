#!/bin/bash
set -e
set -u

rm -rf libxml2-2.9.3

export DEP_ROOT="$PWD"

tar xvzf libxml2-2.9.3.tar.gz
cd libxml2-2.9.3

./configure CC=i686-w64-mingw32-gcc --host=i686-w64-mingw32 --prefix="$DEP_ROOT" --disable-static --without-docbook --without-coverage --without-modules --without-python

make -j3
make install
cd ..

# remove some stuff we don't need
rm bin/xml2-config
rm bin/*.exe
