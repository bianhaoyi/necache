bin_PROGRAMS = twemcache

AM_CPPFLAGS = -D_GNU_SOURCE
AM_CPPFLAGS += -I $(top_srcdir)/contrib/libevent-2.0.21-stable
AM_CPPFLAGS += -I $(top_srcdir)/contrib/libevent-2.0.21-stable/include

AM_CFLAGS = -Wall
AM_CFLAGS += -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls
AM_CFLAGS += -fno-strict-aliasing


LDFLAGS += -rdynamic -static -static-libgcc

twemcache_SOURCES =			\
	mc_core.c mc_core.h		\
	mc_connection.c mc_connection.h	\
	mc_ascii.c mc_ascii.h		\
	mc_slabs.c mc_slabs.h		\
	mc_items.c mc_items.h		\
	mc_thread.c mc_thread.h		\
	mc_assoc.c mc_assoc.h		\
	mc_stats.c mc_stats.h		\
	mc_signal.c mc_signal.h		\
	mc_log.c mc_log.h		\
	mc_hash.c mc_hash.h		\
	mc_util.c mc_util.h		\
	mc_time.c mc_time.h		\
	mc_queue.h			\
	mc_cache.c mc_cache.h		\
	mc_klog.c mc_klog.h		\
	mc.c

twemcache_LDADD = $(top_builddir)/contrib/libevent-2.0.21-stable/.libs/libevent.a
