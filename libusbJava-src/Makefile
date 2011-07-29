# Makefile for libusbJava, a Java libusb wrapper
# Copyright (C) 2009 ZTEX e.K.
# http://www.ztex.de
#
# This Makefile ia a part of the reorganized version of the libusbJava source tree
# with proper makefiles. (SVN version of Apr. 6, 2009).
#
# Please visit http://libusbjava.sourceforge.net for more information about the
# original project.

#########################
# Configuration section #
#########################

# $(JAVAPREFIX)/include should contain jni.h
JAVAPREFIX=/usr/local/java

###############################
# this should not be modified #
###############################
GCC=gcc
STRIP=strip
CHMOD=chmod -x
JAVAC=javac
RM=rm -f
INSTALL=install
INSTALLDIR=$(INSTALL) -d 
INSTALLEXE=$(INSTALL) -m 0755
INSTALLFILE=$(INSTALL) -m 0644
OBJEXTRADEPS=LibusbJava.h
LIBSRCS=LibusbJava.o
LIBSRCS64=LibusbJava.c
JAVASRCS=$(shell echo ch/ntb/usb/*.java) $(shell echo ch/ntb/usb/logger/*.java)

LIBTARGET_SH=libusbJavaSh.so
LIBTARGET_ST=libusbJavaSt.so
LIBTARGET_64=libusbJava64.so
LIBLIBS=-lusb
LIBINCS=-I $(JAVAPREFIX)/include -I $(JAVAPREFIX)/include/linux

.PHONY:	all libs classes install2 clean distclean

all: libs classes

classes: classes.made

libs: $(LIBTARGET_SH) $(LIBTARGET_ST) $(LIBTARGET_64)

%.o: %.c LibusbJava.h
	$(GCC) -fPIC -g -c -std=c99 -Wall -Wno-pointer-to-int-cast $(LIBINCS) $< -o$@

$(LIBTARGET_ST): $(LIBSRCS)
#	$(GCC) -shared -Wl,-static,-soname,$(LIBTARGET_ST) $(LIBINCS) -static $(LIBSRCS) -o $(LIBTARGET_ST) $(LIBLIBS)
	$(GCC) -shared -Wl,-soname,$(LIBTARGET_ST),-static $(LIBINCS) $(LIBSRCS) -static -o $(LIBTARGET_ST) $(LIBLIBS)
	$(STRIP) $(LIBTARGET_ST)
	$(CHMOD) $(LIBTARGET_ST)

$(LIBTARGET_SH): $(LIBSRCS)
	$(GCC) -fPIC -shared -Wl,-soname,$(LIBTARGET_SH) $(LIBINCS) $(LIBSRCS) -o $(LIBTARGET_SH) $(LIBLIBS)
	$(STRIP) $(LIBTARGET_SH)
	$(CHMOD) $(LIBTARGET_SH)

$(LIBTARGET_64): $(LIBSRCS64)
	$(GCC) -fPIC -m64 -shared -std=c99 -Wall -Wno-pointer-to-int-cast -Wl,-soname,$(LIBTARGET_64) $(LIBINCS) $(LIBSRCS64) $(LIBLIBS) -o $(LIBTARGET_64)
	$(STRIP) $(LIBTARGET_64)
	$(CHMOD) $(LIBTARGET_64)

classes.made: $(JAVASRCS)
	$(JAVAC) $(JAVASRCS)
	echo > classes.made

doc:
	javadoc ch.ntb.usb -d ../docs/libusbJava
	
install2: all
	$(INSTALLDIR) ../libusbJava/ch/ntb/usb/logger
	$(INSTALLFILE) $(LIBTARGET_SH) ../libusbJava
	$(INSTALLFILE) $(LIBTARGET_ST) ../libusbJava
	$(INSTALLFILE) $(LIBTARGET_64) ../libusbJava
	$(INSTALLFILE) ch/ntb/usb/*.class ../libusbJava/ch/ntb/usb
	$(INSTALLFILE) ch/ntb/usb/logger/*.class ../libusbJava/ch/ntb/usb/logger

clean:

distclean:
	$(RM) *.o $(LIBTARGET_SH) $(LIBTARGET_ST) $(LIBTARGET_64) libusbJava*.dll ch/ntb/usb/*.class ch/ntb/usb/logger/*.class classes.made
