dnl  AC_FUNC_SCANDIR64_ARGTYPES
dnl  -------------------------
dnl  Determine the correct type to be passed to each of the `scandir64'
dnl  function's arguments, and define those types in `SCANDIR64_TYPE_ARG1',
dnl  `SCANDIR64_TYPE_ARG2', `SCANDIR64_TYPE_ARG3' and `SCANDIR64_TYPE_ARG4'.
AN_FUNCTION([scandir64], [AC_FUNC_SCANDIR64_ARGTYPES])
AC_DEFUN([AC_FUNC_SCANDIR64_ARGTYPES],
[AC_CHECK_HEADERS(dirent.h)
AC_CACHE_CHECK([types of arguments for scandir64],
[ac_cv_func_scandir64_args],
[for ac_return in 'int'; do
 for ac_arg1 in 'const char *dir'; do
  for ac_arg2 in 'struct dirent64 ***namelist'; do
   for ac_arg3 in 'int(*filter)(const struct dirent64 *)' 'int(*filter)(struct dirent64 *)'; do
    for ac_arg4 in 'int(*compar)(const void *,const void *)' 'int(*compar)(const struct dirent64 **,const struct dirent64 **)'; do
     AC_COMPILE_IFELSE(
       [AC_LANG_PROGRAM(
[AC_INCLUDES_DEFAULT
#ifdef HAVE_UNISTD_H
#include <dirent.h>
#endif
],
  	    [extern $ac_return scandir64 ($ac_arg1, $ac_arg2, $ac_arg3, $ac_arg4);])],
	    [ac_cv_func_scandir64_args="$ac_return;$ac_arg1;$ac_arg2;$ac_arg3;$ac_arg4"; break 5])
    done
   done
  done
 done
done
# Provide a safe default value.
: ${ac_cv_func_scandir64_args='(default) int;const char *dir;struct dirent64 ***namelist;int(*filter)(const struct dirent64 *);int(*compar)(const void *,const void *)'}
])
ac_save_IFS=$IFS; IFS=';'
set dummy `echo "$ac_cv_func_scandir64_args" | sed 's/^(default) //' | sed 's/\*/\*/g'`
IFS=$ac_save_IFS
shift
AC_DEFINE_UNQUOTED(SCANDIR64_TYPE_RETURN, $[1],
		   [Define to the type of return value for `scandir64'.])
AC_DEFINE_UNQUOTED(SCANDIR64_TYPE_ARG1, $[2],
		   [Define to the type of arg 1 for `scandir64'.])
AC_DEFINE_UNQUOTED(SCANDIR64_TYPE_ARG2, $[3],
		   [Define to the type of arg 2 for `scandir64'.])
AC_DEFINE_UNQUOTED(SCANDIR64_TYPE_ARG3, $[4],
		   [Define to the type of arg 3 for `scandir64'.])
AC_DEFINE_UNQUOTED(SCANDIR64_TYPE_ARG4, $[5],
		   [Define to the type of arg 4 for `scandir64'.])
rm -f conftest*
])
