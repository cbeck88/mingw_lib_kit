# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

#SET(BIN_PATH /opt/mingw32/bin)
SET(BIN_PATH /usr/bin)

# Change this to match PWD... sorry this is somewhat poor design...
# TODO: Make it detect pwd somehow instead
SET(MINGW_DEP_ROOT ~/dependencies)

# which compilers to use for C and C++
SET(CMAKE_C_COMPILER ${BIN_PATH}/i686-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER ${BIN_PATH}/i686-w64-mingw32-g++)
SET(CMAKE_RC_COMPILER ${BIN_PATH}/i686-w64-mingw32-windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${MINGW_DEP_ROOT})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++ -static")

