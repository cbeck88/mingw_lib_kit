cmake_minimum_required (VERSION 2.8.11)
project (al_test)

#add_subdirectory(../openal-soft-1.16.0 "${CMAKE_CURRENT_BINARY_DIR}/openal")

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(OpenAL REQUIRED)

MESSAGE(STATUS "OPENAL: " ${OPENAL_INCLUDE_DIR})

add_executable (al_test openal_playback.cpp)

#target_library_directories (al_test PUBLIC "${MINGW_DEP_ROOT}/bin")
#target_link_libraries(al_test LINK_PUBLIC openal)
target_include_directories (al_test PUBLIC ${OPENAL_INCLUDE_DIR})
target_link_libraries(al_test LINK_PUBLIC ${OPENAL_LIBRARY})
