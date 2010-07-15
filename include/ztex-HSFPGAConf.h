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

#ifndef[ZTEX_HS_FPGA_CONF1_H]
#define[ZTEX_HS_FPGA_CONF1_H]

ADD_EP0_VENDOR_COMMAND((0x33,,init_hs_fpga_configuration();,,));;
ADD_EP0_VENDOR_COMMAND((0x34,,finish_hs_fpga_configuration();,,));;

#ifndef[HS_FPGA_CONF_EP]
#error[Macro `HS_FPGA_CONF_EP' is not defined]
#endif

#ifeq[HS_FPGA_CONF_EP][2]
#elifeq[HS_FPGA_CONF_EP][4]
#elifeq[HS_FPGA_CONF_EP][6]
#elifneq[HS_FPGA_CONF_EP][8]
#error[Macro `HS_FPGA_CONF_EP' is not defined correctly. Valid values are: `2', `4', `6', `8'.]
#endif


static void init_hs_fpga_configuration();
static void finish_hs_fpga_configuration();

#elifndef[ZTEX_HS_FPGA_CONF2_H]  /*ZTEX_HS_FPGA_CONF1_H*/
#define[ZTEX_HS_FPGA_CONF2_H]

static void finish_hs_fpga_configuration() {
    GPIFABORT = 0xFF;
    SYNCDELAY;
    IFCONFIG = bmBIT7 | bmBIT6;
    SYNCDELAY;
    finish_fpga_configuration();
}

// FIFO write wave form
const char xdata GPIF_WAVE_DATA_HSFPGA[32] =     
{                                      
/* LenBr */ 0x88,     0x01,     0xB8,     0x01,     0x01,     0x01,     0x01,     0x07,
/* Opcode*/ 0x03,     0x06,     0x01,     0x00,     0x00,     0x00,     0x00,     0x00,
/* Output*/ 0x00,     0x00,     0x00,     0x00,     0x00,     0x00,     0x00,     0x00,
/* LFun  */ 0xF7,     0x00,     0x2D,     0x00,     0x00,     0x00,     0x00,     0x3F,
};                     
                       

static void init_hs_fpga_configuration() {
    init_fpga_configuration();

    EPHS_FPGA_CONF_EPCS &= ~bmBIT0;		// clear stall bit

    GPIFABORT = 0xFF;				// abort pendig 
 
    IFCONFIG = bmBIT7 + bmBIT6 + bmBIT5 + 2;	// Internal source, 48MHz, GPIF

    GPIFREADYCFG = bmBIT7 | bmBIT6 | bmBIT5;
    GPIFCTLCFG = 0;
    GPIFIDLECS = 0;
    GPIFIDLECTL = 0;
    GPIFWFSELECT = 0x4E;
    GPIFREADYSTAT = 0;

    MEM_COPY1(GPIF_WAVE_DATA_HSFPGA,GPIF_WAVE3_DATA,32);

    FLOWSTATE = 0;
    FLOWLOGIC = 0;
    FLOWEQ0CTL = 0;
    FLOWEQ1CTL = 0;
    FLOWHOLDOFF = 0;
    FLOWSTB = 0;
    FLOWSTBEDGE = 0;
    FLOWSTBHPERIOD = 0;

    REVCTL = 0x0;				// reset fifo
    SYNCDELAY; 
    FIFORESET = 0x80;
    SYNCDELAY;
    FIFORESET = HS_FPGA_CONF_EP;
    SYNCDELAY;
    FIFORESET = 0x0;
    SYNCDELAY; 

    EPHS_FPGA_CONF_EPFIFOCFG = bmBIT0;		// config fifo
    SYNCDELAY; 
    EPHS_FPGA_CONF_EPFIFOCFG = bmBIT4 | bmBIT0;
    SYNCDELAY;
    EPHS_FPGA_CONF_EPGPIFFLGSEL = 1;
    SYNCDELAY;

    GPIFTCB3 = 0;				// abort after at least 14*65536 transactions
    SYNCDELAY;
    GPIFTCB2 = 14;
    SYNCDELAY;
    GPIFTCB1 = 0;
    SYNCDELAY;
    GPIFTCB0 = 0;
    SYNCDELAY;
    
    EPHS_FPGA_CONF_EPGPIFTRIG = 0xff;		// arm fifos
    SYNCDELAY;
}

#endif /*ZTEX_HS_FPGA_CONF2_H*/
