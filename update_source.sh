#!/bin/sh -x

GLIBC_CHECKOUT=../../glibc

for i in files-grp.c files-initgroups.c files-parse.c files-pwd.c files-spwd.c files-XXX.c files-alias.c files-ethers.c files-proto.c files-rpc.c files-service.c ; do
	cp -a ${GLIBC_CHECKOUT}/nss/nss_files/$i src/
done
sed -i -e 's|_nss_files_|_nss_usrfiles_|g' src/files-XXX.c
sed -i -e 's|_nss_files_|_nss_usrfiles_|g' src/files-alias.c
sed -i -e 's|_nss_files_|_nss_usrfiles_|g' src/files-initgroups.c
sed -i -e 's|_nss_files_|_nss_usrfiles_|g' src/files-parse.c
sed -i -e 's|/etc/|/usr/etc/|g' src/files-XXX.c
sed -i -e 's|/etc/|/usr/etc/|g' src/files-initgroups.c
sed -i -e 's|/etc/|/usr/etc/|g' src/files-alias.c
sed -i -e 's|#include <netinet/ether.h>|#include "ether.h"|g' src/files-ethers.c
cp -a ${GLIBC_CHECKOUT}/include/netinet/ether.h src
sed -i -e 's|<inet/netinet/ether.h>|<netinet/ether.h>|g' src/ether.h
sed -i -e 's|^libc_hidden_proto.*||g' src/ether.h
sed -i -e 's|^libnss_files_hidden_proto.*||g' src/ether.h
sed -i -e 's|^nss_files_parse_hidden_def.*||g' src/files-parse.c 
sed -i -e 's|__strcasecmp|strcasecmp|g' src/files-alias.c src/files-ethers.c src/files-parse.c
