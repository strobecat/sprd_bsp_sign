add_executable(signimage source/main.cpp)
target_include_directories(signimage PRIVATE source)

if(MSVC)
    target_compile_options(signimage PRIVATE /FIcstdint)
else()
    target_compile_options(signimage PRIVATE -include cstdint)
endif()
