#line 1 "debug.c"
/*!
   debug -- debug helper example
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/


#line 1 "../../../include/ztex-conf.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Configuration macros 
*/

#line 25 "../../../include/ztex-conf.h"

/* 
   Don't expand macros in comments
*/
#line 33 "../../../include/ztex-conf.h"

/* 
   This macro defines the USB Vendor ID and USB Product ID  (not the product ID
   from the ZTEX descriptor). The Vendor ID must be purchased from the USB-IF
   (http://www.usb.org). 
   
   The default vendor ID is the ZTEX vendor ID 0x221A, default product ID is
   0x100 which is assigned to ZTEX modules. These ID's can be shared by many
   different products which are identified by the product ID of the ZTEX
   descriptor. According to the USB-IF rules these ID's must not be used by
   hardware which is not manufactured by ZTEX. (Of course, this ID's can be 
   used during the development process or for internal purposes.)
   
   Please read the http://www.ztex.de/firmware-kit/usb_ids.e.html for more 
   informations about this topic.   
   
   Usage:
	SET_VPID(<Vendor ID>,<Product ID>);
*/
#line 55 "../../../include/ztex-conf.h"

/* 
   This macro is called before FPGA Firmware is reset, e.g. to save some
   settings. After this macro is called the I/O ports are set to default
   states in order to avoid damage during / after the FPGA configuration.
   To append something to this macro use the following definition:
#define[PRE_FPGA_RESET][PRE_FPGA_RESET
...]
*/
#line 65 "../../../include/ztex-conf.h"


/* 
   This macro is called after FPGA Firmware has been configured. This is
   usually used to configure the I/O ports.
   To append something to this macro use the following definition:
#define[POST_FW_LOAD][POST_FW_LOAD
...]
*/
#line 75 "../../../include/ztex-conf.h"



/* 
  Add a vedor request for endpoint 0, 

   Usage:
     ADD_EP0_VENDOR_REQUEST((<request number>,,<code executed after setup package received>,,<code executed after data package received>''));
   Example:
     ADD_EP0_VENDOR_REQUEST((0x33,,initHSFPGAConfiguration();,,));;
...]
*/
#line 99 "../../../include/ztex-conf.h"


/* 
   Add a vedor command for endpoint 0, 

   Usage:
     ADD_EP0_VENDOR_COMMAND((<request number>,,<code executed after setup package received>,,<code executed after data package received>''));
   Example:
     ADD_EP0_VENDOR_COMMAND((0x33,,initHSFPGAConfiguration();,,));;
...]
*/
#line 122 "../../../include/ztex-conf.h"

/* 
  This macro generates a EP0 stall and aborts the current loop. Stalls are usually used to indicate errors.
*/
#line 131 "../../../include/ztex-conf.h"


/* 
   Endoint 1,2,4,5,8 configuration:

   EP_CONFIG(<EP number>,<interface>,<type>,<direction>,<size>,<buffers>)
        <EP number> = 1IN | 1OUT | 2 | 4 | 6 | 8	Endpoint number
        <INTERFACE> = 0 | 1 | 2 | 3			To which interface this endpoint belongs
	<type>      = BULK  | ISO | INT
	<dir>       = IN | OUT
	<size>      = 512 | 1024
	<buffers>   = 1 | 2 | 3 | 4
   Example: EP_CONFIG(2,0,ISO,OUT,1024,4);
   Important note: No spaces next to the commas


   Endpoint 1 configuration:
   
   These Endpoints are defined by default as bulk endpoints and are assigned to interface 0.
   Endpoint size is always 64 bytes, but reported Endpoint size will be 512 bytes for USB 2.0 compliance. 
   
   These Endpoints can be redefined using EP_CONFIG or using:
   
   EP1IN_CONFIG(<interface>);
           <INTERFACE> = 0 | 1 | 2 | 3		Interface to which EP1IN belongs; default: 0
   EP1OUT_CONFIG(<interface>);
           <INTERFACE> = 0 | 1 | 2 | 3		Interface to which EP1OUT belongs; default: 0
   EP1_CONFIG(<interface>);
           <INTERFACE> = 0 | 1 | 2 | 3		Interface to which EP1IN and EP1OUT belongs; default: 0

   The following (maximum) configurations are possible:
   EP2		EP4	EP6	EP8
   2x512	2x512	2x512	2x512
   2x512	2x512	4x512	
   2x512	2x512	2x1024
   4x512		2x512	2x512
   4x512		4x512	
   4x512		2x1024
   2x1024		2x512	2x512
   2x1024		4x512	
   2x1024		2x1024
   3x512		3x512	2x512
   3x1024			2x512
   4x1024		
*/
#line 215 "../../../include/ztex-conf.h"

#line 220 "../../../include/ztex-conf.h"

#line 176 "../../../include/ztex-conf.h"

#line 176 "../../../include/ztex-conf.h"

#line 223 "../../../include/ztex-conf.h"

/* 
   ISO and INT Transactions per microframe:

   Default value is 1 for all endpoints.

   EP_PPMF(<EP number>,<transactions per microframe>)
        <EP number>                  = 1IN | 1OUT | 2 | 4 | 6 | 8	Endpoint
        <transactions per microframe> = 1 | 2 | 3			Transactions per microframe
        
   Example: EP_PPMF(2,3);
   Important note: No spaces next to the commas
*/
#line 251 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 236 "../../../include/ztex-conf.h"

#line 258 "../../../include/ztex-conf.h"

/* 
   Polling interval in microframes for INT transactions:

   Default value is 1 for all endpoints.

   EP_POLL(<EP number>,<polling interval>)
        <EP number>        = 1IN | 1OUT | 2 | 4 | 6 | 8		Endpoint
        <polling interval> = 1 | 2 | 3				Polling interval
        
   Example: EP_POLL(2,1);
   Important note: No spaces next to the commas
*/
#line 281 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 271 "../../../include/ztex-conf.h"

#line 288 "../../../include/ztex-conf.h"



/* 
   Settings which depends PRODUCT_ID, e.g extra capabilities.
   Overwrite this macros as desired.
*/
#line 307 "../../../include/ztex-conf.h"

#line 309 "../../../include/ztex-conf.h"

#line 314 "../../../include/ztex-conf.h"


/* 
   Identify as ZTEX USB FPGA Module 1.0
   Usage: IDENTITY_UFM_1_0(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 327 "../../../include/ztex-conf.h"


/* 
   Identify as ZTEX USB FPGA Module 1.1
   Usage: IDENTITY_UFM_1_1(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 340 "../../../include/ztex-conf.h"


/* 
   Identify as ZTEX USB FPGA Module 1.2
   Usage: IDENTITY_UFM_1_2(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 353 "../../../include/ztex-conf.h"

/* 
   Identify as ZTEX USB FPGA Module 1.10
   Usage: IDENTITY_UFM_1_10(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 365 "../../../include/ztex-conf.h"

/* 
   Identify as ZTEX USB FPGA Module 1.11
   Usage: IDENTITY_UFM_1_10(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 377 "../../../include/ztex-conf.h"


/* 
   Identify as ZTEX USB Module 1.0
   Usage: IDENTITY_UM_1_0(<PRODUCT_ID_0>.<PRODUCT_ID_1><PRODUCT_ID_2>.<PRODUCT_ID_3>,<FW_VERSION>);
*/
#line 390 "../../../include/ztex-conf.h"


/* 
   This macro defines the Manufacturer string. Limited to 31 characters. 
*/
#line 396 "../../../include/ztex-conf.h"


/* 
   This macro defines the Product string. Limited to 31 characters. 
*/
#line 402 "../../../include/ztex-conf.h"


/* 
   This macro defines the Configuration string. Limited to 31 characters. 
*/
#line 408 "../../../include/ztex-conf.h"


/* 
   This macro enables defines the Configuration string. Limited to 31 characters. 
*/
#line 414 "../../../include/ztex-conf.h"


/* 
   This macro disables EEPROM interface and certain I2C functions (enabled by default)
   Usage: DISABLE_EEPROM; 
*/
#line 421 "../../../include/ztex-conf.h"


/* 
   This macro enables the Flash interface, if available
   Usage: ENABLE_FLASH; 
*/
#line 428 "../../../include/ztex-conf.h"

/* 
   This macro enables the FPGA configuration using a bitstream from the Flash memory
   Usage: ENABLE_FLASH_BITSTREAM; 
*/
#line 434 "../../../include/ztex-conf.h"

/* 
   This enables the debug helper. The debug helper consists in a stack of messages which can be read out from host software.
   See ../examples/all/debug/Readme.
   Usage: ENABLE_DEBUG(<stack size>,<message_size>);
	<stack size>	number of messages in stack
	<message size>  message size in bytes
*/
#line 445 "../../../include/ztex-conf.h"

#line 30 "../../../include/ztex-conf.h"
	// Loads the configuration macros, see ztex-conf.h for the available macros
#line 1 "../../../include/ztex-utils.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Various utility routines
*/

#line 25 "../../../include/ztex-utils.h"

#line 34 "../../../include/ztex-utils.h"

#line 39 "../../../include/ztex-utils.h"

#line 44 "../../../include/ztex-utils.h"

typedef unsigned char BYTE;
typedef unsigned short WORD;
typedef unsigned long DWORD;

#line 1 "../../../include/ezregs.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   EZ-USB registers
*/

#line 25 "../../../include/ezregs.h"

#line 1 "../../../include/ztex-utils.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Various utility routines
*/

#line 26 "../../../include/ezregs.h"


/* This syncronization delay is valid if <CPU Clock> <= 5/3*<Interface Clock>, 
   i.e. if the Interface Clock is equal or greater than 28.8 MHz
   
   The formula for the synchonization delay is:
   
                        /    <CPU Clock>        \
   <syncdelay> >= 1.5 * | ----------------- + 1 |
                        \ <Interface Clock>     /
   
   Overwrite this macro if this formula is not satisfied 
*/   

#line 49 "../../../include/ezregs.h"
    
