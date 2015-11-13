#!/bin/bash
set -e
set -u

rm -rf bin
rm -rf include
rm -rf lib
mkdir bin
mkdir include
mkdir lib

# If your libwinpthread-1.dll exists in a different location,
# you may need to change this.
cp /usr/i686-w64-mingw32/lib/libwinpthread-1.dll bin/
