dnl  AC_FUNC_READLINK_ARGTYPES
dnl  -------------------------
dnl  Determine the correct type to be passed to each of the `readlink'
dnl  function's arguments, and define those types in `READLINK_TYPE_RETURN',
dnl  `READLINK_TYPE_ARG1', `READLINK_TYPE_ARG2', and `READLINK_TYPE_ARG3'.
AN_FUNCTION([readlink], [AC_FUNC_READLINK_ARGTYPES])
AC_DEFUN([AC_FUNC_READLINK_ARGTYPES],
[AC_CHECK_HEADERS(unistd.h)
AC_CACHE_CHECK([types of arguments for readlink],
[ac_cv_func_readlink_args],
[for ac_return in 'ssize_t' 'int'; do
 for ac_arg1 in 'const char *path'; do
  for ac_arg2 in 'char *buf'; do
   for ac_arg3 in 'size_t bufsiz' 'int bufsiz'; do
   AC_COMPILE_IFELSE(
       [AC_LANG_PROGRAM(
[AC_INCLUDES_DEFAULT
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
],
            [extern $ac_return readlink ($ac_arg1, $ac_arg2, $ac_arg3);])],
	    [ac_cv_func_readlink_args="$ac_return;$ac_arg1;$ac_arg2;$ac_arg3"; break 4])
   done
  done
 done
done
# Provide a safe default value.
: ${ac_cv_func_readlink_args='(default) ssize_t;const char *path;char *buf;size_t bufsiz'}
])
ac_save_IFS=$IFS; IFS=';'
set dummy `echo "$ac_cv_func_readlink_args" | sed 's/^(default) //' | sed 's/\*/\*/g'`
IFS=$ac_save_IFS
shift
AC_DEFINE_UNQUOTED(READLINK_TYPE_RETURN, $[1],
		   [Define to the type of return value for `readlink'.])
AC_DEFINE_UNQUOTED(READLINK_TYPE_ARG1, $[2],
		   [Define to the type of arg 1 for `readlink'.])
AC_DEFINE_UNQUOTED(READLINK_TYPE_ARG2, $[3],
		   [Define to the type of arg 2 for `readlink'.])
AC_DEFINE_UNQUOTED(READLINK_TYPE_ARG3, $[4],
		   [Define to the type of arg 3 for `readlink'.])
rm -f conftest*
])