#line 30 "../../../include/ztex-conf.h"
// GPIF Waveform Memories
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE400 volatile BYTE GPIF_WAVE_DATA[128];	// GPIF Waveform Descriptor 0, 1, 2 3, data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE400 volatile BYTE GPIF_WAVE0_DATA[32];	// GPIF Waveform Descriptor 0 data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE420 volatile BYTE GPIF_WAVE1_DATA[32];	// GPIF Waveform Descriptor 1 data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE440 volatile BYTE GPIF_WAVE2_DATA[32];	// GPIF Waveform Descriptor 2 data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE460 volatile BYTE GPIF_WAVE3_DATA[32];	// GPIF Waveform Descriptor 3 data
#line 56 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// General Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE50D volatile BYTE GPCR2;			// General Purpose Configuration Register 2
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE600 volatile BYTE CPUCS;			// Control & Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE601 volatile BYTE IFCONFIG;			// Interface Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE602 volatile BYTE PINFLAGSAB;		// FIFO FLAGA and FLAGB Assignments
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE603 volatile BYTE PINFLAGSCD;		// FIFO FLAGC and FLAGD Assignments
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE604 volatile BYTE FIFORESET;		// Restore FIFOS to default state
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE605 volatile BYTE BREAKPT;			// Breakpoint
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE606 volatile BYTE BPADDRH; 			// Breakpoint Address H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE607 volatile BYTE BPADDRL;			// Breakpoint Address L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE608 volatile BYTE UART230;			// 230 Kbaud clock for T0,T1,T2
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE609 volatile BYTE FIFOPINPOLAR;		// FIFO polarities
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE60A volatile BYTE REVID;			// Chip Revision
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE60B volatile BYTE REVCTL;			// Chip Revision Control
#line 71 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// UDMA
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE60C volatile BYTE GPIFHOLDAMOUNT;		// MSTB Hold Time (for UDMA)
#line 74 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// Endpoint Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE610 volatile BYTE EP1OUTCFG;		// Endpoint 1-OUT Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE611 volatile BYTE EP1INCFG;			// Endpoint 1-IN Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE612 volatile BYTE EP2CFG;			// Endpoint 2 Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE613 volatile BYTE EP4CFG;			// Endpoint 4 Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE614 volatile BYTE EP6CFG;			// Endpoint 6 Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE615 volatile BYTE EP8CFG;			// Endpoint 8 Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE618 volatile BYTE EP2FIFOCFG;		// Endpoint 2 FIFO configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE619 volatile BYTE EP4FIFOCFG;		// Endpoint 4 FIFO configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE61A volatile BYTE EP6FIFOCFG;		// Endpoint 6 FIFO configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE61B volatile BYTE EP8FIFOCFG;		// Endpoint 8 FIFO configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE620 volatile BYTE EP2AUTOINLENH;		// Endpoint 2 Packet Length H (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE621 volatile BYTE EP2AUTOINLENL;		// Endpoint 2 Packet Length L (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE622 volatile BYTE EP4AUTOINLENH;		// Endpoint 4 Packet Length H (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE623 volatile BYTE EP4AUTOINLENL;		// Endpoint 4 Packet Length L (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE624 volatile BYTE EP6AUTOINLENH;		// Endpoint 6 Packet Length H (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE625 volatile BYTE EP6AUTOINLENL;		// Endpoint 6 Packet Length L (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE626 volatile BYTE EP8AUTOINLENH;		// Endpoint 8 Packet Length H (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE627 volatile BYTE EP8AUTOINLENL;		// Endpoint 8 Packet Length L (IN only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE628 volatile BYTE ECCCFG;			// ECC Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE629 volatile BYTE ECCRESET;			// ECC Reset
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62A volatile BYTE ECC1B0;			// ECC1 Byte 0 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62B volatile BYTE ECC1B1;			// ECC1 Byte 1 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62C volatile BYTE ECC1B2;			// ECC1 Byte 2 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62D volatile BYTE ECC2B0;			// ECC2 Byte 0 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62E volatile BYTE ECC2B1;			// ECC2 Byte 1 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE62F volatile BYTE ECC2B2;			// ECC2 Byte 2 Address
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE630 volatile BYTE EP2FIFOPFH;		// EP2 Programmable Flag trigger H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE631 volatile BYTE EP2FIFOPFL;		// EP2 Programmable Flag trigger L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE632 volatile BYTE EP4FIFOPFH;		// EP4 Programmable Flag trigger H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE633 volatile BYTE EP4FIFOPFL;		// EP4 Programmable Flag trigger L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE634 volatile BYTE EP6FIFOPFH;		// EP6 Programmable Flag trigger H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE635 volatile BYTE EP6FIFOPFL;		// EP6 Programmable Flag trigger L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE636 volatile BYTE EP8FIFOPFH;		// EP8 Programmable Flag trigger H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE637 volatile BYTE EP8FIFOPFL;		// EP8 Programmable Flag trigger L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE640 volatile BYTE EP2ISOINPKTS;		// EP2 (if ISO) IN Packets per frame (1-3)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE641 volatile BYTE EP4ISOINPKTS;		// EP4 (if ISO) IN Packets per frame (1-3)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE642 volatile BYTE EP6ISOINPKTS;		// EP6 (if ISO) IN Packets per frame (1-3)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE643 volatile BYTE EP8ISOINPKTS;		// EP8 (if ISO) IN Packets per frame (1-3)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE648 volatile BYTE INPKTEND;			// Force IN Packet End
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE649 volatile BYTE OUTPKTEND;		// Force OUT Packet End
#line 116 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// Interrupts
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE650 volatile BYTE EP2FIFOIE;		// Endpoint 2 Flag Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE651 volatile BYTE EP2FIFOIRQ;		// Endpoint 2 Flag Interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE652 volatile BYTE EP4FIFOIE;		// Endpoint 4 Flag Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE653 volatile BYTE EP4FIFOIRQ;		// Endpoint 4 Flag Interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE654 volatile BYTE EP6FIFOIE;		// Endpoint 6 Flag Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE655 volatile BYTE EP6FIFOIRQ;		// Endpoint 6 Flag Interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE656 volatile BYTE EP8FIFOIE;		// Endpoint 8 Flag Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE657 volatile BYTE EP8FIFOIRQ;		// Endpoint 8 Flag Interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE658 volatile BYTE IBNIE;			// IN-BULK-NAK Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE659 volatile BYTE IBNIRQ;			// IN-BULK-NAK interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65A volatile BYTE NAKIE;			// Endpoint Ping NAK interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65B volatile BYTE NAKIRQ;			// Endpoint Ping NAK interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65C volatile BYTE USBIE;			// USB Int Enables
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65D volatile BYTE USBIRQ;			// USB Interrupt Requests
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65E volatile BYTE EPIE;			// Endpoint Interrupt Enables
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE65F volatile BYTE EPIRQ;			// Endpoint Interrupt Requests
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE660 volatile BYTE GPIFIE;			// GPIF Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE661 volatile BYTE GPIFIRQ;			// GPIF Interrupt Request
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE662 volatile BYTE USBERRIE;			// USB Error Interrupt Enables
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE663 volatile BYTE USBERRIRQ;		// USB Error Interrupt Requests
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE664 volatile BYTE ERRCNTLIM;		// USB Error counter and limit
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE665 volatile BYTE CLRERRCNT;		// Clear Error Counter EC[3..0]
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE666 volatile BYTE INT2IVEC;			// Interupt 2 (USB) Autovector
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE667 volatile BYTE INT4IVEC;			// Interupt 4 (FIFOS & GPIF) Autovector
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE668 volatile BYTE INTSETUP;			// Interrupt 2&4 Setup
#line 143 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// Input/Output
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE670 volatile BYTE PORTACFG;			// I/O PORTA Alternate Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE671 volatile BYTE PORTCCFG;			// I/O PORTC Alternate Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE672 volatile BYTE PORTECFG;			// I/O PORTE Alternate Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE678 volatile BYTE I2CS;			// Control & Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE679 volatile BYTE I2DAT;			// Data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67A volatile BYTE I2CTL;			// I2C Control
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67B volatile BYTE XAUTODAT1;		// Autoptr1 MOVX access
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67B volatile BYTE EXTAUTODAT1;		// Autoptr1 MOVX access
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67C volatile BYTE XAUTODAT2;		// Autoptr2 MOVX access
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67C volatile BYTE EXTAUTODAT2;		// Autoptr2 MOVX access
#line 155 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// UDMA CRC
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67D volatile BYTE UDMACRCH;			// UDMA CRC MSB
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67E volatile BYTE UDMACRCL;			// UDMA CRC LSB
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE67F volatile BYTE UDMACRCQUALIFIER;		// UDMA CRC Qualifier
#line 160 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// USB Control
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE680 volatile BYTE USBCS;			// USB Control & Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE681 volatile BYTE SUSPEND;			// Put chip into suspend
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE682 volatile BYTE WAKEUPCS;			// Wakeup source and polarity
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE683 volatile BYTE TOGCTL;			// Toggle Control
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE684 volatile BYTE USBFRAMEH;		// USB Frame count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE685 volatile BYTE USBFRAMEL;		// USB Frame count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE686 volatile BYTE MICROFRAME;		// Microframe count, 0-7
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE687 volatile BYTE FNADDR;			// USB Function address
#line 170 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// Endpoints
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE68A volatile BYTE EP0BCH;			// Endpoint 0 Byte Count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE68B volatile BYTE EP0BCL;			// Endpoint 0 Byte Count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE68D volatile BYTE EP1OUTBC;			// Endpoint 1 OUT Byte Count
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE68F volatile BYTE EP1INBC;			// Endpoint 1 IN Byte Count
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE690 volatile BYTE EP2BCH;			// Endpoint 2 Byte Count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE691 volatile BYTE EP2BCL;			// Endpoint 2 Byte Count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE694 volatile BYTE EP4BCH;			// Endpoint 4 Byte Count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE695 volatile BYTE EP4BCL;			// Endpoint 4 Byte Count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE698 volatile BYTE EP6BCH;			// Endpoint 6 Byte Count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE699 volatile BYTE EP6BCL;			// Endpoint 6 Byte Count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE69C volatile BYTE EP8BCH;			// Endpoint 8 Byte Count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE69D volatile BYTE EP8BCL;			// Endpoint 8 Byte Count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A0 volatile BYTE EP0CS;			// Endpoint Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A1 volatile BYTE EP1OUTCS;			// Endpoint 1 OUT Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A2 volatile BYTE EP1INCS;			// Endpoint 1 IN Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A3 volatile BYTE EPXCS[4];			// Endpoint 2-8 Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A3 volatile BYTE EP2CS;			// Endpoint 2 Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A4 volatile BYTE EP4CS;			// Endpoint 4 Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A5 volatile BYTE EP6CS;			// Endpoint 6 Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A6 volatile BYTE EP8CS;			// Endpoint 8 Control and Status
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A7 volatile BYTE EP2FIFOFLGS;		// Endpoint 2 Flags
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A8 volatile BYTE EP4FIFOFLGS;		// Endpoint 4 Flags
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6A9 volatile BYTE EP6FIFOFLGS;		// Endpoint 6 Flags
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AA volatile BYTE EP8FIFOFLGS;		// Endpoint 8 Flags
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AB volatile BYTE EP2FIFOBCH;		// EP2 FIFO total byte count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AC volatile BYTE EP2FIFOBCL;		// EP2 FIFO total byte count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AD volatile BYTE EP4FIFOBCH;		// EP4 FIFO total byte count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AE volatile BYTE EP4FIFOBCL;		// EP4 FIFO total byte count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6AF volatile BYTE EP6FIFOBCH;		// EP6 FIFO total byte count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B0 volatile BYTE EP6FIFOBCL;		// EP6 FIFO total byte count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B1 volatile BYTE EP8FIFOBCH;		// EP8 FIFO total byte count H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B2 volatile BYTE EP8FIFOBCL;		// EP8 FIFO total byte count L
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B3 volatile BYTE SUDPTRH;			// Setup Data Pointer high address byte
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B4 volatile BYTE SUDPTRL;			// Setup Data Pointer low address byte
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B5 volatile BYTE SUDPTRCTL;		// Setup Data Pointer Auto Mode
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B8 volatile BYTE SETUPDAT[8];		// 8 bytes of SETUP data
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B8 volatile BYTE bmRequestType;		// Request Type, Direction, and Recipient
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6B9 volatile BYTE bRequest;			// The actual request
#line 210 "../../../include/ezregs.h"
xdata at 0xE6BA volatile BYTE wValueL;
xdata at 0xE6BB volatile BYTE wValueH;
xdata at 0xE6BC volatile BYTE wIndexL;
xdata at 0xE6BD volatile BYTE wIndexH;
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6BE volatile BYTE wLengthL;			// Number of bytes to transfer if there is a data phase
#line 215 "../../../include/ezregs.h"
xdata at 0xE6BF volatile BYTE wLengthH;

#line 30 "../../../include/ztex-conf.h"
// GPIF
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C0 volatile BYTE GPIFWFSELECT;		// Waveform Selector
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C1 volatile BYTE GPIFIDLECS;		// GPIF Done, GPIF IDLE drive mode
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C2 volatile BYTE GPIFIDLECTL;		// Inactive Bus, CTL states
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C3 volatile BYTE GPIFCTLCFG;		// CTL OUT pin drive
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C4 volatile BYTE GPIFADRH;			// GPIF Address H
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C5 volatile BYTE GPIFADRL;			// GPIF Address L
#line 224 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// FLOWSTATE 
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C6 volatile BYTE FLOWSTATE;		// Flowstate Enable and Selector
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C7 volatile BYTE FLOWLOGIC;		// Flowstate Logic
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C8 volatile BYTE FLOWEQ0CTL;		// CTL-Pin States in Flowstate (when Logic = 0)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6C9 volatile BYTE FLOWEQ1CTL;		// CTL-Pin States in Flowstate (when Logic = 1)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CA volatile BYTE FLOWHOLDOFF;		// Holdoff Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CB volatile BYTE FLOWSTB;			// Flowstate Strobe Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CC volatile BYTE FLOWSTBEDGE;		// Flowstate Rising/Falling Edge Configuration
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CD volatile BYTE FLOWSTBHPERIOD;		// Master-Strobe Half-Period
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CE volatile BYTE GPIFTCB3;			// GPIF Transaction Count Byte 3
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6CF volatile BYTE GPIFTCB2;			// GPIF Transaction Count Byte 2
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6D0 volatile BYTE GPIFTCB1;			// GPIF Transaction Count Byte 1
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6D1 volatile BYTE GPIFTCB0;			// GPIF Transaction Count Byte 0
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6D2 volatile BYTE EP2GPIFFLGSEL;		// EP2 GPIF Flag select
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6D3 volatile BYTE EP2GPIFPFSTOP;		// Stop GPIF EP2 transaction on prog. flag
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6D4 volatile BYTE EP2GPIFTRIG;		// EP2 FIFO Trigger
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6DA volatile BYTE EP4GPIFFLGSEL;		// EP4 GPIF Flag select
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6DB volatile BYTE EP4GPIFPFSTOP;		// Stop GPIF EP4 transaction on prog. flag
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6DC volatile BYTE EP4GPIFTRIG;		// EP4 FIFO Trigger
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6E2 volatile BYTE EP6GPIFFLGSEL;		// EP6 GPIF Flag select
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6E3 volatile BYTE EP6GPIFPFSTOP;		// Stop GPIF EP6 transaction on prog. flag
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6E4 volatile BYTE EP6GPIFTRIG;		// EP6 FIFO Trigger
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6EA volatile BYTE EP8GPIFFLGSEL;		// EP8 GPIF Flag select
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6EB volatile BYTE EP8GPIFPFSTOP;		// Stop GPIF EP8 transaction on prog. flag
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6EC volatile BYTE EP8GPIFTRIG;		// EP8 FIFO Trigger
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F0 volatile BYTE XGPIFSGLDATH;		// GPIF Data H (16-bit mode only)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F1 volatile BYTE XGPIFSGLDATLX;		// Read/Write GPIF Data L & trigger transac
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F2 volatile BYTE XGPIFSGLDATLNOX;		// Read GPIF Data L, no transac trigger
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F3 volatile BYTE GPIFREADYCFG;		// Internal RDY,Sync/Async, RDY5CFG
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F4 volatile BYTE GPIFREADYSTAT;		// RDY pin states
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE6F5 volatile BYTE GPIFABORT;		// Abort GPIF cycles
#line 256 "../../../include/ezregs.h"

#line 30 "../../../include/ztex-conf.h"
// Endpoint Buffers
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE740 volatile BYTE EP0BUF[64];		// EP0 IN-OUT buffer
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE780 volatile BYTE EP1OUTBUF[64];		// EP1-OUT buffer
#line 30 "../../../include/ztex-conf.h"
xdata at 0xE7C0 volatile BYTE EP1INBUF[64];		// EP1-IN buffer
#line 30 "../../../include/ztex-conf.h"
xdata at 0xF000 volatile BYTE EP2FIFOBUF[1024];		// 512/1024-byte EP2 buffer (IN or OUT)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xF400 volatile BYTE EP4FIFOBUF[1024];		// 512 byte EP4 buffer (IN or OUT)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xF800 volatile BYTE EP6FIFOBUF[1024];		// 512/1024-byte EP6 buffer (IN or OUT)
#line 30 "../../../include/ztex-conf.h"
xdata at 0xFC00 volatile BYTE EP8FIFOBUF[1024];		// 512 byte EP8 buffer (IN or OUT)
#line 265 "../../../include/ezregs.h"


