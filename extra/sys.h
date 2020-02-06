
#ifndef FAKE_SYS_CDEFS
#define FAKE_SYS_CDEFS


//#define _GNU_SOURCE

//#include </usr/include/sys/cdefs.h>
#include <sys/time.h>
#include <stdio.h>

//#include <bsd/string.h>
//#include <bsd/err.h>
//#include <bsd/stdio.h>
//#include <stdarg.h>

//#define __SCCSID(x)

//#define __FBSDID(x)
#if !defined(__unused)
#  define	__unused
#endif

int asprintf(char **strp, const char *fmt, ...);

//#define __weak_reference(...)

//#define getprogname() "test"

//#define _getprogname getprogname



//#define __BEGIN_DECLS
//#define __END_DECLS
//#define __NULLABILITY_PRAGMA_POP
//#define __NULLABILITY_PRAGMA_PUSH

//#if !defined(__THROW)
//#  define __THROW
//#endif
//#define 

//#define	__va_list	va_list
/////////////////////
//#define __dead2 // TODO !!
//#define __printf0like(...) // TODO!!!
//#define __printflike(...) // TODO



#endif
