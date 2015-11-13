#!/bin/bash
# This part based on https://wiki.qt.io/Cross_compiling_Mesa_for_Windows
set -e

rm -rf llvm-3.4

tar -xvf llvm-3.4.src.tar.gz

export DEP_ROOT="$PWD"
export PYTHON=`which python`
export TARGETS="X86"
#export TARGETS="PowerPC"

cd llvm-3.4
mkdir build
cd build

cmake -DLLVM_TARGETS_TO_BUILD="$TARGETS" -DCMAKE_INSTALL_PREFIX="$DEP_ROOT/llvm-3.4/llvm-3.4.build" ..
make -j2
make install
