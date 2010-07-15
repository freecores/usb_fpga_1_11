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
JAVAC=javac
RM=rm -f
INSTALL=install
INSTALLDIR=$(INSTALL) -d 
INSTALLEXE=$(INSTALL) -m 0755
INSTALLFILE=$(INSTALL) -m 0644
LIBSRCS=LibusbJava.c
LIBEXTRADEPS=LibusbJava.h
JAVASRCS=$(shell echo ch/ntb/usb/*.java) $(shell echo ch/ntb/usb/logger/*.java)

LIBTARGET_SH=libusbJavaSh.so
LIBTARGET_ST=libusbJavaSt.so
LIBLIBS=-lusb
LIBINCS=-I $(JAVAPREFIX)/include -I $(JAVAPREFIX)/include/linux

.PHONY:	all libs classes install2 clean distclean

all: libs classes

classes: classes.made

libs: $(LIBTARGET_SH) $(LIBTARGET_ST)

$(LIBTARGET_ST): $(LIBSRCS) $(LIBEXTRADEPS)
	$(GCC) -shared -std=c99 -Wall -Wl,-static,-soname,$(LIBTARGET_ST) $(LIBINCS) -static $(LIBSRCS) -o $(LIBTARGET_ST) $(LIBLIBS)

$(LIBTARGET_SH): $(LIBSRCS) $(LIBEXTRADEPS)
	$(GCC) -shared -std=c99 -Wall -Wl,-soname,$(LIBTARGET_SH) $(LIBINCS) $(LIBSRCS) -o $(LIBTARGET_SH) $(LIBLIBS)

classes.made: $(JAVASRCS)
	$(JAVAC) $(JAVASRCS)
	echo > classes.made

doc:
	javadoc ch.ntb.usb -d ../docs/libusbJava
	
install2: all
	$(INSTALLDIR) ../libusbJava/ch/ntb/usb/logger
	$(INSTALLFILE) $(LIBTARGET_SH) ../libusbJava
	$(INSTALLFILE) $(LIBTARGET_ST) ../libusbJava
	$(INSTALLFILE) ch/ntb/usb/*.class ../libusbJava/ch/ntb/usb
	$(INSTALLFILE) ch/ntb/usb/logger/*.class ../libusbJava/ch/ntb/usb/logger

clean:
	$(RM) *.o

distclean:
	$(RM) $(LIBTARGET_SH) $(LIBTARGET_ST) ch/ntb/usb/*.class ch/ntb/usb/logger/*.class classes.made
