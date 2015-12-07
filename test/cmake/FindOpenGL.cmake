################################################################################
# Custom cmake module for CEGUI to find OpenGL
#
# Placeholder module to create some vars we can manually set.
# Later will create a proper tests (or steal them, anyway)
################################################################################
include(FindPackageHandleStandardArgs)

find_path(OPENGL_H_PATH NAMES GL/gl.h)

if(MINGW)
  find_library(OPENGL_LIB NAMES opengl32.dll)
else()
  find_library(OPENGL_LIB NAMES GL)
endif()

mark_as_advanced(OPENGL_H_PATH OPENGL_LIB OPENGL_LIB_DBG)

find_package_handle_standard_args(OPENGL DEFAULT_MSG OPENGL_LIB OPENGL_H_PATH)

# set up output vars
if (OPENGL_FOUND)
    set (OPENGL_INCLUDE_DIR ${OPENGL_H_PATH})
    set (OPENGL_LIBRARY ${OPENGL_LIB})
    if (OPENGL_LIB_DBG)
        set (OPENGL_LIBRARY_DBG ${OPENGL_LIB_DBG})
    endif()
else()
    set (OPENGL_INCLUDE_DIR)
    set (OPENGL_LIBRARY)
    set (OPENGL_LIBRARY)
endif()