#line 30 "../../../include/ztex-conf.h"
// Special Function Registers (SFRs)
#line 30 "../../../include/ztex-conf.h"
sfr at 0x80 IOA;					// Port A
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+0 IOA0;					// Port A bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+1 IOA1;					// Port A bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+2 IOA2;					// Port A bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+3 IOA3;					// Port A bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+4 IOA4;					// Port A bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+5 IOA5;					// Port A bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+6 IOA6;					// Port A bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0x80+7 IOA7;					// Port A bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0x81 SP;						// Stack Pointer
#line 30 "../../../include/ztex-conf.h"
sfr at 0x82 DPL0;					// Data Pointer 0 L
#line 30 "../../../include/ztex-conf.h"
sfr at 0x83 DPH0;					// Data Pointer 0 H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x84 DPL1;					// Data Pointer 1 L
#line 30 "../../../include/ztex-conf.h"
sfr at 0x85 DPH1;					// Data Pointer 0 H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x86 DPS;					// Data Pointer 0/1 select
#line 30 "../../../include/ztex-conf.h"
sfr at 0x87 PCON;					// Power Control
#line 30 "../../../include/ztex-conf.h"
sfr at 0x88 TCON;					// Timer/Counter Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+0 IT0;					// Interrupt 0 Type select
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+1 IE0;					// Interrupt 0 Edge detect
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+2 IT1;					// Interrupt 1 Type select
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+3 IE1;					// Interrupt 1 Edge detect
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+4 TR0;					// Timer 0 Run Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+5 TF0;					// Timer 0 Overflow Flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+6 TR1;					// Timer 1 Run Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0x88+7 TF1;					// Timer 1 Overflow Flag
#line 30 "../../../include/ztex-conf.h"
sfr at 0x89 TMOD;					// Timer/Counter Mode Control
#line 30 "../../../include/ztex-conf.h"
sfr at 0x8A TL0;					// Timer 0 reload L
#line 30 "../../../include/ztex-conf.h"
sfr at 0x8B TL1;					// Timer 1 reload L
#line 30 "../../../include/ztex-conf.h"
sfr at 0x8C TH0;					// Timer 0 reload H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x8D TH1;					// Timer 1 reload H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x8E CKCON;					// Clock Control
#line 30 "../../../include/ztex-conf.h"
sfr at 0x90 IOB; 					// Port B
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+0 IOB0;					// Port B bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+1 IOB1;					// Port B bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+2 IOB2;					// Port B bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+3 IOB3;					// Port B bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+4 IOB4;					// Port B bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+5 IOB5;					// Port B bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+6 IOB6;					// Port B bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0x90+7 IOB7;					// Port B bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0x91 EXIF;					// External Interrupt Flag(s)
#line 30 "../../../include/ztex-conf.h"
sfr at 0x92 MPAGE;					// Upper Addr Byte of MOVX using @R0 / @R1
#line 310 "../../../include/ezregs.h"
__sfr __at (0x92) _XPAGE;
#line 30 "../../../include/ztex-conf.h"
sfr at 0x98 SCON0;					// Serial Port 0 Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+0 RI_0;					// Recive Interrupt Flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+1 TI_0;					// Transmit Interrupt Flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+2 RB8_0;					// State of the 9th bit / Stop Bit received
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+3 TB8_0;					// State of the 9th bit transmitted
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+4 REN_0;					// Receive enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+5 SM2_0;					// Multiprocessor communication enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+6 SM1_0;					// Serial Port 0 mode bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0x98+7 SM0_0;					// Serial Port 0 mode bit 0
#line 30 "../../../include/ztex-conf.h"
sfr at 0x99 SBUF0;					// Serial Port 0 Data Buffer
#line 30 "../../../include/ztex-conf.h"
sfr at 0x9A AUTOPTRH1;					// Autopointer 1 Address H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x9B AUTOPTRL1;					// Autopointer 1 Address L
#line 30 "../../../include/ztex-conf.h"
sfr at 0x9D AUTOPTRH2;					// Autopointer 2 Address H
#line 30 "../../../include/ztex-conf.h"
sfr at 0x9E AUTOPTRL2; 					// Autopointer 2 Address L
#line 30 "../../../include/ztex-conf.h"
sfr at 0xA0 IOC; 					// Port C
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+0 IOC0;					// Port C bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+1 IOC1;					// Port C bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+2 IOC2;					// Port C bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+3 IOC3;					// Port C bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+4 IOC4;					// Port C bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+5 IOC5;					// Port C bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+6 IOC6;					// Port C bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA0+7 IOC7;					// Port C bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0xA1 INT2CLR;					// Interrupt 2 clear
#line 30 "../../../include/ztex-conf.h"
sfr at 0xA2 INT4CLR;					// Interrupt 4clear
#line 30 "../../../include/ztex-conf.h"
sfr at 0xA8 IE;						// Interrupt Enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+0 EX0;					// Enable external interrupt 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+1 ET0;					// Enable Timer 0 interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+2 EX1;					// Enable external interrupt 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+3 ET1;					// Enable Timer 1 interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+4 ES0;					// Enable Serial Port 0 interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+5 ET2;					// Enable Timer 2 interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+6 ES1;					// Enable Serial Port 1 interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xA8+7 EA;					// Global interrupt enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xAA EP2468STAT;					// Endpoint 2,4,6,8 status flags
#line 30 "../../../include/ztex-conf.h"
sfr at 0xAB EP24FIFOFLGS;				// Endpoint 2,4 slave FIFO flags
#line 30 "../../../include/ztex-conf.h"
sfr at 0xAC EP68FIFOFLGS;				// Endpoint 6,8 slave FIFO flags
#line 30 "../../../include/ztex-conf.h"
sfr at 0xAF AUTOPTRSETUP;				// Autopointer 1&2 set-up
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB0 IOD; 					// Port D
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+0 IOD0;					// Port D bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+1 IOD1;					// Port D bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+2 IOD2;					// Port D bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+3 IOD3;					// Port D bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+4 IOD4;					// Port D bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+5 IOD5;					// Port D bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+6 IOD6;					// Port D bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB0+7 IOD7;					// Port D bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB1 IOE;					// Port E
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB2 OEA;					// Port A Output Enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB3 OEB;					// Port B Output Enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB4 OEC;					// Port C Output Enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB5 OED;					// Port D Output Enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB6 OEE;					// Port E Output Enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xB8 IP;						// Interrupt priority
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+0 PX0;					// External interrupt 0 priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+1 PT0;					// Timer 0 interrupt priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+2 PX1;					// External interrupt 1 priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+3 PT1;					// Timer 1 interrupt priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+4 PS0;					// Serial Port 0 interrupt priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+5 PT2;					// Timer 2 interrupt priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xB8+6 PS1;					// Serial Port 1 interrupt priority control
#line 30 "../../../include/ztex-conf.h"
sfr at 0xBA EP01STAT;					// Endpoint 0&1 Status
#line 30 "../../../include/ztex-conf.h"
sfr at 0xBB GPIFTRIG;					// Endpoint 2,4,6,8 GPIF slafe FIFO Trigger
#line 30 "../../../include/ztex-conf.h"
sfr at 0xBD GPIFSGLDATH;				// GPIF Data H (16-bit mode only)
#line 30 "../../../include/ztex-conf.h"
sfr at 0xBE GPIFSGLDATLX;				// GPIF Data L w/ Trigger
#line 30 "../../../include/ztex-conf.h"
sfr at 0xBF GPIFSGLDATLNOX;				// GPIF Data L w/ No Trigger
#line 30 "../../../include/ztex-conf.h"
sfr at 0xC0 SCON1;					// Serial Port 1 Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+0 RI_1;					// Recive Interrupt Flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+1 TI_1;					// Transmit Interrupt Flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+2 RB8_1;					// State of the 9th bit / Stop Bit received
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+3 TB8_1;					// State of the 9th bit transmitted
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+4 REN_1;					// Receive enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+5 SM2_1;					// Multiprocessor communication enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+6 SM1_1;					// Serial Port 1 mode bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC0+7 SM0_1;					// Serial Port 1 mode bit 0
#line 30 "../../../include/ztex-conf.h"
sfr at 0xC1 SBUF1;					// Serial Port 1 Data Buffer
#line 30 "../../../include/ztex-conf.h"
sfr at 0xC8 T2CON;					// Timer/Counter 2 Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+0 CPRL2;					// Capture/reload flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+1 CT2;					// Counter/Timer select
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+2 TR2;					// Timer 2 run control flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+3 EXEN2;					// Timer 2 external enable
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+4 TCLK;					// Transmit clock flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+5 RCLK;					// Receive clock flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+6 EXF2;					// Timer 2 external flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xC8+7 TF2;					// Timer 2 overflow flag
#line 30 "../../../include/ztex-conf.h"
sfr at 0xCA RCAP2L;					// Capture for Timer 2, auto-reload, up-counter L
#line 30 "../../../include/ztex-conf.h"
sfr at 0xCB RCAP2H;					// Capture for Timer 2, auto-reload, up-counter H
#line 30 "../../../include/ztex-conf.h"
sfr at 0xCC TL2;					// Timer 2 reload L
#line 30 "../../../include/ztex-conf.h"
sfr at 0xCD TH2;					// Timer 2 reload H
#line 30 "../../../include/ztex-conf.h"
sfr at 0xD0 PSW;					// Program Status Word
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+0 PF;					// Parity flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+1 F1;					// User flag 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+2 OV;					// Overflow flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+3 RS0;					// Register bank select bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+4 RS1;					// Register bank select bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+5 F0;					// User flag 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+6 AC;					// Auxiliary carry flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD0+7 CY;					// Carry flag
#line 30 "../../../include/ztex-conf.h"
sfr at 0xD8 EICON;					// External Interrupt Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD8+3 INT6;					// External interrupt 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD8+4 RESI;					// Wakeup interrupt flag
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD8+5 ERESI;					// Enable Resume interrupt
#line 30 "../../../include/ztex-conf.h"
sbit at 0xD8+7 SMOD1;					// Serial Port 1 baud rate doubler enable
#line 30 "../../../include/ztex-conf.h"
sfr at 0xE0 ACC;					// Accumulator
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+0 ACC0;					// Accumulator bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+1 ACC1;					// Accumulator bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+2 ACC2;					// Accumulator bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+3 ACC3;					// Accumulator bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+4 ACC4;					// Accumulator bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+5 ACC5;					// Accumulator bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+6 ACC6;					// Accumulator bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE0+7 ACC7;					// Accumulator bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0xE8 EIE; 					// External Interrupt Enable(s)
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE8+0 EUSB;					// Enable USB interrupt (USBINT)
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE8+1 EI2C;					// Enable I2C bus interrupt (I2CINT)
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE8+2 EIEX4;					// Enable external interrupt 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE8+3 EIEX5;					// Enable external interrupt 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0xE8+4 EIEX6;					// Enable external interrupt 6
#line 30 "../../../include/ztex-conf.h"
sfr at 0xF0 BREG;					// B Register
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+0 BREG0;					// B Register bit 0
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+1 BREG1;					// B Register bit 1
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+2 BREG2;					// B Register bit 2
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+3 BREG3;					// B Register bit 3
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+4 BREG4;					// B Register bit 4
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+5 BREG5;					// B Register bit 5
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+6 BREG6;					// B Register bit 6
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF0+7 BREG7;					// B Register bit 7
#line 30 "../../../include/ztex-conf.h"
sfr at 0xF8 EIP;					// External Interrupt Priority Control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF8+0 PUSB;					// USBINT priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF8+1 PI2C;					// I2CINT priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF8+2 EIPX4;					// External interrupt 4 priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF8+3 EIPX5;					// External interrupt 5 priority control
#line 30 "../../../include/ztex-conf.h"
sbit at 0xF8+4 EIPX6;					// External interrupt 6 priority control
#line 444 "../../../include/ezregs.h"

#line 49 "../../../include/ztex-utils.h"

#line 1 "../../../include/ezintavecs.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   EZ-USB Autovectors
*/

#line 25 "../../../include/ezintavecs.h"

#line 1 "../../../include/ztex-utils.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Various utility routines
*/

#line 26 "../../../include/ezintavecs.h"


struct INTVEC {
    BYTE op;
    BYTE addrH;
    BYTE addrL;
};

#line 87 "../../../include/ezintavecs.h"

