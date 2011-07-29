#########################
# configuration section #
#########################

ZTEXPREFIX=../../..

JARTARGET=NVMTest.jar
CLASSTARGETS=NVMTest.class
CLASSEXTRADEPS=
CLASSEXTRADEPS:=$(shell echo $(ZTEXPREFIX)/java/ztex/*.java)

IHXTARGETS=nvmtest.ihx
IHXEXTRADEPS=
IHXEXTRADEPS:=$(shell echo $(ZTEXPREFIX)/include/*.h)
EXTRAJARFILES=nvmtest.ihx

################################
# DO NOT CHANAGE THE FOLLOWING #
################################

include $(ZTEXPREFIX)/Makefile.mk
