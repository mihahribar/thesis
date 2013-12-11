CC = g++
EM = emcc
AR = ar
RANLIB = ranlib

CFLAGS = -Isrc -Ilib
EMFLAGS = -O2 --closure 1 -s ASM_JS=0 -s INVOKE_RUN=0 -s INCLUDE_FULL_LIBRARY=0
EMFLAGS_BIND = $(EMFLAGS) -O2 --closure 1 --bind

S = src

OBJECTS = \
$(S)/Date.o

EM_OBJECTS = $(OBJECTS:.o=.bc) bindings.bc

all : lib.a

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

%.bc : %.cpp
	$(EM) $< -o $@ $(EMFLAGS)

lib.a: $(OBJECTS)
	$(AR) rcu $@ $(OBJECTS);
	$(RANLIB) $@

bindings.bc : bindings.cpp
	$(EM) $(EMFLAGS_BIND) $< -o $@

lib.js: $(EM_OBJECTS)
	$(EM) bindings.bc $(EM_OBJECTS) -o $@ $(EMFLAGS_BIND)

doc:
	doxygen Doxyfile

clean:
	rm -rf $(OBJECTS) lib.a doc $(EM_OBJECTS) lib.js
.PHONY: clean