#line 34 "../../../include/ezintavecs.h"
xdata at 0x0003 struct INTVEC INT0VEC_IE0;
xdata at 0x000b struct INTVEC INT1VEC_T0;
xdata at 0x0013 struct INTVEC INT2VEC_IE1;
xdata at 0x001b struct INTVEC INT3VEC_T1;
xdata at 0x0023 struct INTVEC INT4VEC_USART0;
xdata at 0x002b struct INTVEC INT5VEC_T2;
xdata at 0x0033 struct INTVEC INT6VEC_RESUME;
xdata at 0x003b struct INTVEC INT7VEC_USART1;
xdata at 0x0043 struct INTVEC INT8VEC_USB;
xdata at 0x004b struct INTVEC INT9VEC_I2C;
xdata at 0x0053 struct INTVEC INT10VEC_GPIF;
xdata at 0x005b struct INTVEC INT11VEC_IE5;
xdata at 0x0063 struct INTVEC INT12VEC_IE6;
xdata at 0x0100 struct INTVEC INTVEC_SUDAV;
xdata at 0x0104 struct INTVEC INTVEC_SOF;
xdata at 0x0108 struct INTVEC INTVEC_SUTOK;
xdata at 0x010C struct INTVEC INTVEC_SUSPEND;
xdata at 0x0110 struct INTVEC INTVEC_USBRESET;
xdata at 0x0114 struct INTVEC INTVEC_HISPEED;
xdata at 0x0118 struct INTVEC INTVEC_EP0ACK;
xdata at 0x0120 struct INTVEC INTVEC_EP0IN;
xdata at 0x0124 struct INTVEC INTVEC_EP0OUT;
xdata at 0x0128 struct INTVEC INTVEC_EP1IN;
xdata at 0x012C struct INTVEC INTVEC_EP1OUT;
xdata at 0x0130 struct INTVEC INTVEC_EP2;
xdata at 0x0134 struct INTVEC INTVEC_EP4;
xdata at 0x0138 struct INTVEC INTVEC_EP6;
xdata at 0x013C struct INTVEC INTVEC_EP8;
xdata at 0x0140 struct INTVEC INTVEC_IBN;
xdata at 0x0148 struct INTVEC INTVEC_EP0PING;
xdata at 0x014C struct INTVEC INTVEC_EP1PING;
xdata at 0x0150 struct INTVEC INTVEC_EP2PING;
xdata at 0x0154 struct INTVEC INTVEC_EP4PING;
xdata at 0x0158 struct INTVEC INTVEC_EP6PING;
xdata at 0x015C struct INTVEC INTVEC_EP8PING;
xdata at 0x0160 struct INTVEC INTVEC_ERRLIMIT;
xdata at 0x0170 struct INTVEC INTVEC_EP2ISOERR;
xdata at 0x0174 struct INTVEC INTVEC_EP4ISOERR;
xdata at 0x0178 struct INTVEC INTVEC_EP6ISOERR;
xdata at 0x017C struct INTVEC INTVEC_EP8ISOERR;
xdata at 0x0180 struct INTVEC INTVEC_EP2PF;
xdata at 0x0184 struct INTVEC INTVEC_EP4PF;
xdata at 0x0188 struct INTVEC INTVEC_EP6PF;
xdata at 0x018C struct INTVEC INTVEC_EP8PF;
xdata at 0x0190 struct INTVEC INTVEC_EP2EF;
xdata at 0x0194 struct INTVEC INTVEC_EP4EF;
xdata at 0x0198 struct INTVEC INTVEC_EP6EF;
xdata at 0x019C struct INTVEC INTVEC_EP8EF;
xdata at 0x01A0 struct INTVEC INTVEC_EP2FF;
xdata at 0x01A8 struct INTVEC INTVEC_EP6FF;
xdata at 0x01AC struct INTVEC INTVEC_EP8FF;
xdata at 0x01B0 struct INTVEC INTVEC_GPIFDONE;
#line 89 "../../../include/ezintavecs.h"
xdata at 0x01B4 struct INTVEC INTVEC_GPIFWF;
#line 91 "../../../include/ezintavecs.h"

void abscode_intvec() _naked
{
#line 96 "../../../include/ezintavecs.h"
    _asm
    .area ABSCODE (ABS,CODE)
    .org 0x0000
ENTRY:
	ljmp #0x0200
#line 94 "../../../include/ezintavecs.h"
    .org 0x0003
#line 34 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x000b
#line 35 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0013
#line 36 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x001b
#line 37 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0023
#line 38 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x002b
#line 39 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0033
#line 40 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x003b
#line 41 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0043
#line 42 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x004b
#line 43 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0053
#line 44 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x005b
#line 45 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0063
#line 46 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0100
#line 47 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0104
#line 48 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0108
#line 49 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x010C
#line 50 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0110
#line 51 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0114
#line 52 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0118
#line 53 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0120
#line 54 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0124
#line 55 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0128
#line 56 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x012C
#line 57 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0130
#line 58 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0134
#line 59 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0138
#line 60 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x013C
#line 61 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0140
#line 62 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0148
#line 63 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x014C
#line 64 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0150
#line 65 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0154
#line 66 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0158
#line 67 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x015C
#line 68 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0160
#line 69 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0170
#line 70 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0174
#line 71 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0178
#line 72 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x017C
#line 73 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0180
#line 74 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0184
#line 75 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0188
#line 76 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x018C
#line 77 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0190
#line 78 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0194
#line 79 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x0198
#line 80 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x019C
#line 81 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x01A0
#line 82 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x01A8
#line 83 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x01AC
#line 84 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x01B0
#line 85 "../../../include/ezintavecs.h"
	reti
#line 94 "../../../include/ezintavecs.h"
    .org 0x01B4
#line 101 "../../../include/ezintavecs.h"
	reti
    .org 0x01b8
INTVEC_DUMMY:
        reti
    .area CSEG    (CODE)
    _endasm;    
}    

#line 111 "../../../include/ezintavecs.h"


/* Init an interrupt vector */
#line 119 "../../../include/ezintavecs.h"


/* Enable USB autovectors */
#line 128 "../../../include/ezintavecs.h"


/* Disable USB autovectors */
#line 132 "../../../include/ezintavecs.h"


/* Enable GPIF autovectors */
#line 141 "../../../include/ezintavecs.h"


/* Disable GPIF autovectors */
#line 145 "../../../include/ezintavecs.h"


#line 50 "../../../include/ztex-utils.h"

/* *********************************************************************
   ***** global variables **********************************************
   ********************************************************************* */
/* 
    The following two variables are used to control HSNAK bit.
    
    ep0_payload_remaining is set to the length field of of the Setup Data
    structure (in SUDAV_ISR). At the begin of each payload data transfer (in 
    SUDAV_ISR, EP0IN_ISR and EP0OUT_ISR) the amount of payload of the current
    transfer s calculated (<=64 bytes) and subtracted from 
    ep0_payload_remaining. For Vendor Commands HSNAK bit is cleared
    automatically (at the end of EP0OUT_ISR) ifep0_payload_remaining == 0.
    For Vendor Requests HSNAK bit is always cleared at the end of SUDAV_ISR.
*/

#line 30 "../../../include/ztex-conf.h"
xdata WORD ep0_payload_remaining = 0;		// remaining amount of ep0 payload data (excluding the data of the current transfer)
#line 30 "../../../include/ztex-conf.h"
xdata BYTE ep0_payload_transfer = 0;		// transfer
#line 68 "../../../include/ztex-utils.h"

/* *********************************************************************
   *********************************************************************
   ***** basic functions ***********************************************
   ********************************************************************* 
   ********************************************************************* */

/* *********************************************************************
   ***** wait **********************************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
void wait(WORD short ms) {	  // wait in ms 
#line 79 "../../../include/ztex-utils.h"
    WORD i,j;
    for (j=0; j<ms; j++) 
	for (i=0; i<1200; i++);
}


/* *********************************************************************
   ***** uwait *********************************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
void uwait(WORD short us) {	  // wait in 10µs steps
#line 89 "../../../include/ztex-utils.h"
    WORD i,j;
    for (j=0; j<us; j++) 
	for (i=0; i<10; i++);
}


/* *********************************************************************
   ***** MEM_COPY ******************************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
// copies 1..256 bytes 
#line 99 "../../../include/ztex-utils.h"
void MEM_COPY1_int() __naked {
	_asm
020001$:
	    mov		_AUTOPTRSETUP,#0x07
	    mov		dptr,#_XAUTODAT1
	    movx	a,@dptr
	    mov		dptr,#_XAUTODAT2
	    movx	@dptr,a
	    djnz	r2, 020001$
	    ret
	_endasm;
}

/* 
    ! no spaces before/after commas allowed !
    
    This will work too: 
	MEM_COPY1(fpga_checksum,EP0BUF+1,6);    
*/	

#line 131 "../../../include/ztex-utils.h"


#line 30 "../../../include/ztex-conf.h"
	// include basic functions
#line 22 "debug.c"

#line 30 "../../../include/ztex-conf.h"
// thin initializes the debug helper with a 32 messages stack and 4 bytes per message
#line 25 "debug.c"

#line 30 "../../../include/ztex-conf.h"
// this product string is also used for identification by the host software
#line 28 "debug.c"

#line 30 "../../../include/ztex-conf.h"
// include the main part of the firmware kit, define the descriptors, ...
#line 1 "../../../include/ztex.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Puts everything together.
*/

#line 25 "../../../include/ztex.h"

#line 27 "../../../include/ztex.h"

/* *********************************************************************
   ***** include the basic functions ***********************************
   ********************************************************************* */
#line 1 "../../../include/ztex-utils.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Various utility routines
*/

#line 31 "../../../include/ztex.h"


/* *********************************************************************
   ***** EEPROM support and some I2C helper functions ******************
   ********************************************************************* */
#line 1 "../../../include/ztex-eeprom.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/*
    EEPROM support an some I2C helper routines
*/    

#line 25 "../../../include/ztex-eeprom.h"

#line 28 "../../../include/ztex-eeprom.h"

/* *********************************************************************
   ***** global variables **********************************************
   ********************************************************************* */
xdata WORD eeprom_addr;
xdata WORD eeprom_write_bytes;
xdata BYTE eeprom_write_checksum;


/* *********************************************************************
   ***** i2c_waitWrite *************************************************
   ********************************************************************* */
/* Do the necessary steps after writing I2DAT register. Returns 1 on error. */
BYTE i2c_waitWrite()
{
    unsigned char i2csbuf,toc;
    for ( toc=0; toc<255 && !(I2CS & 1); toc++ );
    i2csbuf = I2CS;
    if ( (i2csbuf & 4) || (!(i2csbuf & 2)) ) {
        I2CS |= 64;
	return 1;
    }
    return 0;
}

/* *********************************************************************
   ***** i2c_waitRead **************************************************
   ********************************************************************* */
/* Do the necessary steps after reading I2DAT register. Returns 1 on error. */
BYTE i2c_waitRead(void)
{
    unsigned char i2csbuf, toc;
    for ( toc=0; toc<255 && !(I2CS & 1); toc++ );
    i2csbuf = I2CS;
    if (i2csbuf & 4) {
        I2CS |= 64;
	return 1;
    }
    return 0;
}

/* *********************************************************************
   ***** i2c_waitStart *************************************************
   ********************************************************************* */
/* Do the necessary steps after start bit. Returns 1 on error. */
BYTE i2c_waitStart()
{
    BYTE toc;
    for ( toc=0; toc<255; toc++ ) {
	if ( ! (I2CS & 4) )
	    return 0;
    }
    return 1;
}

/* *********************************************************************
   ***** i2c_waitStop **************************************************
   ********************************************************************* */
/* Do the necessary steps after stop bit. Returns 1 on error. */
BYTE i2c_waitStop()
{
    BYTE toc;
    for ( toc=0; toc<255; toc++ ) {
	if ( ! (I2CS & 64) )
	    return 0;
    }
    return 1;
}

/* *********************************************************************
   ***** eeprom_select *************************************************
   ********************************************************************* */
/* Select the EEPROM device, i.e. send the control Byte. 
   <to> specifies the time to wait in 0.1ms steps if the EEPROM is busy (during a write cycle).
   if <stop>=0 no sop bit is sent. Returns 1 on error or if EEPROM is busy. */
BYTE eeprom_select ( BYTE to, BYTE stop ) {
    BYTE toc = 0;
eeprom_select_start:
#line 30 "../../../include/ztex-conf.h"
    I2CS |= 128;		// start bit
#line 107 "../../../include/ztex-eeprom.h"
    i2c_waitStart();
#line 30 "../../../include/ztex-conf.h"
    I2DAT = 0xA2;	// select device for writing
#line 109 "../../../include/ztex-eeprom.h"
    if ( ! i2c_waitWrite() ) {
        if ( stop ) {
            I2CS |= 64;
	    i2c_waitStop();
    	}
	return 0;
    }
    else if (toc<to) {
	uwait(10);
	goto eeprom_select_start;
    }
    if ( stop ) {
	I2CS |= 64;
    }
    return 1;
}

/* *********************************************************************
   ***** eeprom_read ***************************************************
   ********************************************************************* */
/* Reads <length> bytes from EEPROM address <addr> and write them to buf. 
   Returns the number of bytes read. This number is 0 during a write cycle. */
