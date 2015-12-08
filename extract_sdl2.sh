#/bin/bash

rm -rf SDL2-2.0.3
tar -xzf SDL2-devel-2.0.3-mingw.tar.gz
cp -rv SDL2-2.0.3/i686-w64-mingw32/include/* include/
cp -rv SDL2-2.0.3/i686-w64-mingw32/bin/*.dll bin/
