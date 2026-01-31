cmake_minimum_required(VERSION 3.5)

project(sprd_sign C CXX)

add_executable(splitimg splitimg/splitimg.c)

add_subdirectory("libmincrypt")
add_executable(insertheader insertheader/imgheaderinsert.c)
target_link_libraries(insertheader mincrypt)

set(WITH_APPS OFF)
add_subdirectory("../../openssl-cmake" "openssl")
set_target_properties(ssl PROPERTIES EXCLUDE_FROM_ALL 1)
add_subdirectory("signimage/sansa")
add_subdirectory("signimage/sprd")