BYTE eeprom_read ( __xdata BYTE *buf, WORD addr, BYTE length ) { 
    BYTE bytes = 0,i;
    
    if ( length == 0 ) 
	return 0;
    
    if ( eeprom_select(100,0) ) 
	goto eeprom_read_end;
    
#line 30 "../../../include/ztex-conf.h"
    I2DAT = ((BYTE)((((unsigned short)(addr)) >> 8) & 0xff)) ;		// write address
#line 141 "../../../include/ztex-eeprom.h"
    if ( i2c_waitWrite() ) goto eeprom_read_end;
#line 30 "../../../include/ztex-conf.h"
    I2DAT = ((BYTE)(addr));		// write address
#line 143 "../../../include/ztex-eeprom.h"
    if ( i2c_waitWrite() ) goto eeprom_read_end;
    I2CS |= 64;
    i2c_waitStop();

#line 30 "../../../include/ztex-conf.h"
    I2CS |= 128;		// start bit
#line 148 "../../../include/ztex-eeprom.h"
    i2c_waitStart();
#line 30 "../../../include/ztex-conf.h"
    I2DAT = 0xA2 | 1;	// select device for reading
#line 150 "../../../include/ztex-eeprom.h"
    if ( i2c_waitWrite() ) goto eeprom_read_end;

#line 30 "../../../include/ztex-conf.h"
    *buf = I2DAT;		// dummy read
#line 153 "../../../include/ztex-eeprom.h"
    if ( i2c_waitRead()) goto eeprom_read_end; 
    for (; bytes<length; bytes++ ) {
#line 30 "../../../include/ztex-conf.h"
	*buf = I2DAT;		// read data
#line 156 "../../../include/ztex-eeprom.h"
	buf++;
	if ( i2c_waitRead()) goto eeprom_read_end; 
    }

#line 30 "../../../include/ztex-conf.h"
    I2CS |= 32;		// no ACK
#line 30 "../../../include/ztex-conf.h"
    i = I2DAT;			// dummy read
#line 162 "../../../include/ztex-eeprom.h"
    if ( i2c_waitRead()) goto eeprom_read_end; 

#line 30 "../../../include/ztex-conf.h"
    I2CS |= 64;		// stop bit
#line 30 "../../../include/ztex-conf.h"
    i = I2DAT;			// dummy read
#line 166 "../../../include/ztex-eeprom.h"
    i2c_waitStop();

eeprom_read_end:
    return bytes;
}

/* *********************************************************************
   ***** eeprom_write **************************************************
   ********************************************************************* */
/* Writes <length> bytes from buf to and write them EEPROM address <addr>.
   <length> must be smaller or equal than 64. Returns the number of bytes
   read. This number is 0 during a write cycle. */
BYTE eeprom_write ( __xdata BYTE *buf, WORD addr, BYTE length ) {
    BYTE bytes = 0;

    if ( eeprom_select(100,0) ) 
	goto eeprom_write_end;
    
#line 30 "../../../include/ztex-conf.h"
    I2DAT = ((BYTE)((((unsigned short)(addr)) >> 8) & 0xff)) ;          	// write address
#line 185 "../../../include/ztex-eeprom.h"
    if ( i2c_waitWrite() ) goto eeprom_write_end;
#line 30 "../../../include/ztex-conf.h"
    I2DAT = ((BYTE)(addr));          	// write address
#line 187 "../../../include/ztex-eeprom.h"
    if ( i2c_waitWrite() ) goto eeprom_write_end;
    
    for (; bytes<length; bytes++ ) {
#line 30 "../../../include/ztex-conf.h"
	I2DAT = *buf;         	// write data 
#line 191 "../../../include/ztex-eeprom.h"
	eeprom_write_checksum += *buf;
	buf++;
	eeprom_write_bytes+=1;
	if ( i2c_waitWrite() ) goto eeprom_write_end;
    }
#line 30 "../../../include/ztex-conf.h"
    I2CS |= 64;		// stop bit
#line 197 "../../../include/ztex-eeprom.h"
    i2c_waitStop();
	
eeprom_write_end:
    return bytes;
}

/* *********************************************************************
   ***** EP0 vendor request 0x38 ***************************************
   ********************************************************************* */
BYTE eeprom_read_ep0 () { 
    BYTE i, b;
    b = ep0_payload_transfer;
    i = eeprom_read(EP0BUF, eeprom_addr, b);
    eeprom_addr += b;
    return i;
}

#line 222 "../../../include/ztex-eeprom.h"


/* *********************************************************************
   ***** EP0 vendor command 0x39 ***************************************
   ********************************************************************* */
void eeprom_write_ep0 ( BYTE length ) { 	
    eeprom_write(EP0BUF, eeprom_addr, length);
    eeprom_addr += length;
}

#line 239 "../../../include/ztex-eeprom.h"

/* *********************************************************************
   ***** EP0 vendor request 0x3A ***************************************
   ********************************************************************* */
#line 251 "../../../include/ztex-eeprom.h"


#line 37 "../../../include/ztex.h"

#line 39 "../../../include/ztex.h"

/* *********************************************************************
   ***** Flash memory support ******************************************
   ********************************************************************* */
#line 92 "../../../include/ztex.h"

/* *********************************************************************
   ***** FPGA configuration support ************************************
   ********************************************************************* */
#line 107 "../../../include/ztex.h"

/* *********************************************************************
   ***** DEBUG helper functions ****************************************
   ********************************************************************* */
#line 1 "../../../include/ztex-debug.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/*
    debug helper
*/    
#line 24 "../../../include/ztex-debug.h"

#line 28 "../../../include/ztex-debug.h"

#line 32 "../../../include/ztex-debug.h"

#line 34 "../../../include/ztex-debug.h"

#line 30 "../../../include/ztex-conf.h"
xdata WORD debug_counter;				  // message number 
#line 30 "../../../include/ztex-conf.h"
xdata BYTE debug_stack_size;				  // stack size in messages
#line 30 "../../../include/ztex-conf.h"
xdata BYTE debug_msg_size;				  // message size in bytes
#line 30 "../../../include/ztex-conf.h"
xdata BYTE debug_stack[32*3];  // message stack
#line 30 "../../../include/ztex-conf.h"
xdata BYTE* xdata debug_stack_ptr;                        // pointer to the last message added
#line 40 "../../../include/ztex-debug.h"

#line 30 "../../../include/ztex-conf.h"
xdata BYTE debug_msg_buf[3];		  // user buffer: user should write data to this buffer
#line 42 "../../../include/ztex-debug.h"
xdata BYTE* xdata debug_read_addr;

/* *********************************************************************
   ***** debug_add_msg *************************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
// adds the current message (stored in debug_msg_buf) to the message stack
#line 48 "../../../include/ztex-debug.h"
void debug_add_msg () {
    BYTE i;
    i = debug_counter % 32;
    debug_stack_ptr = &debug_stack[i*3];
#line 119 "../../../include/ztex-utils.h"
    {
	AUTOPTRL1=((BYTE)(&(debug_msg_buf)));
	AUTOPTRH1=((BYTE)((((unsigned short)(&(debug_msg_buf)) >> 8) & 0xff)) );
	AUTOPTRL2=((BYTE)(&(*debug_stack_ptr)));
	AUTOPTRH2=((BYTE)((((unsigned short)(&(*debug_stack_ptr)) >> 8) & 0xff)) );
        _asm
		push	ar2
  		mov	r2,#(3);
		lcall 	_MEM_COPY1_int
		pop	ar2
        _endasm; 
#line 52 "../../../include/ztex-debug.h"
}
    debug_counter += 1;
}

/* *********************************************************************
   ***** debug_add_msg *************************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
// init the variables
#line 60 "../../../include/ztex-debug.h"
void debug_init () {
#line 30 "../../../include/ztex-conf.h"
    debug_counter = 0;				  // message number 
#line 62 "../../../include/ztex-debug.h"
    debug_stack_size = 32;
    debug_msg_size = 3;
    debug_stack_ptr = debug_stack;
}

/* *********************************************************************
   ***** EP0 vendor request 0x28 ***************************************
   ********************************************************************* */
#line 30 "../../../include/ztex-conf.h"
// read the debug data
#line 71 "../../../include/ztex-debug.h"
BYTE debug_read_ep0 () { 
    BYTE b;
    b = ep0_payload_transfer;
    if ( b != 0) {
#line 119 "../../../include/ztex-utils.h"
	{
	AUTOPTRL1=((BYTE)(&(*debug_read_addr)));
	AUTOPTRH1=((BYTE)((((unsigned short)(&(*debug_read_addr)) >> 8) & 0xff)) );
	AUTOPTRL2=((BYTE)(&(EP0BUF)));
	AUTOPTRH2=((BYTE)((((unsigned short)(&(EP0BUF)) >> 8) & 0xff)) );
        _asm
		push	ar2
  		mov	r2,#(b);
		lcall 	_MEM_COPY1_int
		pop	ar2
        _endasm; 
#line 75 "../../../include/ztex-debug.h"
}
    }
    debug_read_addr += b;
    return b;
}

#line 89 "../../../include/ztex-debug.h"

#line 112 "../../../include/ztex.h"

#line 114 "../../../include/ztex.h"


/* *********************************************************************
   ***** define the descriptors and the interrupt routines *************
   ********************************************************************* */
#line 1 "../../../include/ztex-descriptors.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Defines the USB descriptors
*/

#line 25 "../../../include/ztex-descriptors.h"

#line 28 "../../../include/ztex-descriptors.h"

xdata at 0x06c BYTE ZTEX_DESCRIPTOR;

/* ZTEX descriptor version. Must be 1. */
xdata at 0x06c+1 BYTE ZTEX_DESCRIPTOR_VERSION;

/* Must not be modified, ID="ZTEX" */
xdata at 0x06c+2 BYTE ZTEXID[4];  

/* 
   Product ID and firmware compatibility information. 
   
   A firmware can overwrite an installed one if
   if ( INSTALLED.PRODUCTID[0]==0 || PRODUCTID[0]==0 || INSTALLED.PRODUCTID[0]==PRODUCTID[0] ) &&
      ( INSTALLED.PRODUCTID[1]==0 || PRODUCTID[1]==0 || INSTALLED.PRODUCTID[1]==PRODUCTID[1] ) &&
      ( INSTALLED.PRODUCTID[2]==0 || PRODUCTID[2]==0 || INSTALLED.PRODUCTID[2]==PRODUCTID[2] ) &&
      ( INSTALLED.PRODUCTID[3]==0 || PRODUCTID[3]==0 || INSTALLED.PRODUCTID[3]==PRODUCTID[3] ) 

   Reserved Product ID's:
   
   0.0.0.0		// default Product ID (no product specified)
   1.*.*.*   		// may be used for experimental purposes
   10.*.*.*		// used for ZTEX products
   10.11.*.*		// ZTEX USB-FPGA-Module 1.2
   10.12.*.*		// ZTEX USB-FPGA-Module 1.10
   10.20.*.*		// ZTEX USB-Module 1.0
   
   Please contact me (http://www.ztex.de --> Impressum/Kontakt) if you want to register/reserve a Product ID (range).
*/
xdata at 0x06c+6 BYTE PRODUCT_ID[4];  

/* Firmware version, may be used to distinguish seveveral firmware versions */
xdata at 0x06c+10 BYTE FW_VERSION;  

/* Interface version. Must be 1. */
xdata at 0x06c+11 BYTE INTERFACE_VERSION;

/* 
    Standard interface capabilities:
	0.0  : EEPROM read/write, see ztex-eeprom.h
	0.1  : FPGA configuration, see ztex-fpga.h
	0.2  : Flash memeory support, see ztex-flash1.h
	0.3  : Debug helper, see ztex-debug.h
*/
xdata at 0x06c+12 BYTE INTERFACE_CAPABILITIES[6];

/* Space for settings which depends on PRODUCT_ID, e.g extra capabilities */
xdata at 0x06c+18 BYTE MODULE_RESERVED[12];

/* 
   Serial number string 
   default: "0000000000"
   Should only be modified by the the firmware upload software 
*/
xdata at 0x06c+30 BYTE SN_STRING[10];

/* Are Vendor ID and Product ID defined? */
#line 88 "../../../include/ztex-descriptors.h"

#line 92 "../../../include/ztex-descriptors.h"

/* Prepare the Interfaces, i.e. check which interfaces are defined */
#line 109 "../../../include/ztex-descriptors.h"

#line 94 "../../../include/ztex-descriptors.h"

#line 30 "../../../include/ztex-conf.h"
//Interface 0: YES
#line 94 "../../../include/ztex-descriptors.h"

#line 30 "../../../include/ztex-conf.h"
//Interface 1: NO
#line 94 "../../../include/ztex-descriptors.h"

#line 30 "../../../include/ztex-conf.h"
//Interface 2: NO
#line 94 "../../../include/ztex-descriptors.h"

#line 30 "../../../include/ztex-conf.h"
//Interface 3: NO
#line 114 "../../../include/ztex-descriptors.h"

/* define the ZTEX descriptor */
void abscode_identity() _naked
{
    _asm	
    .area ABSCODE (ABS,CODE)

    .org 0x06c
    .db 40

    .org _ZTEX_DESCRIPTOR_VERSION
    .db 1

    .org _ZTEXID
    .ascii "ZTEX"

    .org _PRODUCT_ID
    .db 0
    .db 0
    .db 0
    .db 0

    .org _FW_VERSION
    .db 0

    .org _INTERFACE_VERSION
    .db 1

    .org _INTERFACE_CAPABILITIES
#line 158 "../../../include/ztex-descriptors.h"
    .db 0 + 1 + 8
#line 160 "../../../include/ztex-descriptors.h"
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0

    .org _MODULE_RESERVED
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0
    .db 0

    .org _SN_STRING
    .ascii "0000000000"

    .area CSEG    (CODE)
    _endasm;
}    

/* *********************************************************************
   ***** strings *******************************************************
   ********************************************************************* */
code char manufacturerString[] = "ZTEX";
code char productString[] = "debug for EZ-USB devices";
code char configurationString[] = "(unknown)";


/* *********************************************************************
   ***** descriptors ***************************************************
   ********************************************************************* */
#line 240 "../../../include/ztex-descriptors.h"
   
#line 304 "../../../include/ztex-descriptors.h"

