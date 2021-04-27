# for building the emulator target; cross-compile by adding CC=arm-linux-gnueabihf-gcc (or similar)
CC         = gcc
WARNINGS   = -Wall -Wextra -pedantic
CFLAGS     = $(WARNINGS) -I. -march=armv8-a -mfloat-abi=hard -mfpu=neon-fp-armv8 -O3 -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
LFLAGS     = $(WARNINGS) `sdl2-config --libs`

# for things that will run on the host as part of the build process, but not the destination (if building on pi, usually the same)
HOSTCC     = gcc
HOSTCFLAGS = -Wall -Wextra -pedantic -O2

# pass these settings down through successive makefiles
export CC WARNINGS CFLAGS LFLAGS HOSTCC HOSTCFLAGS

TARGETS := all clean
SUBDIRS := src

$(TARGETS): $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: $(TARGETS) $(SUBDIRS)
