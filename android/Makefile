CC = g++
JAVA = java
JAVAC = javac
JAVAH = javah

CFLAGS = -Ijni -I/System/Library/Frameworks/JavaVM.framework/Headers -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/System/Library/Frameworks/JavaVM.framework/Versions/A/Headers
JFLAGS = -classpath .:src/main/java:jni

J = jni
S = src/main/java
C = ../src

OBJECTS = \
$(S)/info/hribar/thesis/Date.class \
$(J)/Date.o \
$(J)/info_hribar_thesis_Date.o

all : libthesis.jnilib

%.o : %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

info_hribar_thesis_Date.h: $(S)/info/hribar/thesis/Date.class
	$(JAVAH) $(JFLAGS) info.hribar.thesis.Date

%.class : %.java
	$(JAVAC) $(JFLAGS) $<

libthesis.jnilib: $(OBJECTS)
	$(CC) -dynamiclib -o $@ $(J)/info_hribar_thesis_Date.o

clean:
	rm -rf $(OBJECTS) libthesis.jnilib $(S)/info/hribar/app/App.class
.PHONY: clean

import:
	cp $(C)/*.cpp $(J)
	cp $(C)/*.hpp $(J)
.PHONY: import

run: all $(S)/info/hribar/app/App.class
	$(JAVA) $(JFLAGS) info.hribar.app.App
.PHONY: run