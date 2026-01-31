option(USE_AES128_ENCRYPT "Use AES128 instead of AES256, when SECURE_BOOT_KCE==128" OFF)
option(USE_DEBUGMASK_32 "Use 32bits debug mask" OFF)

file(GLOB SPRDSIGN_COMMON_SRC "common/pk1/src/*.c" "common/rsa/src/*.c" "common/sha256/src/*.c" "common/verify/src/*.c")
set(SPRDSIGN_COMMON_INC "common/pk1/inc" "common/rsa/inc" "common/sha256/inc" "common/verify/inc")

add_executable(sprd_sign ${SPRDSIGN_COMMON_SRC} "sign/main/start.c")
target_include_directories(sprd_sign PRIVATE ${SPRDSIGN_COMMON_INC})
target_link_libraries(sprd_sign crypto)

add_executable(sprd_encrypt ${SPRDSIGN_COMMON_SRC} "encrypt/main/encrypt.c")
target_include_directories(sprd_encrypt PRIVATE ${SPRDSIGN_COMMON_INC})
target_link_libraries(sprd_encrypt crypto)

add_executable(sprd_mkprimarycert ${SPRDSIGN_COMMON_SRC} "mkprimarycert/main/mkprimarycert.c")
target_include_directories(sprd_mkprimarycert PRIVATE ${SPRDSIGN_COMMON_INC})
target_link_libraries(sprd_mkprimarycert crypto)

add_executable(sprd_mkdbimg ${SPRDSIGN_COMMON_SRC} "mkdbimg/main/mkdbimg.c")
target_include_directories(sprd_mkdbimg PRIVATE ${SPRDSIGN_COMMON_INC})
target_link_libraries(sprd_mkdbimg crypto)

if(USE_AES128_ENCRYPT)
    target_compile_definitions(sprd_encrypt PRIVATE AES_128)
endif()
if(USE_DEBUGMASK_32)
    target_compile_definitions(sprd_mkprimarycert PRIVATE DEBUGMASK_32)
    target_compile_definitions(sprd_mkdbimg PRIVATE DEBUGMASK_32)
endif()
