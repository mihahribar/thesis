CC = g++
EM = emcc
AR = ar
RANLIB = ranlib

CFLAGS = -Isrc -Ilib
CFLAGS_TEST = $(CFLAGS) -Llib -lgmock -lgtest -pthread
EMFLAGS = -O2 --closure 1 -s ASM_JS=0 -s INVOKE_RUN=0 -s INCLUDE_FULL_LIBRARY=0 -std=c++11
EMFLAGS_BIND = $(EMFLAGS) -O2 --closure 1 --js-transform "python js/bundle.py" --bind

S = src
T = test

TESTS = \
$(T)/DateTest.o \
$(T)/RecurrenceTest.o \
$(T)/main.o

OBJECTS = \
$(S)/Date.o \
$(S)/Recurrence.o

EM_OBJECTS = $(OBJECTS:.o=.bc) js/bindings.bc

all : lib.a

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

%.bc : %.cpp
	$(EM) $< -o $@ $(EMFLAGS)

lib.a: $(OBJECTS)
	$(AR) rcu $@ $(OBJECTS);
	$(RANLIB) $@

js/bindings.bc : js/bindings.cpp
	$(EM) $(EMFLAGS_BIND) $< -o $@

js/lib.js: $(EM_OBJECTS)
	$(EM) js/bindings.bc $(EM_OBJECTS) -o $@ $(EMFLAGS_BIND)

tests: $(OBJECTS) $(TESTS)
	$(CC) $(OBJECTS) $(TESTS) -o $@ $(CFLAGS_TEST)
	./$@

doc:
	doxygen Doxyfile

clean:
	rm -rf $(OBJECTS) lib.a $(TESTS) doc tests $(EM_OBJECTS)
.PHONY: clean