#line 306 "../../../include/ztex-descriptors.h"

#line 308 "../../../include/ztex-descriptors.h"
code BYTE PadByte = 0;
#line 310 "../../../include/ztex-descriptors.h"

code BYTE DeviceDescriptor[] = 
    {
#line 30 "../../../include/ztex-conf.h"
	18, 	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	0x01,	// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	0x00,	// 2, Specification Version (L)
#line 30 "../../../include/ztex-conf.h"
	0x02,	// 3, Specification Version (H)
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 4, Device class
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 5, Device sub-class
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 6, Device protocol
#line 30 "../../../include/ztex-conf.h"
	64,	// 7, Maximum packet size for EP0
#line 30 "../../../include/ztex-conf.h"
	(0x221a) & 255,	// 8, VENDOR_ID (L)
#line 30 "../../../include/ztex-conf.h"
	(0x221a) >> 8,	// 9, VENDOR_ID (H)
#line 30 "../../../include/ztex-conf.h"
	(0x100) & 255,	// 10, PRODUCT_ID (L)
#line 30 "../../../include/ztex-conf.h"
	(0x100) >> 8,	// 11, PRODUCT_ID (H)
#line 30 "../../../include/ztex-conf.h"
	0x00,   // 12, device release number (BCD, L)
#line 30 "../../../include/ztex-conf.h"
	0x00,   // 13, device release number (BCD, H)
#line 30 "../../../include/ztex-conf.h"
	1,	// 14, Manufacturer string index
#line 30 "../../../include/ztex-conf.h"
	2,	// 15, Product string index
#line 30 "../../../include/ztex-conf.h"
	3,	// 16, Serial number string index
#line 30 "../../../include/ztex-conf.h"
	1	// 17, Number of configurations
#line 331 "../../../include/ztex-descriptors.h"
    };
    
code BYTE DeviceQualifierDescriptor[] =
    {
#line 30 "../../../include/ztex-conf.h"
	10, 	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	0x06,	// 1, Decriptor type
#line 30 "../../../include/ztex-conf.h"
	0x00,	// 2, Specification Version (L)
#line 30 "../../../include/ztex-conf.h"
	0x02,	// 3, Specification Version (H)
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 4, Device class
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 5, Device sub-class
#line 30 "../../../include/ztex-conf.h"
	0xff,	// 6, Device protocol
#line 30 "../../../include/ztex-conf.h"
	64,	// 7, Maximum packet size (EP0?)
#line 30 "../../../include/ztex-conf.h"
	1,	// 8, Number of configurations
#line 30 "../../../include/ztex-conf.h"
	0,	// 9, Reserved, must be zero
#line 345 "../../../include/ztex-descriptors.h"
    };

code BYTE HighSpeedConfigDescriptor[] = 
    {   
#line 30 "../../../include/ztex-conf.h"
	9	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,0x02	// 1, Decriptor type
#line 30 "../../../include/ztex-conf.h"
	,sizeof(HighSpeedConfigDescriptor) & 0xff	// 2, Total length (LSB)
#line 30 "../../../include/ztex-conf.h"
//	,sizeof(HighSpeedConfigDescriptor) >> 8		// 3, Total length (MB)
#line 30 "../../../include/ztex-conf.h"
	,0						// 3, To avoid warnings, descriptor length will never exceed 255 bytes
#line 30 "../../../include/ztex-conf.h"
	,0	// 4, Number of Interfaces
#line 357 "../../../include/ztex-descriptors.h"
	  +1
#line 368 "../../../include/ztex-descriptors.h"
	
#line 30 "../../../include/ztex-conf.h"
	,1	// 5, Configuration number
#line 30 "../../../include/ztex-conf.h"
	,4	// 6, Configuration string
#line 30 "../../../include/ztex-conf.h"
	,0xc0	// 7, Attributes: bus and self powered
#line 30 "../../../include/ztex-conf.h"
	,50	// Maximum bus power 100 mA
#line 241 "../../../include/ztex-descriptors.h"
	
#line 30 "../../../include/ztex-conf.h"
		// Interface 0 descriptor
#line 30 "../../../include/ztex-conf.h"
	,9	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,0x04	// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0	// 2, Zero-based index of this interface
#line 30 "../../../include/ztex-conf.h"
	,0	// 3, Alternate setting	0
#line 30 "../../../include/ztex-conf.h"
	,0	// 4, Number of end points 
#line 264 "../../../include/ztex-descriptors.h"
	  +1
#line 267 "../../../include/ztex-descriptors.h"
	  +1
#line 30 "../../../include/ztex-conf.h"
	,0xff	// 5, Interface class
#line 30 "../../../include/ztex-conf.h"
	,0xff	// 6, Interface sub class
#line 30 "../../../include/ztex-conf.h"
	,0xff   // 7, Interface protocol
#line 30 "../../../include/ztex-conf.h"
	,0 	// 8, Index of interface string descriptor
#line 198 "../../../include/ztex-descriptors.h"
	 
#line 30 "../../../include/ztex-conf.h"
				// Endpoint 1IN descriptor
#line 30 "../../../include/ztex-conf.h"
	,7 			// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,5			// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0x81			// 2, direction=output, address=1
#line 30 "../../../include/ztex-conf.h"
	,2			// 3, BULK transferns
#line 30 "../../../include/ztex-conf.h"
	,512 & 0xff 	// 4, max. packet size (L) 
#line 30 "../../../include/ztex-conf.h"
	,512 >> 8 	// 5, max. packet size (H) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 6, Polling interval
#line 286 "../../../include/ztex-descriptors.h"

#line 198 "../../../include/ztex-descriptors.h"
	 
#line 30 "../../../include/ztex-conf.h"
				// Endpoint 1OUT descriptor
#line 30 "../../../include/ztex-conf.h"
	,7 			// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,5			// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0x01			// 2, direction=output, address=1
#line 30 "../../../include/ztex-conf.h"
	,2			// 3, BULK transferns
#line 30 "../../../include/ztex-conf.h"
	,512 & 0xff 	// 4, max. packet size (L) 
#line 30 "../../../include/ztex-conf.h"
	,512 >> 8 	// 5, max. packet size (H) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 6, Polling interval
#line 289 "../../../include/ztex-descriptors.h"

#line 374 "../../../include/ztex-descriptors.h"

#line 386 "../../../include/ztex-descriptors.h"
    };
code BYTE HighSpeedConfigDescriptor_PadByte[2-(sizeof(HighSpeedConfigDescriptor) & 1)] = { 0 };

code BYTE FullSpeedConfigDescriptor[] = 
    {   
#line 30 "../../../include/ztex-conf.h"
	9 	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,0x02	// 1, Decriptor type
#line 30 "../../../include/ztex-conf.h"
	,sizeof(FullSpeedConfigDescriptor) & 0xff	// 2, Total length (LSB)
#line 30 "../../../include/ztex-conf.h"
//	,sizeof(FullSpeedConfigDescriptor) >> 8		// 3, Total length (MSB)
#line 30 "../../../include/ztex-conf.h"
	,0						// 3, To avoid warnings, descriptor length will never exceed 255 bytes
#line 30 "../../../include/ztex-conf.h"
	,0	// 4, Number of Interfaces
#line 398 "../../../include/ztex-descriptors.h"
	  +1
#line 409 "../../../include/ztex-descriptors.h"
	
#line 30 "../../../include/ztex-conf.h"
	,1	// 5, Configuration number
#line 30 "../../../include/ztex-conf.h"
	,4	// 6, Configuration string
#line 30 "../../../include/ztex-conf.h"
	,0xc0	// 7, Attributes: bus and self powered
#line 30 "../../../include/ztex-conf.h"
	,50	// Maximum bus power 100 mA
#line 241 "../../../include/ztex-descriptors.h"
	
#line 30 "../../../include/ztex-conf.h"
		// Interface 0 descriptor
#line 30 "../../../include/ztex-conf.h"
	,9	// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,0x04	// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0	// 2, Zero-based index of this interface
#line 30 "../../../include/ztex-conf.h"
	,0	// 3, Alternate setting	0
#line 30 "../../../include/ztex-conf.h"
	,0	// 4, Number of end points 
#line 264 "../../../include/ztex-descriptors.h"
	  +1
#line 267 "../../../include/ztex-descriptors.h"
	  +1
#line 30 "../../../include/ztex-conf.h"
	,0xff	// 5, Interface class
#line 30 "../../../include/ztex-conf.h"
	,0xff	// 6, Interface sub class
#line 30 "../../../include/ztex-conf.h"
	,0xff   // 7, Interface protocol
#line 30 "../../../include/ztex-conf.h"
	,0 	// 8, Index of interface string descriptor
#line 198 "../../../include/ztex-descriptors.h"
	 
#line 30 "../../../include/ztex-conf.h"
				// Endpoint 1IN descriptor
#line 30 "../../../include/ztex-conf.h"
	,7 			// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,5			// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0x81			// 2, direction=output, address=1
#line 30 "../../../include/ztex-conf.h"
	,2			// 3, BULK transferns
#line 30 "../../../include/ztex-conf.h"
	,64			// 4, max. packet size (L) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 5, max. packet size (H) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 6, Polling interval
#line 286 "../../../include/ztex-descriptors.h"

#line 198 "../../../include/ztex-descriptors.h"
	 
#line 30 "../../../include/ztex-conf.h"
				// Endpoint 1OUT descriptor
#line 30 "../../../include/ztex-conf.h"
	,7 			// 0, Descriptor length
#line 30 "../../../include/ztex-conf.h"
	,5			// 1, Descriptor type
#line 30 "../../../include/ztex-conf.h"
	,0x01			// 2, direction=output, address=1
#line 30 "../../../include/ztex-conf.h"
	,2			// 3, BULK transferns
#line 30 "../../../include/ztex-conf.h"
	,64			// 4, max. packet size (L) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 5, max. packet size (H) 
#line 30 "../../../include/ztex-conf.h"
	,0 			// 6, Polling interval
#line 289 "../../../include/ztex-descriptors.h"

#line 415 "../../../include/ztex-descriptors.h"

#line 426 "../../../include/ztex-descriptors.h"
    };
code BYTE FullSpeedConfigDescriptor_PadByte[2-(sizeof(FullSpeedConfigDescriptor) & 1)] = { 0 };

code BYTE EmptyStringDescriptor[] = 
    {
#line 30 "../../../include/ztex-conf.h"
	sizeof(EmptyStringDescriptor),  	// Length
#line 30 "../../../include/ztex-conf.h"
	0x03,					// Descriptor type
#line 433 "../../../include/ztex-descriptors.h"
	0, 0
    };

#line 119 "../../../include/ztex.h"

#line 1 "../../../include/ztex-isr.h"
/*!
   ZTEX Firmware Kit for EZ-USB Microcontrollers
   Copyright (C) 2009-2010 ZTEX e.K.
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

/* 
   Interrupt routines
*/

#line 25 "../../../include/ztex-isr.h"

xdata BYTE ep0_prev_setup_request = 0xff;
xdata BYTE ep0_vendor_cmd_setup = 0;

#line 30 "../../../include/ztex-conf.h"
xdata WORD ISOFRAME_COUNTER[4] = {0, 0, 0, 0}; 	// counters for iso frames automatically reset by sync frame request
#line 30 "../../../include/ztex-isr.h"

/* *********************************************************************
   ***** toggleData ****************************************************
   ********************************************************************* */
static void resetToggleData () {
#line 44 "../../../include/ztex-isr.h"

#line 30 "../../../include/ztex-conf.h"
    TOGCTL = 0;				// EP0 out
#line 46 "../../../include/ztex-isr.h"
    TOGCTL = 0 | 32;
#line 30 "../../../include/ztex-conf.h"
    TOGCTL = 0x10;			// EP0 in
#line 48 "../../../include/ztex-isr.h"
    TOGCTL = 0x10 | 32;
#line 30 "../../../include/ztex-conf.h"
    TOGCTL = 1;				// EP1 out
#line 51 "../../../include/ztex-isr.h"
    TOGCTL = 1 | 32;
#line 30 "../../../include/ztex-conf.h"
    TOGCTL = 0x11;			// EP1 in
#line 55 "../../../include/ztex-isr.h"
    TOGCTL = 0x11 | 32;
#line 35 "../../../include/ztex-isr.h"
    
#line 35 "../../../include/ztex-isr.h"
    
#line 35 "../../../include/ztex-isr.h"
    
#line 35 "../../../include/ztex-isr.h"
    
#line 61 "../../../include/ztex-isr.h"
}

/* *********************************************************************
   ***** getStringDescriptor *******************************************
   ********************************************************************* */
#line 67 "../../../include/ztex-isr.h"

static void sendStringDescriptor (BYTE loAddr, BYTE hiAddr, BYTE size)
{
    BYTE i;
    if ( size > 31)
	size = 31;
    AUTOPTRSETUP = 7;
    AUTOPTRL1 = loAddr;
    AUTOPTRH1 = hiAddr;
    AUTOPTRL2 = (BYTE)(((unsigned short)(&EP0BUF))+1);
    AUTOPTRH2 = (BYTE)((((unsigned short)(&EP0BUF))+1) >> 8);
    XAUTODAT2 = 3;
    for (i=0; i<size; i++) {
	XAUTODAT2 = XAUTODAT1;
	XAUTODAT2 = 0;
    }
    i = (size+1) << 1;
    EP0BUF[0] = i;
    EP0BUF[1] = 3;
    EP0BCH = 0;
    EP0BCL = i;
}

