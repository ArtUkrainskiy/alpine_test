dnl config.m4 for extension alpine_test

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary.

dnl If your extension references something external, use 'with':

dnl PHP_ARG_WITH([alpine_test],
dnl   [for alpine_test support],
dnl   [AS_HELP_STRING([--with-alpine_test],
dnl     [Include alpine_test support])])

dnl Otherwise use 'enable':

PHP_ARG_ENABLE([alpine_test],
  [whether to enable alpine_test support],
  [AS_HELP_STRING([--enable-alpine_test],
    [Enable alpine_test support])],
  [no])

if test "$PHP_ALPINE_TEST" != "no"; then
  dnl Write more examples of tests here...

  dnl Remove this code block if the library does not support pkg-config.
  dnl PKG_CHECK_MODULES([LIBFOO], [foo])
  dnl PHP_EVAL_INCLINE($LIBFOO_CFLAGS)
  dnl PHP_EVAL_LIBLINE($LIBFOO_LIBS, ALPINE_TEST_SHARED_LIBADD)

  dnl If you need to check for a particular library version using PKG_CHECK_MODULES,
  dnl you can use comparison operators. For example:
  dnl PKG_CHECK_MODULES([LIBFOO], [foo >= 1.2.3])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo < 3.4])
  dnl PKG_CHECK_MODULES([LIBFOO], [foo = 1.2.3])

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-alpine_test -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/alpine_test.h"  # you most likely want to change this
  dnl if test -r $PHP_ALPINE_TEST/$SEARCH_FOR; then # path given as parameter
  dnl   ALPINE_TEST_DIR=$PHP_ALPINE_TEST
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for alpine_test files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       ALPINE_TEST_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$ALPINE_TEST_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the alpine_test distribution])
  dnl fi

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-alpine_test -> add include path
  dnl PHP_ADD_INCLUDE($ALPINE_TEST_DIR/include)

  dnl Remove this code block if the library supports pkg-config.
  dnl --with-alpine_test -> check for lib and symbol presence
  dnl LIBNAME=ALPINE_TEST # you may want to change this
  dnl LIBSYMBOL=ALPINE_TEST # you most likely want to change this

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   AC_DEFINE(HAVE_ALPINE_TEST_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your alpine_test library.])
  dnl ], [
  dnl   $LIBFOO_LIBS
  dnl ])

  dnl If you need to check for a particular library function (e.g. a conditional
  dnl or version-dependent feature) and you are not using pkg-config:
  dnl PHP_CHECK_LIBRARY($LIBNAME, $LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $ALPINE_TEST_DIR/$PHP_LIBDIR, ALPINE_TEST_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_ALPINE_TEST_FEATURE, 1, [ ])
  dnl ],[
  dnl   AC_MSG_ERROR([FEATURE not supported by your alpine_test library.])
  dnl ],[
  dnl   -L$ALPINE_TEST_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  dnl PHP_SUBST(ALPINE_TEST_SHARED_LIBADD)

  dnl In case of no dependencies
  AC_DEFINE(HAVE_ALPINE_TEST, 1, [ Have alpine_test support ])
  PHP_REQUIRE_CXX()
  PHP_NEW_EXTENSION(alpine_test, alpine_test.cpp, $ext_shared)
fi
