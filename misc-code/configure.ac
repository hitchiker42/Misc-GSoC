#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.
# Only for C like languages and asm, also cleaning up object files.
AC_PREREQ(2.61)
dnl ? what does this do
AC_INIT([mlton.sh], [0.01])
AM_INIT_AUTOMAKE([-Wall foreign])
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

dnl Checks for programs.

AC_PROG_CC_C99
if test -z "$CC" || test "$CC" = "no"; then
  AC_MSG_ERROR([No suitable C99 compiler found])
fi
AM_PROG_CC_C_O

dnl for library support
AC_PROG_RANLIB
AC_CHECK_LIB([m],[cos])
AC_CHECK_LIB([gmp],[mpz_add])
m4_ifdef([AM_PROG_AR], [AM_PROG_AR])

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
