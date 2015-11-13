## Mingw lib builder kit

This is a collection of library source code and scripts
to build it.

This kit is based on the 32-bit mingw-w64 compiler toolchain
from e.g. Ubuntu trusty package "gcc-mingw-w64-i686".

The builder kit is self contained, other than for the compiler.
It doesn't matter where you put it, it does not install to your root.
All scripts install to `/include`, `/bin`, and `/lib` of this repository.

Every build script assumes that it is run from the root repository.
If you try to run any of the scripts from somewhere other than where
they are located, bad things will happen.

The only dependency that takes a very long time to compile is llvm.
By default, the `build_llvm.sh` script will use `ccache` when compiling it, so that if
you have to redo it or use a different toolchain, it will not take another
hour to do it again. If you don't want to use `ccache` you need to modify the script.

## Usage

Besides a standard, gcc-compatible toolchain, you need to have 

- flex
- bison
- byacc
- python2

You are recommended to use the `build_all.sh` to compile the whole kit in one shot.
Note that the script `build_first.sh` will attempt to copy `libwinpthread-1.dll` from
the folder `/usr/i686-w64-mingw32-gcc/lib` to the `/bin` folder. If that is not where
your mingw-provided winpthread is, you will need to change that script, also if you
are compiling with win32 threads instead you may need to reconfigure this and some
other things.

The results will be directories `/include`, `/lib`, `/bin`. The `make_package.sh`
script compresses these all into a tar ball `mingw_dep_pack.tar.gz` in the root of the repository.

## Notes

For notes on the sources of the source code / binary packages and the configuration
instructions, see the comments in the individual scripts.

Most of the instructions came from

- Openttd cross compilation guide (zlib, libpng, freetype)
- Qt instructions for cross-compiling mesa
- Projects which already had nice cmake scripts which worked well with cross compilation (openal, epoxy)
- Instructions on linux-from-scratch
- Cross compiling guides from the original maintainers (SDL2)

## OS X

- build*_osx.sh
  This was an attempt to get the llvm / mesa build to work the same
  way on OS X. It is *NOT* known to work due to missing "glProto"
  headers
  Would love to know how to fix it. :)
  I currently build mesa for OS X using macports, by using
  `port edit mesa` to stick in the configuration options I need,
  but it is clearly far from optimal.

