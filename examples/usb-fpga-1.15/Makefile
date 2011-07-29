DIRS=flashdemo flashbench standalone nvmtest 1.15b 1.15d

.PHONY: default all clean distclean

default: 
	@echo "This makefile is intended to clean up the project or to build all examples in this subdirectory"
	@echo "Usage: make all | clean | distclean"

all: 
	for i in $(DIRS); do make -C $$i all; done

clean: 
	for i in $(DIRS); do make -C $$i clean; done

distclean: clean
	for i in $(DIRS); do make -C $$i distclean; done
