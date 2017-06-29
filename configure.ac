# Define the package version numbers and the bug reporting address
m4_define([MC_MAJOR], 2)
m4_define([MC_MINOR], 6)
m4_define([MC_PATCH], 1)
m4_define([MC_BUGS], [cache-team@twitter.com])

# Initialize autoconf
AC_PREREQ([2.64])
AC_INIT([twemcache], [MC_MAJOR.MC_MINOR.MC_PATCH], [MC_BUGS])
AC_CONFIG_SRCDIR([src/mc.c])
AC_CONFIG_AUX_DIR([config])
AC_CONFIG_HEADERS([config.h:config.h.in])
AC_CONFIG_MACRO_DIR([m4])
AC_CANONICAL_SYSTEM

# Initialize automake
AM_INIT_AUTOMAKE(1.9 foreign)
# AM_SILENT_RULES([yes])

# Define macro variables for the package version numbers
AC_DEFINE(MC_VERSION_MAJOR, MC_MAJOR, [Define the major version number])
AC_DEFINE(MC_VERSION_MINOR, MC_MINOR, [Define the minor version number])
AC_DEFINE(MC_VERSION_PATCH, MC_PATCH, [Define the patch version number])
AC_DEFINE(MC_VERSION_STRING, "MC_MAJOR.MC_MINOR.MC_PATCH", [Define the version string])

# Checks for language
AC_LANG([C])

# Checks for programs
AC_PROG_CC
AC_PROG_INSTALL
AC_PROG_MAKE_SET
AM_PROG_CC_C_O

# Checks for typedefs, structures, and compiler characteristics
AC_C_INLINE
AC_C_CONST
AC_TYPE_INT8_T
AC_TYPE_INT16_T
AC_TYPE_INT32_T
AC_TYPE_INT64_T
AC_TYPE_INTMAX_T
AC_TYPE_INTPTR_T
AC_TYPE_UINT8_T
AC_TYPE_UINT16_T
AC_TYPE_UINT32_T
AC_TYPE_UINT64_T
AC_TYPE_UINTMAX_T
AC_TYPE_UINTPTR_T
AC_TYPE_OFF_T
AC_TYPE_PID_T
AC_TYPE_SIZE_T
AC_TYPE_SSIZE_T
AC_TYPE_UID_T

# Checks for header files
AC_HEADER_STDBOOL
AC_CHECK_HEADERS([fcntl.h float.h limits.h stddef.h stdlib.h string.h unistd.h])
AC_CHECK_HEADERS([inttypes.h stdint.h])
AC_CHECK_HEADERS([sys/ioctl.h sys/time.h sys/uio.h])
AC_CHECK_HEADERS([sys/socket.h sys/un.h netinet/in.h arpa/inet.h netdb.h])

# Checks for library functions
AC_FUNC_FORK
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([dup2])
AC_CHECK_FUNCS([gethostname])
AC_CHECK_FUNCS([gettimeofday])
AC_CHECK_FUNCS([strerror])
AC_CHECK_FUNCS([socket])
AC_CHECK_FUNCS([memchr memmove memset])
AC_CHECK_FUNCS([strchr strndup strtol strtoul strtoull])
AC_CHECK_FUNCS([mlockall])
AC_CHECK_FUNCS([getpagesizes])
AC_CHECK_FUNCS([memcntl])
AC_CHECK_FUNCS([backtrace])

# Search for library
AC_SEARCH_LIBS([pthread_create], [pthread], [],
  [AC_MSG_ERROR([need posix thread library to be installed])])

# Check if we're a little-endian or a big-endian system
AC_C_BIGENDIAN(
  [AC_DEFINE(HAVE_BIG_ENDIAN, 1, [Define to 1 if machine is big endian])],
  [AC_DEFINE(HAVE_LITTLE_ENDIAN, 1, [Define to 1 if machine is little endian])],
  [AC_MSG_ERROR([endianess of this machine is unknown])],
  [AC_MSG_ERROR([universial endianess not supported])]
)

# Check whether to enable debug logs and asserts
AC_MSG_CHECKING([whether to enable debug logs and asserts])
AC_ARG_ENABLE([debug],
  [AS_HELP_STRING(
    [--enable-debug=@<:@full|yes|log|no@:>@],
    [enable debug logs and asserts @<:@default=no@:>@])
  ],
  [],
  [enable_debug=no])
AS_CASE([x$enable_debug],
  [xfull], [AC_DEFINE([HAVE_ASSERT_PANIC], [1],
                      [Define to 1 if panic on an assert is enabled])
            AC_DEFINE([HAVE_DEBUG_LOG], [1], [Define to 1 if debug log is enabled])
            AC_DEFINE([HAVE_MEM_SCRUB], [1], [Define to 1 if memory scrubbing is enabled])
           ],
  [xyes], [AC_DEFINE([HAVE_ASSERT_LOG], [1],
                     [Define to 1 if log on an assert is enabled])
           AC_DEFINE([HAVE_DEBUG_LOG], [1], [Define to 1 if debug log is enabled])
          ],
  [xlog], [AC_DEFINE([HAVE_DEBUG_LOG], [1], [Define to 1 if debug log is enabled])],
  [xno], [],
  [AC_MSG_FAILURE([invalid value ${enable_debug} for --enable-debug])])
AC_MSG_RESULT([$enable_debug])

# Check whether to disable stats
AC_MSG_CHECKING([whether to disable stats])
AC_ARG_ENABLE([stats],
  [AS_HELP_STRING([--disable-stats], [disable stats collection])])
AS_IF(
  [test "x$enable_stats" = "xno"],
  [
    AC_DEFINE([DISABLE_STATS], [1], [Define to 1 if stats collection is disabled])
    AC_MSG_RESULT([yes])
  ],
  [AC_MSG_RESULT([no])]
)

# Check whether to disable command logger (klog)
AC_MSG_CHECKING([whether to disable command logger (klog)])
AC_ARG_ENABLE([klog],
  [AS_HELP_STRING([--disable-klog], [disable klogger])])
AS_IF(
  [test "x$enable_klog" = "xno"],
  [
    AC_DEFINE([DISABLE_KLOG], [1], [Define to 1 if klogger is disabled])
    AC_MSG_RESULT([yes])
  ],
  [AC_MSG_RESULT([no])]
)

AC_CONFIG_COMMANDS_PRE([tar xvfz contrib/libevent-2.0.21-stable.tar.gz -C contrib])

AC_CONFIG_SUBDIRS([contrib/libevent-2.0.21-stable])

case $host_os in
  darwin* )
        ;;
  linux*)
        LDFLAGS="-lrt"
        ;;
  *BSD*)
        ;;
  *)
        #Default Case
        AC_MSG_ERROR([Your platform is not currently supported])
        ;;
esac

# Define Makefiles
AC_CONFIG_FILES([Makefile
                 contrib/Makefile
                 src/Makefile])

# Generate the "configure" script
AC_OUTPUT
