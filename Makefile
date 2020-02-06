
PROG=	mkimg
SRCS+=	format.c image.c mkimg.c scheme.c uuid.c
MAN=	mkimg.1

MKIMG_VERSION=20161016

CFLAGS+=-Wall
CFLAGS+=-DMKIMG_VERSION=${MKIMG_VERSION}
CFLAGS+=-DSPARSE_WRITE

#CFLAGS+= -E -Wp,-v

# List of formats to support
SRCS+= \
	qcow.c \
	raw.c \
	vhd.c \
	vmdk.c

# List of schemes to support
SRCS+=	\
	apm.c \
	bsd.c \
	ebr.c \
	gpt.c \
	mbr.c \
	vtoc8.c \


BINDIR?=/usr/bin

WARNS?=	6

HAS_TESTS=
SUBDIR.${MK_TESTS}+= tests


###
# Linux 
###

BUILD_PATH = .build
CODE_PATH = code
EXTRA_PATH = extra

SOURCE = $(addprefix $(CODE_PATH)/, $(SRCS))

LIBS=	$(shell pkg-config --libs libbsd-overlay)

OBJS = $(addprefix $(BUILD_PATH)/, ${SOURCE:.c=.o})

CFLAGS+=-I$(CODE_PATH) $(shell pkg-config --cflags libbsd-overlay) -I$(EXTRA_PATH) -include $(EXTRA_PATH)/sys.h



${PROG}: ${OBJS}
	@echo CC -o $@ ${OBJS} ${LDFLAGS} ${LIBS}
	@${CC} -o $@ ${OBJS} ${LDFLAGS} ${LIBS}

$(BUILD_PATH)/%.o: %.c Makefile $(BUILD_PATH)
	@echo CC $< $@
	@mkdir -p $(@D)
	@${CC} -c ${CFLAGS} $< -o $@

$(BUILD_PATH):
	@mkdir -p $(BUILD_PATH)

clean:
	@echo cleaning
	@rm -rf ${PROG} ${OBJS} ${BUILD_PATH}


