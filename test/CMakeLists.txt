cmake_minimum_required (VERSION 2.8.11)
project (al_test)

add_subdirectory(../openal-soft-1.16.0 "${CMAKE_CURRENT_BINARY_DIR}/openal")

MESSAGE(STATUS "OPENAL: " "${OpenAL_SOURCE_DIR}/include")

add_executable (al_test openal_playback.cpp)

target_include_directories (al_test PUBLIC "${OpenAL_SOURCE_DIR}/include")
#target_link_libraries(al_test LINK_PUBLIC openal)
target_link_libraries(al_test LINK_PUBLIC OpenAL32)
