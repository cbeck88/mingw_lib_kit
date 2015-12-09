# the name of the target operating system
SET(CMAKE_SYSTEM_NAME Windows)

#if (NOT CMAKE_INSTALL_PREFIX)
#  MESSAGE(WARNING "Caller must define the CMAKE variable 'CMAKE_INSTALL_PREFIX' to be an absolute path to the root of the repository")
#endif()
MESSAGE(STATUS "CMAKE_INSTALL_PREFIX=" ${CMAKE_INSTALL_PREFIX})
SET(MINGW_DEP_ROOT ${CMAKE_INSTALL_PREFIX})

#SET(BIN_PATH /opt/mingw32/bin)
#SET(BIN_PATH /usr/bin)

# which compilers to use for C and C++
#SET(CMAKE_C_COMPILER ${BIN_PATH}/i686-w64-mingw32-gcc)
#SET(CMAKE_CXX_COMPILER ${BIN_PATH}/i686-w64-mingw32-g++)
#SET(CMAKE_RC_COMPILER ${BIN_PATH}/i686-w64-mingw32-windres)

#SET(CMAKE_C_COMPILER i686-w64-mingw32-gcc-posix)
#SET(CMAKE_CXX_COMPILER i686-w64-mingw32-g++-posix)
#SET(CMAKE_RC_COMPILER i686-w64-mingw32-windres)

SET(CMAKE_C_COMPILER i686-w64-mingw32-gcc)
SET(CMAKE_CXX_COMPILER i686-w64-mingw32-g++)
SET(CMAKE_RC_COMPILER i686-w64-mingw32-windres)

# here is the target environment located
SET(CMAKE_FIND_ROOT_PATH ${MINGW_DEP_ROOT})

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

set(CMAKE_EXE_LINKER_FLAGS "-static-libgcc -static-libstdc++")
