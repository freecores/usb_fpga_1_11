#########################
# configuration section #
#########################

ZTEXPREFIX=..

JARTARGET=FWLoader.jar
CLASSTARGETS=FWLoader.class

################################
# DO NOT CHANAGE THE FOLLOWING #
################################

.PHONY: all jar clean distclean

JAVAC=javac
CLASSPATH:=.:$(ZTEXPREFIX)/libusbJava:$(ZTEXPREFIX)/java:$(CLASSPATH)
INCLUDES=-I $(ZTEXPREFIX)/include/
CLASSEXTRADEPS:=$(shell echo $(ZTEXPREFIX)/java/ztex/*.java)

all : jar

all : $(JARTARGET)

%.class: %.java $(CLASSEXTRADEPS)
	$(JAVAC) -cp "$(CLASSPATH)" $< $(CLASSEXTRADEPS)

$(JARTARGET) : $(CLASSTARGETS) $(EXTRAJARFILES)
	jar cf $(JARTARGET) *.class $(EXTRAJARFILES) -C $(ZTEXPREFIX)/libusbJava . $(shell cd $(ZTEXPREFIX)/java; ls ztex/*.class | while read a; do echo "-C $(ZTEXPREFIX)/java $$a"; done)

clean: 
	rm -f *~ *.bak *.old
	rm -f *.class 
	rm -f *.rel *.rst *.lnk *.lst *.map *.asm *.sym *.mem *.tmp.c 

distclean: clean
	rm -f $(JARTARGET)
	rm -f ztex/*.class
	rm -f *.ihx
