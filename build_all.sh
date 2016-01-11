#!/bin/bash
set -e
set -u

./build_clean.sh
./build_zlib.sh
./build_libpng.sh
./build_freetype.sh
./build_libxml2.sh
#./build_llvm.sh # disabled to use softpipe
                 # if you want llvm pipe then build this first, then modify build_mesa.sh
./build_mesa.sh
./build_epoxy.sh # after mesa because epoxy looks for opengl
#./build_sdl2.sh
./extract_sdl2.sh
./build_openal.sh
./make_package.sh
