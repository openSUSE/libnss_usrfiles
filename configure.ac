dnl Process this file with autoconf to produce a configure script.
AC_INIT(libnss_usrfiles, 2.27.1)
AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR([src/files-pwd.c])
AM_CONFIG_HEADER(config.h)
AC_CONFIG_MACRO_DIR([m4])
AC_PREFIX_DEFAULT(/usr)

AC_SUBST(PACKAGE)
AC_SUBST(VERSION)

dnl Checks for programs.
AC_PROG_CC
AC_GNU_SOURCE
AM_PROG_CC_C_O
dnl If we're using gcc, we want warning flags
dnl test -n "$GCC" && WARNFLAGS="-Wall"
test -n "$GCC" && WARNFLAGS="-W -Wall -Wbad-function-cast -Wcast-align -Winline -Wnested-externs -Wshadow -Wmissing-declarations -Wmissing-prototypes -Wstrict-prototypes -Wundef -Werror"
AC_SUBST(WARNFLAGS)
AC_PROG_CPP
AC_ISC_POSIX
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AC_PROG_LIBTOOL
LT_INIT

AC_OUTPUT([Makefile src/Makefile])