/* *********************************************************************
   ***** ep0_payload_update ********************************************
   ********************************************************************* */
static void ep0_payload_update() {
    ep0_payload_transfer = ( ep0_payload_remaining > 64 ) ? 64 : ep0_payload_remaining;
    ep0_payload_remaining -= ep0_payload_transfer;
}


/* *********************************************************************
   ***** ep0_vendor_cmd_su **********************************************
   ********************************************************************* */
static void ep0_vendor_cmd_su() {
    switch ( ep0_prev_setup_request ) {
#line 112 "../../../include/ztex-conf.h"
	
case 0x39:			
#line 30 "../../../include/ztex-conf.h"
    				// write to EEPROM
#line 233 "../../../include/ztex-eeprom.h"
    eeprom_write_checksum = 0;
    eeprom_write_bytes = 0;
#line 30 "../../../include/ztex-conf.h"
    eeprom_addr =  ( SETUPDAT[3] << 8) | SETUPDAT[2];	// Address
#line 114 "../../../include/ztex-conf.h"

    break;
#line 104 "../../../include/ztex-isr.h"

	default:
#line 30 "../../../include/ztex-conf.h"
    	    EP0CS |= 0x01;			// set stall, unknown request
#line 107 "../../../include/ztex-isr.h"
    }
}

/* *********************************************************************
   ***** SUDAV_ISR *****************************************************
   ********************************************************************* */
static void SUDAV_ISR () interrupt
{
    BYTE a;
    ep0_prev_setup_request = bRequest;
    SUDPTRCTL = 1;
    
#line 30 "../../../include/ztex-conf.h"
    // standard USB requests
#line 120 "../../../include/ztex-isr.h"
    switch ( bRequest ) {
#line 30 "../../../include/ztex-conf.h"
	case 0x00:	// get status 
#line 122 "../../../include/ztex-isr.h"
    	    switch(SETUPDAT[0]) {
#line 30 "../../../include/ztex-conf.h"
		case 0x80:  		// self powered and remote 
#line 30 "../../../include/ztex-conf.h"
		    EP0BUF[0] = 0;	// not self-powered, no remote wakeup
#line 125 "../../../include/ztex-isr.h"
		    EP0BUF[1] = 0;
		    EP0BCH = 0;
		    EP0BCL = 2;
		    break;
#line 30 "../../../include/ztex-conf.h"
		case 0x81:		// interface (reserved)
#line 30 "../../../include/ztex-conf.h"
		    EP0BUF[0] = 0; 	// always return zeros
#line 131 "../../../include/ztex-isr.h"
		    EP0BUF[1] = 0;
		    EP0BCH = 0;
		    EP0BCL = 2;
		    break;
		case 0x82:	
		    switch ( SETUPDAT[4] ) {
			case 0x00 :
			case 0x80 :
			    EP0BUF[0] = EP0CS & 1;
			    break;
			case 0x01 :
			    EP0BUF[0] = EP1OUTCS & 1;
			    break;
			case 0x81 :
			    EP0BUF[0] = EP1INCS & 1;
			    break;
			default:
			    EP0BUF[0] = EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] & 1;
			    break;
			}
		    EP0BUF[1] = 0;
		    EP0BCH = 0;
		    EP0BCL = 2;
		    break;
	    }
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x01:	// disable feature, e.g. remote wake, stall bit
#line 158 "../../../include/ztex-isr.h"
	    if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
		switch ( SETUPDAT[4] ) {
		    case 0x00 :
		    case 0x80 :
			EP0CS &= ~1;
			break;
		    case 0x01 :
			EP1OUTCS &= ~1;
			break;
		    case 0x81 :
		         EP1INCS &= ~1;
			break;
		    default:
			 EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] &= ~1;
			break;
		} 
	    }
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x03:      // enable feature, e.g. remote wake, test mode, stall bit
#line 177 "../../../include/ztex-isr.h"
	    if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
		switch ( SETUPDAT[4] ) {
		    case 0x00 :
		    case 0x80 :
			EP0CS |= 1;
			break;
		    case 0x01 :
			EP1OUTCS |= 1;
			break;
		    case 0x81 :
		         EP1INCS |= 1;
			break;
		    default:
			 EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] |= ~1;
			break;
		}
		a = ( (SETUPDAT[4] & 0x80) >> 3 ) | (SETUPDAT[4] & 0x0f);
		TOGCTL = a;
		TOGCTL = a | 32;
	    } 
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x06:			// get descriptor
#line 199 "../../../include/ztex-isr.h"
	    switch(SETUPDAT[3]) {
#line 30 "../../../include/ztex-conf.h"
		case 0x01:		// device
#line 201 "../../../include/ztex-isr.h"
		    SUDPTRH = ((BYTE)((((unsigned short)(&DeviceDescriptor)) >> 8) & 0xff)) ;
		    SUDPTRL = ((BYTE)(&DeviceDescriptor));
		    break;
#line 30 "../../../include/ztex-conf.h"
		case 0x02: 		// configuration
#line 205 "../../../include/ztex-isr.h"
		    if (USBCS & 128) {
    	    	        SUDPTRH = ((BYTE)((((unsigned short)(&HighSpeedConfigDescriptor)) >> 8) & 0xff)) ;
			SUDPTRL = ((BYTE)(&HighSpeedConfigDescriptor));
		    }
		    else {
    	    	        SUDPTRH = ((BYTE)((((unsigned short)(&FullSpeedConfigDescriptor)) >> 8) & 0xff)) ;
			SUDPTRL = ((BYTE)(&FullSpeedConfigDescriptor));
		    }
		    break; 
#line 30 "../../../include/ztex-conf.h"
		case 0x03:		// strings
#line 215 "../../../include/ztex-isr.h"
		    switch (SETUPDAT[2]) {
			case 1:
			    sendStringDescriptor(((BYTE)(manufacturerString)), ((BYTE)((((unsigned short)(manufacturerString)) >> 8) & 0xff)) , sizeof(manufacturerString) );
			    break;
			case 2:
			    sendStringDescriptor(((BYTE)(productString)), ((BYTE)((((unsigned short)(productString)) >> 8) & 0xff)) , sizeof(productString) );
			    break;
			case 3:
			    sendStringDescriptor(((BYTE)(SN_STRING)), ((BYTE)((((unsigned short)(SN_STRING)) >> 8) & 0xff)) , sizeof(SN_STRING) );
			    break;
			case 4:
			    sendStringDescriptor(((BYTE)(configurationString)), ((BYTE)((((unsigned short)(configurationString)) >> 8) & 0xff)) , sizeof(configurationString) );
			    break; 
			default:
			    SUDPTRH = ((BYTE)((((unsigned short)(&EmptyStringDescriptor)) >> 8) & 0xff)) ;
			    SUDPTRL = ((BYTE)(&EmptyStringDescriptor));
			    break;
			}	
		    break;
#line 30 "../../../include/ztex-conf.h"
		case 0x06:		// device qualifier
#line 235 "../../../include/ztex-isr.h"
		    SUDPTRH = ((BYTE)((((unsigned short)(&DeviceQualifierDescriptor)) >> 8) & 0xff)) ;
		    SUDPTRL = ((BYTE)(&DeviceQualifierDescriptor));
		    break;
#line 30 "../../../include/ztex-conf.h"
		case 0x07: 		// other speed configuration
#line 239 "../../../include/ztex-isr.h"
		    if (USBCS & 128) {
    	    	        SUDPTRH = ((BYTE)((((unsigned short)(&FullSpeedConfigDescriptor)) >> 8) & 0xff)) ;
			SUDPTRL = ((BYTE)(&FullSpeedConfigDescriptor));
		    }
		    else {
    	    	        SUDPTRH = ((BYTE)((((unsigned short)(&HighSpeedConfigDescriptor)) >> 8) & 0xff)) ;
			SUDPTRL = ((BYTE)(&HighSpeedConfigDescriptor));
		    }
		    break; 
		default:
#line 30 "../../../include/ztex-conf.h"
		    EP0CS |= 0x01;	// set stall, unknown descriptor
#line 250 "../../../include/ztex-isr.h"
	    }
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x07:			// set descriptor
#line 253 "../../../include/ztex-isr.h"
	    break;			
#line 30 "../../../include/ztex-conf.h"
	case 0x08:			// get configuration
#line 30 "../../../include/ztex-conf.h"
	    EP0BUF[0] = 0;		// only one configuration
#line 256 "../../../include/ztex-isr.h"
	    EP0BCH = 0;
	    EP0BCL = 1;
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x09:			// set configuration
#line 260 "../../../include/ztex-isr.h"
	    resetToggleData();
#line 30 "../../../include/ztex-conf.h"
	    break;			// do nothing since we have only one configuration
#line 30 "../../../include/ztex-conf.h"
	case 0x0a:			// get alternate setting for an interface
#line 30 "../../../include/ztex-conf.h"
	    EP0BUF[0] = 0;		// only one alternate setting
#line 264 "../../../include/ztex-isr.h"
	    EP0BCH = 0;
	    EP0BCL = 1;
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x0b:			// set alternate setting for an interface
#line 268 "../../../include/ztex-isr.h"
	    resetToggleData();
#line 30 "../../../include/ztex-conf.h"
	    break;			// do nothing since we have only on alternate setting
#line 30 "../../../include/ztex-conf.h"
	case 0x0c:			// sync frame
#line 271 "../../../include/ztex-isr.h"
	    if ( SETUPDAT[0] == 0x82 ) {
		ISOFRAME_COUNTER[ ((SETUPDAT[4] >> 1)-1) & 3 ] = 0;
#line 30 "../../../include/ztex-conf.h"
		EP0BUF[0] = USBFRAMEL;	// use current frame as sync frame, i hope that works
#line 274 "../../../include/ztex-isr.h"
		EP0BUF[1] = USBFRAMEH;	
		EP0BCH = 0;
    		EP0BCL = 2;
	    }
#line 30 "../../../include/ztex-conf.h"
	    break;			// do nothing since we have only on alternate setting
#line 279 "../../../include/ztex-isr.h"
	    
    }

#line 30 "../../../include/ztex-conf.h"
    // vendor request and commands
#line 283 "../../../include/ztex-isr.h"
    switch ( bmRequestType ) {
#line 30 "../../../include/ztex-conf.h"
	case 0xc0: 					// vendor request 
#line 285 "../../../include/ztex-isr.h"
	    ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	    ep0_payload_update();
	    
	    switch ( bRequest ) {
#line 30 "../../../include/ztex-conf.h"
		case 0x22: 				// get ZTEX descriptor
#line 290 "../../../include/ztex-isr.h"
		    SUDPTRCTL = 0;
		    EP0BCH = 0;
		    EP0BCL = 40;
		    SUDPTRH = ((BYTE)((((unsigned short)(0x06c)) >> 8) & 0xff)) ;
		    SUDPTRL = ((BYTE)(0x06c)); 
		    break;
#line 89 "../../../include/ztex-conf.h"
		
case 0x38:
#line 30 "../../../include/ztex-conf.h"
     				// read from EEPROM
#line 30 "../../../include/ztex-conf.h"
    eeprom_addr =  (SETUPDAT[3] << 8) | SETUPDAT[2];	// Address
#line 216 "../../../include/ztex-eeprom.h"
    EP0BCH = 0;
    EP0BCL = eeprom_read_ep0(); 
#line 91 "../../../include/ztex-conf.h"

    break;
#line 89 "../../../include/ztex-conf.h"

case 0x3A:
#line 30 "../../../include/ztex-conf.h"
    				// EEPROM state
#line 244 "../../../include/ztex-eeprom.h"
    EP0BUF[0] = ((BYTE)(eeprom_write_bytes));
    EP0BUF[1] = ((BYTE)((((unsigned short)(eeprom_write_bytes)) >> 8) & 0xff)) ;
    EP0BUF[2] = eeprom_write_checksum;
#line 30 "../../../include/ztex-conf.h"
    EP0BUF[3] = eeprom_select(0,1);			// 1 means busy or error
#line 248 "../../../include/ztex-eeprom.h"
    EP0BCH = 0;
    EP0BCL = 4;
#line 91 "../../../include/ztex-conf.h"

    break;
#line 89 "../../../include/ztex-conf.h"

case 0x28:
#line 30 "../../../include/ztex-conf.h"
     				// read the debug data
#line 82 "../../../include/ztex-debug.h"
    debug_read_addr = (__xdata BYTE*)&debug_counter;
    EP0BCH = 0;
    EP0BCL = debug_read_ep0(); 
#line 91 "../../../include/ztex-conf.h"

    break;
#line 296 "../../../include/ztex-isr.h"

		default:
#line 30 "../../../include/ztex-conf.h"
		    EP0CS |= 0x01;			// set stall, unknown request
#line 299 "../../../include/ztex-isr.h"
	    }
	    break;
#line 30 "../../../include/ztex-conf.h"
	case 0x40: 					// vendor command
#line 302 "../../../include/ztex-isr.h"
	    /* vendor commands may overlap if they are send without pause. To avoid
	       synchronization problems the setup sequences are executed in EP0OUT_ISR, i.e.
	       after the first packet of payload date received. */
	    if ( SETUPDAT[7]!=0 || SETUPDAT[6]!=0 ) {
		ep0_vendor_cmd_setup = 1;
		EP0BCL = 0;
#line 30 "../../../include/ztex-conf.h"
		EXIF &= ~16;			// clear main USB interrupt flag
#line 30 "../../../include/ztex-conf.h"
		USBIRQ = 1;			// clear SUADV IRQ
#line 30 "../../../include/ztex-conf.h"
		return;					// don't clear HSNAK bit. This is done after the command has completed
#line 311 "../../../include/ztex-isr.h"
	    }
#line 30 "../../../include/ztex-conf.h"
	    ep0_vendor_cmd_su();			// setup sequences of vendor command with no payload ara executed immediately
#line 313 "../../../include/ztex-isr.h"
	    EP0BCL = 0;
	    break;
    }

