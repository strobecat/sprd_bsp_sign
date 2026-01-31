add_library(mincrypt STATIC ../system_core/libmincrypt/dsa_sig.c ../system_core/libmincrypt/p256.c ../system_core/libmincrypt/p256_ec.c ../system_core/libmincrypt/p256_ecdsa.c ../system_core/libmincrypt/rsa.c ../system_core/libmincrypt/sha.c ../system_core/libmincrypt/sha256.c)
target_include_directories(mincrypt PUBLIC ../system_core/include)
