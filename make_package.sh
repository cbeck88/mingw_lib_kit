#!/bin/bash
set -e
set -u
rm -f mingw_dep_pack.tar.gz
tar --transform 's,^,mingw/,' -chzf mingw_dep_pack.tar.gz include bin lib
