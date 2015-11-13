#!/bin/bash

set -e
set -u

export DEP_ROOT=`pwd`

#  This is based on a fork of the official libepoxy from "yaronct".
#  He calls this version 1.3.1-yaronct5.
#  He created the cmake recipe that is being used. The enclosed file
#  is a snapshot of his master branch:
#  https://github.com/yaronct/libepoxy
#  You might need to adjust the toolchain file depending on your
#  system.

tar -xvf libepoxy-yaronct-1.3.1.tar.gz

cp Toolchain-mingw.cmake libepoxy-master

cd libepoxy-master

# Fix a typo...
sed -i -e "52,54s/Windows/windows/p" include/epoxy/gl.h



rm -rf build
mkdir build

cd build
cmake -DEPOXY_BUILD_TESTS=OFF -DCMAKE_TOOLCHAIN_FILE="Toolchain-mingw.cmake" -DCMAKE_INSTALL_PREFIX="$DEP_ROOT" ..
make
make install

cd ../../lib
rm libepoxy*.a
cd ..

#cp src/libepoxy_0.dll "$DEP_ROOT/bin/libepoxy_0.dll"
#cp -r include/epoxy "$DEP_ROOT/include"
