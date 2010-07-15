mingw32-gcc -shared -Wall -D_JNI_IMPLEMENTATION_ -Wl,--kill-at -IC:\Programme\Java\jdk1.6.0_13\include -IC:\Programme\Java\jdk1.6.0_13\Include\win32 -I..\libusb-win32 LibusbJava.c ..\libusb-win32\libusb.a -o libusbJava.dll

pause