#line 30 "../../../include/ztex-conf.h"
    EXIF &= ~16;					// clear main USB interrupt flag
#line 30 "../../../include/ztex-conf.h"
    USBIRQ = 1;					// clear SUADV IRQ
#line 30 "../../../include/ztex-conf.h"
    EP0CS |= 0x80;					// clear the HSNAK bit
#line 320 "../../../include/ztex-isr.h"
}

/* *********************************************************************
   ***** SOF_ISR ******************************************************* 
   ********************************************************************* */
void SOF_ISR() interrupt
{
        EXIF &= ~16;
	USBIRQ = 2;
}

/* *********************************************************************
   ***** SUTOK_ISR ***************************************************** 
   ********************************************************************* */
void SUTOK_ISR() interrupt 
{
        EXIF &= ~16;
	USBIRQ = 4;
}

/* *********************************************************************
   ***** SUSP_ISR ****************************************************** 
   ********************************************************************* */
void SUSP_ISR() interrupt
{
        EXIF &= ~16;
	USBIRQ = 8;
}

/* *********************************************************************
   ***** URES_ISR ****************************************************** 
   ********************************************************************* */
void URES_ISR() interrupt
{
        EXIF &= ~16;
	USBIRQ = 16;
}

/* *********************************************************************
   ***** HSGRANT_ISR *************************************************** 
   ********************************************************************* */
void HSGRANT_ISR() interrupt
{
        EXIF &= ~16;
	USBIRQ = 32;
}        

/* *********************************************************************
   ***** EP0ACK_ISR **************************************************** 
   ********************************************************************* */
void EP0ACK_ISR() interrupt
{
#line 30 "../../../include/ztex-conf.h"
        EXIF &= ~16;	// clear USB interrupt flag
#line 30 "../../../include/ztex-conf.h"
	USBIRQ = 64;	// clear EP0ACK IRQ
#line 374 "../../../include/ztex-isr.h"
}

/* *********************************************************************
   ***** EP0IN_ISR *****************************************************
   ********************************************************************* */
static void EP0IN_ISR () interrupt
{
#line 30 "../../../include/ztex-conf.h"
    EUSB = 0;			// block all USB interrupts
#line 382 "../../../include/ztex-isr.h"
    ep0_payload_update();
    switch ( ep0_prev_setup_request ) {
#line 94 "../../../include/ztex-conf.h"
	
case 0x38:
#line 218 "../../../include/ztex-eeprom.h"
    
    EP0BCH = 0;
    EP0BCL = eeprom_read_ep0(); 
#line 96 "../../../include/ztex-conf.h"

    break;
#line 94 "../../../include/ztex-conf.h"

case 0x3A:
    
    break;
#line 94 "../../../include/ztex-conf.h"

case 0x28:
#line 85 "../../../include/ztex-debug.h"
    
    EP0BCH = 0;
    EP0BCL = debug_read_ep0(); 
#line 96 "../../../include/ztex-conf.h"

    break;
#line 384 "../../../include/ztex-isr.h"

	default:
	    EP0BCH = 0;
	    EP0BCL = 0;
    }
#line 30 "../../../include/ztex-conf.h"
    EXIF &= ~16;		// clear USB interrupt flag
#line 30 "../../../include/ztex-conf.h"
    EPIRQ = 1;		// clear EP0IN IRQ
#line 391 "../../../include/ztex-isr.h"
    EUSB = 1;
}

/* *********************************************************************
   ***** EP0OUT_ISR ****************************************************
   ********************************************************************* */
static void EP0OUT_ISR () interrupt
{
#line 30 "../../../include/ztex-conf.h"
    EUSB = 0;			// block all USB interrupts
#line 400 "../../../include/ztex-isr.h"
    if ( ep0_vendor_cmd_setup ) {
	ep0_vendor_cmd_setup = 0;
	ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	ep0_vendor_cmd_su();
    }
    
    ep0_payload_update();
    
    switch ( ep0_prev_setup_request ) {
#line 117 "../../../include/ztex-conf.h"
	
case 0x39:			
#line 236 "../../../include/ztex-eeprom.h"
    
    eeprom_write_ep0(EP0BCL);
#line 119 "../../../include/ztex-conf.h"
    
    break;
#line 409 "../../../include/ztex-isr.h"

    } 

    EP0BCL = 0;

#line 30 "../../../include/ztex-conf.h"
    EXIF &= ~16;		// clear main USB interrupt flag
#line 30 "../../../include/ztex-conf.h"
    EPIRQ = 2;		// clear EP0OUT IRQ
#line 416 "../../../include/ztex-isr.h"
    if ( ep0_payload_remaining == 0 ) {
#line 30 "../../../include/ztex-conf.h"
	EP0CS |= 0x80; 		// clear the HSNAK bit
#line 418 "../../../include/ztex-isr.h"
    }
    EUSB = 1;
}


/* *********************************************************************
   ***** EP1IN_ISR *****************************************************
   ********************************************************************* */
void EP1IN_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 4;

}

/* *********************************************************************
   ***** EP1OUT_ISR ****************************************************
   ********************************************************************* */
void EP1OUT_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 8;
}

/* *********************************************************************
   ***** EP2_ISR *******************************************************
   ********************************************************************* */
void EP2_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 16;
}

/* *********************************************************************
   ***** EP4_ISR *******************************************************
   ********************************************************************* */
void EP4_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 32;
}

/* *********************************************************************
   ***** EP6_ISR *******************************************************
   ********************************************************************* */
void EP6_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 64;
}

/* *********************************************************************
   ***** EP8_ISR *******************************************************
   ********************************************************************* */
void EP8_ISR() interrupt
{
    EXIF &= ~16;
    EPIRQ = 128;
}

#line 120 "../../../include/ztex.h"



/* *********************************************************************
   ***** init_USB ******************************************************
   ********************************************************************* */
#line 152 "../../../include/ztex.h"

#line 164 "../../../include/ztex.h"

void init_USB ()
{
    USBCS |= 0x08;
    
    CPUCS = 16 | 2;
    CKCON &= ~7;
    
#line 188 "../../../include/ztex.h"

        

    EA = 0;
    EUSB = 0;

#line 122 "../../../include/ezintavecs.h"
    {
    INT8VEC_USB.op=0x02;
    INT8VEC_USB.addrH = 0x01;
    INT8VEC_USB.addrL = 0xb8;
    INTSETUP |= 8;
#line 194 "../../../include/ztex.h"
}
    
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_SUDAV.op=0x02;
    INTVEC_SUDAV.addrH=((unsigned short)(& SUDAV_ISR)) >> 8;
    INTVEC_SUDAV.addrL=(unsigned short)(& SUDAV_ISR);
#line 196 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_SOF.op=0x02;
    INTVEC_SOF.addrH=((unsigned short)(& SOF_ISR)) >> 8;
    INTVEC_SOF.addrL=(unsigned short)(& SOF_ISR);
#line 197 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_SUTOK.op=0x02;
    INTVEC_SUTOK.addrH=((unsigned short)(& SUTOK_ISR)) >> 8;
    INTVEC_SUTOK.addrL=(unsigned short)(& SUTOK_ISR);
#line 198 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_SUSPEND.op=0x02;
    INTVEC_SUSPEND.addrH=((unsigned short)(& SUSP_ISR)) >> 8;
    INTVEC_SUSPEND.addrL=(unsigned short)(& SUSP_ISR);
#line 199 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_USBRESET.op=0x02;
    INTVEC_USBRESET.addrH=((unsigned short)(& URES_ISR)) >> 8;
    INTVEC_USBRESET.addrL=(unsigned short)(& URES_ISR);
#line 200 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_HISPEED.op=0x02;
    INTVEC_HISPEED.addrH=((unsigned short)(& HSGRANT_ISR)) >> 8;
    INTVEC_HISPEED.addrL=(unsigned short)(& HSGRANT_ISR);
#line 201 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP0ACK.op=0x02;
    INTVEC_EP0ACK.addrH=((unsigned short)(& EP0ACK_ISR)) >> 8;
    INTVEC_EP0ACK.addrL=(unsigned short)(& EP0ACK_ISR);
#line 202 "../../../include/ztex.h"
}

#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP0IN.op=0x02;
    INTVEC_EP0IN.addrH=((unsigned short)(& EP0IN_ISR)) >> 8;
    INTVEC_EP0IN.addrL=(unsigned short)(& EP0IN_ISR);
#line 204 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP0OUT.op=0x02;
    INTVEC_EP0OUT.addrH=((unsigned short)(& EP0OUT_ISR)) >> 8;
    INTVEC_EP0OUT.addrL=(unsigned short)(& EP0OUT_ISR);
#line 205 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP1IN.op=0x02;
    INTVEC_EP1IN.addrH=((unsigned short)(& EP1IN_ISR)) >> 8;
    INTVEC_EP1IN.addrL=(unsigned short)(& EP1IN_ISR);
#line 206 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP1OUT.op=0x02;
    INTVEC_EP1OUT.addrH=((unsigned short)(& EP1OUT_ISR)) >> 8;
    INTVEC_EP1OUT.addrL=(unsigned short)(& EP1OUT_ISR);
#line 207 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP2.op=0x02;
    INTVEC_EP2.addrH=((unsigned short)(& EP2_ISR)) >> 8;
    INTVEC_EP2.addrL=(unsigned short)(& EP2_ISR);
#line 208 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP4.op=0x02;
    INTVEC_EP4.addrH=((unsigned short)(& EP4_ISR)) >> 8;
    INTVEC_EP4.addrL=(unsigned short)(& EP4_ISR);
#line 209 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP6.op=0x02;
    INTVEC_EP6.addrH=((unsigned short)(& EP6_ISR)) >> 8;
    INTVEC_EP6.addrL=(unsigned short)(& EP6_ISR);
#line 210 "../../../include/ztex.h"
}
#line 114 "../../../include/ezintavecs.h"
    {
    INTVEC_EP8.op=0x02;
    INTVEC_EP8.addrH=((unsigned short)(& EP8_ISR)) >> 8;
    INTVEC_EP8.addrL=(unsigned short)(& EP8_ISR);
#line 211 "../../../include/ztex.h"
}

    EXIF &= ~16;
    USBIRQ = 0x7f;
    USBIE |= 0x7f; 
    EPIRQ = 0xff;
    EPIE = 0xff;
    
    EUSB = 1;
    EA = 1;

#line 154 "../../../include/ztex.h"
    	EP1INCFG = 128 | 32;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 162 "../../../include/ztex.h"

#line 222 "../../../include/ztex.h"

#line 154 "../../../include/ztex.h"
    	EP1OUTCFG = 128 | 32;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 162 "../../../include/ztex.h"

#line 223 "../../../include/ztex.h"

#line 126 "../../../include/ztex.h"
        EP2CFG = 
#line 132 "../../../include/ztex.h"
	0
#line 149 "../../../include/ztex.h"
	;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 150 "../../../include/ztex.h"

#line 224 "../../../include/ztex.h"

#line 126 "../../../include/ztex.h"
        EP4CFG = 
#line 132 "../../../include/ztex.h"
	0
#line 149 "../../../include/ztex.h"
	;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 150 "../../../include/ztex.h"

#line 225 "../../../include/ztex.h"

#line 126 "../../../include/ztex.h"
        EP6CFG = 
#line 132 "../../../include/ztex.h"
	0
#line 149 "../../../include/ztex.h"
	;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 150 "../../../include/ztex.h"

#line 226 "../../../include/ztex.h"

#line 126 "../../../include/ztex.h"
        EP8CFG = 
#line 132 "../../../include/ztex.h"
	0
#line 149 "../../../include/ztex.h"
	;
#line 41 "../../../include/ezregs.h"
	_asm 
	nop 
	nop 
	nop 
	nop 
    _endasm;
#line 150 "../../../include/ztex.h"

#line 227 "../../../include/ztex.h"

    
#line 236 "../../../include/ztex.h"
    debug_init();
#line 238 "../../../include/ztex.h"

    USBCS |= 128 | 2;
    wait(250);
    USBCS &= ~0x08;
}


#line 30 "debug.c"


void main(void)	
{
    WORD i;
    BYTE b;
    
#line 30 "../../../include/ztex-conf.h"
// init everything
#line 38 "debug.c"
    init_USB();
    
    i=0;
    while (1) {	

#line 30 "../../../include/ztex-conf.h"
	debug_msg_buf[0] = i;		// write second counter to the message buffer
#line 44 "debug.c"
	debug_msg_buf[1] = i >> 8;
#line 30 "../../../include/ztex-conf.h"
	debug_add_msg();		// add the message to the stack
#line 46 "debug.c"
	i+=1;

#line 30 "../../../include/ztex-conf.h"
	for (b=0; b<100; b++) {		// 100 x 10ms
#line 30 "../../../include/ztex-conf.h"
	    debug_stack_ptr[2] = b;	// write the 10ms tick number to the current message in stack
#line 30 "../../../include/ztex-conf.h"
	    wait(10);			// wait 10ms
#line 51 "debug.c"
	}
    }
}

