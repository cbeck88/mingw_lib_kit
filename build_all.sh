#!/bin/bash
set -e
set -u

./build_clean.sh
./build_zlib.sh
./build_libpng.sh
./build_freetype.sh
./build_epoxy.sh
./build_sdl2.sh
./build_llvm.sh
./build_mesa.sh
./build_openal.sh
./make_package.sh
