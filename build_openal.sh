#!/bin/bash
# See more info here:
# http://ingar.satgnu.net/devenv/mingw32/local.html#openalsoft
#
# Binaries are available from the creators here:
# http://kcat.strangesoft.net/openal.html

set -e

rm -rf openal-soft-1.16.0

tar -xvf openal-soft-1.16.0.tar.bz2

# Copy dsound.h into openal include dir so it can find it
cp dsound.h openal-soft-1.16.0/include

export DEP_ROOT="$PWD"
export OPENAL="$DEP_ROOT/openal-soft-1.16.0/build"

cd "$OPENAL"

# -DCMAKE_MODULE_LINKER_FLAGS="-static-libgcc"
# TODO: Make this work! ^

cmake -DCMAKE_TOOLCHAIN_FILE="../../Toolchain-mingw.cmake" ..
make all
#mingw-w64-make all

cd ../..
cp "$OPENAL/OpenAL32.dll" bin/
#cp "$OPENAL/libOpenAL32.dll.a" bin/
cp -r "$OPENAL/../include/AL" include/

# TODO: Statically link the libgcc thing in?

#cp /usr/lib/gcc/i686-w64-mingw32/4.8/libgcc_s_sjlj-1.dll bin/
#cp /usr/i686-w64-mingw32/lib/libwinpthread-1.dll bin/
