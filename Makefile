CC = g++
EM = emcc
AR = ar
RANLIB = ranlib

CFLAGS = -Isrc -Ilib
CFLAGS_TEST = $(CFLAGS) -Llib -lgmock -lgtest -pthread
EMFLAGS = -O2 --closure 1 -s ASM_JS=0 -s INVOKE_RUN=0 -s INCLUDE_FULL_LIBRARY=0 -std=c++11
EMFLAGS_BIND = $(EMFLAGS) -O2 --closure 1 --js-transform "python $(J)/bundle.py" --bind

S = src
T = test
L = lib
J = js

TESTS = \
$(T)/DateTest.o \
$(T)/RecurrenceTest.o \
$(T)/main.o

OBJECTS = \
$(S)/Date.o \
$(S)/Recurrence.o

GTEST = \
$(L)/libgtest.a \
$(L)/libgmock.a

EM_OBJECTS = $(OBJECTS:.o=.bc) $(J)/bindings.bc

all : lib.a

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

%.bc : %.cpp
	$(EM) $< -o $@ $(EMFLAGS)

lib.a: $(OBJECTS)
	$(AR) rcu $@ $(OBJECTS);
	$(RANLIB) $@

$(J)/bindings.bc : $(J)/bindings.cpp
	$(EM) $(EMFLAGS_BIND) $< -o $@

$(J)/lib.js: emsdk_portable $(EM_OBJECTS)
	$(EM) $(J)/bindings.bc $(EM_OBJECTS) -o $@ $(EMFLAGS_BIND)

$(L)/libgtest.a:
	wget https://googletest.googlecode.com/files/gtest-1.7.0.zip
	unzip gtest-1.7.0.zip
	cd gtest-1.7.0; \
	g++ -isystem include -I. -pthread -c src/gtest-all.cc; \
	ar -rv libgtest.a gtest-all.o; \
	mv libgtest.a ../$(L)

$(L)/libgmock.a: $(L)/libgtest.a
	wget https://googlemock.googlecode.com/files/gmock-1.7.0.zip
	unzip gmock-1.7.0.zip
	cd gmock-1.7.0; \
	g++ -isystem ../gtest-1.7.0/include -I../gtest-1.7.0 -isystem include -I. -pthread -c ../gtest-1.7.0/src/gtest-all.cc; \
	g++ -isystem ../gtest-1.7.0/include -I../gtest-1.7.0 -isystem include -I. -pthread -c src/gmock-all.cc; \
	ar -rv libgmock.a gtest-all.o gmock-all.o; \
	mv libgmock.a ../$(L)
	rm -rf gmock*
	rm -rf gtest*

tests: $(GTEST) $(OBJECTS) $(TESTS)
	$(CC) $(OBJECTS) $(TESTS) -o $@ $(CFLAGS_TEST)
	./$@

doc:
	doxygen Doxyfile

emsdk_portable:
	wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
	tar -xzf emsdk-portable.tar.gz
	emsdk_portable/emsdk update
	emsdk_portable/emsdk install latest
	emsdk_portable/emsdk activate latest
	cd emsdk_portable/; source emsdk_add_path
	rm emsdk-portable.tar.gz

clean:
	rm -rf $(OBJECTS) lib.a $(TESTS) doc tests $(EM_OBJECTS)
.PHONY: clean