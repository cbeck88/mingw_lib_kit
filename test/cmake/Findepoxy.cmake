##############
# Find Epoxy #
##############
include(FindPackageHandleStandardArgs)

find_path(EPOXY_INCLUDE_DIR
  NAMES epoxy/gl.h
  PATH_SUFFIXES epoxy
)

find_library(EPOXY_LIBRARY
  NAMES epoxy epoxy_0
  PATH_SUFFIXES bin lib64 lib libs64 libs libs/Win32 libs/Win64
)

MESSAGE(STATUS "EPOXY_INCLUDE_DIR = " ${EPOXY_INCLUDE_DIR})

mark_as_advanced(EPOXY_LIBRARY, EPOXY_INCLUDE_DIR)

find_package_handle_standard_args(EPOXY DEFAULT_MSG EPOXY_LIBRARY EPOXY_INCLUDE_DIR)

if (EPOXY_FOUND)
  SET( EPOXY_INCLUDE_DIRS ${EPOXY_INCLUDE_DIR})
  SET( EPOXY_LIBRARIES    ${EPOXY_LIBRARY})
else()
  SET( EPOXY_INCLUDE_DIRS )
  SET( EPOXY_LIBRARIES )
endif()

mark_as_advanced(EPOXY_LIBRARIES EPOXY_INCLUDE_DIRS)
