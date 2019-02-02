#
# Copyright (c) 2015 Thorsten Kukuk, Germany
#
# Author: Thorsten Kukuk <kukuk@thkukuk.de>
#
# Process this file with automake to produce Makefile.in.
#

CLEANFILES = *~

EXTRA_DIST = libnss_usrfiles.map files-parse.c files-XXX.c

AM_CFLAGS = -D_REENTRANT=1 -D_GNU_SOURCE=1 -include compat.h -std=c99
AM_CPPFLAGS = -I$(srcdir) 

lib_LTLIBRARIES = libnss_usrfiles.la

noinst_HEADERS = libc-lock.h nsswitch.h compat.h kernel-features.h ether.h
check_PROGRAMS = nss_loader-test
nss_loader_test_LDADD = -ldl

TESTS = $(check_PROGRAMS)

libnss_usrfiles_la_LDFLAGS = -version-info 2:0:0 \
	-Wl,--version-script=$(srcdir)/libnss_usrfiles.map
libnss_usrfiles_la_SOURCES = files-grp.c files-initgroups.c files-pwd.c \
	files-spwd.c files-alias.c files-ethers.c files-proto.c \
	files-rpc.c files-service.c parse-pwd.c parse-grp.c parse-spwd.c
