add_library(mincrypt STATIC dsa_sig.c p256.c p256_ec.c p256_ecdsa.c rsa.c sha.c sha256.c)
target_include_directories(mincrypt PUBLIC ../include)
