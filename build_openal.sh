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

cmake -DCMAKE_TOOLCHAIN_FILE="../../Toolchain-mingw.cmake" ..
make all
#mingw-w64-make all

cd ../..
cp "$OPENAL/OpenAL32.dll" bin/
cp -r "$OPENAL/../include/AL/." include/


# We don't want to have an 'AL' subdirectory in /include, even though that is how
# it is normally installed in linux, because it in C++ files it is #included as
# e.g. #include <al.h>, #include <alc.h>. Not as #include <AL/al.h> etc. And this
# is important for cross-platform support, because in OS X the AL directory is
# not part of their framework. So here, we just put the header root at include,
# with all the other libraries.
