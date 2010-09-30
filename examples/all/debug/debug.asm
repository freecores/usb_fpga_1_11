;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5117 (May 15 2008) (UNIX)
; This file was generated Wed Sep  8 20:23:26 2010
;--------------------------------------------------------
	.module debug_tmp
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sendStringDescriptor_PARM_3
	.globl _sendStringDescriptor_PARM_2
	.globl _EmptyStringDescriptor
	.globl _FullSpeedConfigDescriptor_PadByte
	.globl _FullSpeedConfigDescriptor
	.globl _HighSpeedConfigDescriptor_PadByte
	.globl _HighSpeedConfigDescriptor
	.globl _DeviceQualifierDescriptor
	.globl _DeviceDescriptor
	.globl _PadByte
	.globl _configurationString
	.globl _productString
	.globl _manufacturerString
	.globl _main
	.globl _init_USB
	.globl _EP8_ISR
	.globl _EP6_ISR
	.globl _EP4_ISR
	.globl _EP2_ISR
	.globl _EP1OUT_ISR
	.globl _EP1IN_ISR
	.globl _EP0ACK_ISR
	.globl _HSGRANT_ISR
	.globl _URES_ISR
	.globl _SUSP_ISR
	.globl _SUTOK_ISR
	.globl _SOF_ISR
	.globl _abscode_identity
	.globl _debug_read_ep0
	.globl _debug_init
	.globl _debug_add_msg
	.globl _eeprom_write_ep0
	.globl _eeprom_read_ep0
	.globl _eeprom_write
	.globl _eeprom_read
	.globl _eeprom_select
	.globl _i2c_waitStop
	.globl _i2c_waitStart
	.globl _i2c_waitRead
	.globl _i2c_waitWrite
	.globl _MEM_COPY1_int
	.globl _uwait
	.globl _wait
	.globl _abscode_intvec
	.globl _EIPX6
	.globl _EIPX5
	.globl _EIPX4
	.globl _PI2C
	.globl _PUSB
	.globl _BREG7
	.globl _BREG6
	.globl _BREG5
	.globl _BREG4
	.globl _BREG3
	.globl _BREG2
	.globl _BREG1
	.globl _BREG0
	.globl _EIEX6
	.globl _EIEX5
	.globl _EIEX4
	.globl _EI2C
	.globl _EUSB
	.globl _ACC7
	.globl _ACC6
	.globl _ACC5
	.globl _ACC4
	.globl _ACC3
	.globl _ACC2
	.globl _ACC1
	.globl _ACC0
	.globl _SMOD1
	.globl _ERESI
	.globl _RESI
	.globl _INT6
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _PF
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _CT2
	.globl _CPRL2
	.globl _SM0_1
	.globl _SM1_1
	.globl _SM2_1
	.globl _REN_1
	.globl _TB8_1
	.globl _RB8_1
	.globl _TI_1
	.globl _RI_1
	.globl _PS1
	.globl _PT2
	.globl _PS0
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _IOD7
	.globl _IOD6
	.globl _IOD5
	.globl _IOD4
	.globl _IOD3
	.globl _IOD2
	.globl _IOD1
	.globl _IOD0
	.globl _EA
	.globl _ES1
	.globl _ET2
	.globl _ES0
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _IOC7
	.globl _IOC6
	.globl _IOC5
	.globl _IOC4
	.globl _IOC3
	.globl _IOC2
	.globl _IOC1
	.globl _IOC0
	.globl _SM0_0
	.globl _SM1_0
	.globl _SM2_0
	.globl _REN_0
	.globl _TB8_0
	.globl _RB8_0
	.globl _TI_0
	.globl _RI_0
	.globl _IOB7
	.globl _IOB6
	.globl _IOB5
	.globl _IOB4
	.globl _IOB3
	.globl _IOB2
	.globl _IOB1
	.globl _IOB0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _IOA7
	.globl _IOA6
	.globl _IOA5
	.globl _IOA4
	.globl _IOA3
	.globl _IOA2
	.globl _IOA1
	.globl _IOA0
	.globl _EIP
	.globl _BREG
	.globl _EIE
	.globl _ACC
	.globl _EICON
	.globl _PSW
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _SBUF1
	.globl _SCON1
	.globl _GPIFSGLDATLNOX
	.globl _GPIFSGLDATLX
	.globl _GPIFSGLDATH
	.globl _GPIFTRIG
	.globl _EP01STAT
	.globl _IP
	.globl _OEE
	.globl _OED
	.globl _OEC
	.globl _OEB
	.globl _OEA
	.globl _IOE
	.globl _IOD
	.globl _AUTOPTRSETUP
	.globl _EP68FIFOFLGS
	.globl _EP24FIFOFLGS
	.globl _EP2468STAT
	.globl _IE
	.globl _INT4CLR
	.globl _INT2CLR
	.globl _IOC
	.globl _AUTOPTRL2
	.globl _AUTOPTRH2
	.globl _AUTOPTRL1
	.globl _AUTOPTRH1
	.globl _SBUF0
	.globl _SCON0
	.globl __XPAGE
	.globl _MPAGE
	.globl _EXIF
	.globl _IOB
	.globl _CKCON
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPS
	.globl _DPH1
	.globl _DPL1
	.globl _DPH0
	.globl _DPL0
	.globl _SP
	.globl _IOA
	.globl _ISOFRAME_COUNTER
	.globl _ep0_vendor_cmd_setup
	.globl _ep0_prev_setup_request
	.globl _ep0_payload_transfer
	.globl _ep0_payload_remaining
	.globl _SN_STRING
	.globl _MODULE_RESERVED
	.globl _INTERFACE_CAPABILITIES
	.globl _INTERFACE_VERSION
	.globl _FW_VERSION
	.globl _PRODUCT_ID
	.globl _ZTEXID
	.globl _ZTEX_DESCRIPTOR_VERSION
	.globl _ZTEX_DESCRIPTOR
	.globl _debug_read_addr
	.globl _debug_msg_buf
	.globl _debug_stack_ptr
	.globl _debug_stack
	.globl _debug_msg_size
	.globl _debug_stack_size
	.globl _debug_counter
	.globl _eeprom_write_checksum
	.globl _eeprom_write_bytes
	.globl _eeprom_addr
	.globl _INTVEC_GPIFWF
	.globl _INTVEC_GPIFDONE
	.globl _INTVEC_EP8FF
	.globl _INTVEC_EP6FF
	.globl _INTVEC_EP2FF
	.globl _INTVEC_EP8EF
	.globl _INTVEC_EP6EF
	.globl _INTVEC_EP4EF
	.globl _INTVEC_EP2EF
	.globl _INTVEC_EP8PF
	.globl _INTVEC_EP6PF
	.globl _INTVEC_EP4PF
	.globl _INTVEC_EP2PF
	.globl _INTVEC_EP8ISOERR
	.globl _INTVEC_EP6ISOERR
	.globl _INTVEC_EP4ISOERR
	.globl _INTVEC_EP2ISOERR
	.globl _INTVEC_ERRLIMIT
	.globl _INTVEC_EP8PING
	.globl _INTVEC_EP6PING
	.globl _INTVEC_EP4PING
	.globl _INTVEC_EP2PING
	.globl _INTVEC_EP1PING
	.globl _INTVEC_EP0PING
	.globl _INTVEC_IBN
	.globl _INTVEC_EP8
	.globl _INTVEC_EP6
	.globl _INTVEC_EP4
	.globl _INTVEC_EP2
	.globl _INTVEC_EP1OUT
	.globl _INTVEC_EP1IN
	.globl _INTVEC_EP0OUT
	.globl _INTVEC_EP0IN
	.globl _INTVEC_EP0ACK
	.globl _INTVEC_HISPEED
	.globl _INTVEC_USBRESET
	.globl _INTVEC_SUSPEND
	.globl _INTVEC_SUTOK
	.globl _INTVEC_SOF
	.globl _INTVEC_SUDAV
	.globl _INT12VEC_IE6
	.globl _INT11VEC_IE5
	.globl _INT10VEC_GPIF
	.globl _INT9VEC_I2C
	.globl _INT8VEC_USB
	.globl _INT7VEC_USART1
	.globl _INT6VEC_RESUME
	.globl _INT5VEC_T2
	.globl _INT4VEC_USART0
	.globl _INT3VEC_T1
	.globl _INT2VEC_IE1
	.globl _INT1VEC_T0
	.globl _INT0VEC_IE0
	.globl _EP8FIFOBUF
	.globl _EP6FIFOBUF
	.globl _EP4FIFOBUF
	.globl _EP2FIFOBUF
	.globl _EP1INBUF
	.globl _EP1OUTBUF
	.globl _EP0BUF
	.globl _GPIFABORT
	.globl _GPIFREADYSTAT
	.globl _GPIFREADYCFG
	.globl _XGPIFSGLDATLNOX
	.globl _XGPIFSGLDATLX
	.globl _XGPIFSGLDATH
	.globl _EP8GPIFTRIG
	.globl _EP8GPIFPFSTOP
	.globl _EP8GPIFFLGSEL
	.globl _EP6GPIFTRIG
	.globl _EP6GPIFPFSTOP
	.globl _EP6GPIFFLGSEL
	.globl _EP4GPIFTRIG
	.globl _EP4GPIFPFSTOP
	.globl _EP4GPIFFLGSEL
	.globl _EP2GPIFTRIG
	.globl _EP2GPIFPFSTOP
	.globl _EP2GPIFFLGSEL
	.globl _GPIFTCB0
	.globl _GPIFTCB1
	.globl _GPIFTCB2
	.globl _GPIFTCB3
	.globl _FLOWSTBHPERIOD
	.globl _FLOWSTBEDGE
	.globl _FLOWSTB
	.globl _FLOWHOLDOFF
	.globl _FLOWEQ1CTL
	.globl _FLOWEQ0CTL
	.globl _FLOWLOGIC
	.globl _FLOWSTATE
	.globl _GPIFADRL
	.globl _GPIFADRH
	.globl _GPIFCTLCFG
	.globl _GPIFIDLECTL
	.globl _GPIFIDLECS
	.globl _GPIFWFSELECT
	.globl _wLengthH
	.globl _wLengthL
	.globl _wIndexH
	.globl _wIndexL
	.globl _wValueH
	.globl _wValueL
	.globl _bRequest
	.globl _bmRequestType
	.globl _SETUPDAT
	.globl _SUDPTRCTL
	.globl _SUDPTRL
	.globl _SUDPTRH
	.globl _EP8FIFOBCL
	.globl _EP8FIFOBCH
	.globl _EP6FIFOBCL
	.globl _EP6FIFOBCH
	.globl _EP4FIFOBCL
	.globl _EP4FIFOBCH
	.globl _EP2FIFOBCL
	.globl _EP2FIFOBCH
	.globl _EP8FIFOFLGS
	.globl _EP6FIFOFLGS
	.globl _EP4FIFOFLGS
	.globl _EP2FIFOFLGS
	.globl _EP8CS
	.globl _EP6CS
	.globl _EP4CS
	.globl _EP2CS
	.globl _EPXCS
	.globl _EP1INCS
	.globl _EP1OUTCS
	.globl _EP0CS
	.globl _EP8BCL
	.globl _EP8BCH
	.globl _EP6BCL
	.globl _EP6BCH
	.globl _EP4BCL
	.globl _EP4BCH
	.globl _EP2BCL
	.globl _EP2BCH
	.globl _EP1INBC
	.globl _EP1OUTBC
	.globl _EP0BCL
	.globl _EP0BCH
	.globl _FNADDR
	.globl _MICROFRAME
	.globl _USBFRAMEL
	.globl _USBFRAMEH
	.globl _TOGCTL
	.globl _WAKEUPCS
	.globl _SUSPEND
	.globl _USBCS
	.globl _UDMACRCQUALIFIER
	.globl _UDMACRCL
	.globl _UDMACRCH
	.globl _EXTAUTODAT2
	.globl _XAUTODAT2
	.globl _EXTAUTODAT1
	.globl _XAUTODAT1
	.globl _I2CTL
	.globl _I2DAT
	.globl _I2CS
	.globl _PORTECFG
	.globl _PORTCCFG
	.globl _PORTACFG
	.globl _INTSETUP
	.globl _INT4IVEC
	.globl _INT2IVEC
	.globl _CLRERRCNT
	.globl _ERRCNTLIM
	.globl _USBERRIRQ
	.globl _USBERRIE
	.globl _GPIFIRQ
	.globl _GPIFIE
	.globl _EPIRQ
	.globl _EPIE
	.globl _USBIRQ
	.globl _USBIE
	.globl _NAKIRQ
	.globl _NAKIE
	.globl _IBNIRQ
	.globl _IBNIE
	.globl _EP8FIFOIRQ
	.globl _EP8FIFOIE
	.globl _EP6FIFOIRQ
	.globl _EP6FIFOIE
	.globl _EP4FIFOIRQ
	.globl _EP4FIFOIE
	.globl _EP2FIFOIRQ
	.globl _EP2FIFOIE
	.globl _OUTPKTEND
	.globl _INPKTEND
	.globl _EP8ISOINPKTS
	.globl _EP6ISOINPKTS
	.globl _EP4ISOINPKTS
	.globl _EP2ISOINPKTS
	.globl _EP8FIFOPFL
	.globl _EP8FIFOPFH
	.globl _EP6FIFOPFL
	.globl _EP6FIFOPFH
	.globl _EP4FIFOPFL
	.globl _EP4FIFOPFH
	.globl _EP2FIFOPFL
	.globl _EP2FIFOPFH
	.globl _ECC2B2
	.globl _ECC2B1
	.globl _ECC2B0
	.globl _ECC1B2
	.globl _ECC1B1
	.globl _ECC1B0
	.globl _ECCRESET
	.globl _ECCCFG
	.globl _EP8AUTOINLENL
	.globl _EP8AUTOINLENH
	.globl _EP6AUTOINLENL
	.globl _EP6AUTOINLENH
	.globl _EP4AUTOINLENL
	.globl _EP4AUTOINLENH
	.globl _EP2AUTOINLENL
	.globl _EP2AUTOINLENH
	.globl _EP8FIFOCFG
	.globl _EP6FIFOCFG
	.globl _EP4FIFOCFG
	.globl _EP2FIFOCFG
	.globl _EP8CFG
	.globl _EP6CFG
	.globl _EP4CFG
	.globl _EP2CFG
	.globl _EP1INCFG
	.globl _EP1OUTCFG
	.globl _GPIFHOLDAMOUNT
	.globl _REVCTL
	.globl _REVID
	.globl _FIFOPINPOLAR
	.globl _UART230
	.globl _BPADDRL
	.globl _BPADDRH
	.globl _BREAKPT
	.globl _FIFORESET
	.globl _PINFLAGSCD
	.globl _PINFLAGSAB
	.globl _IFCONFIG
	.globl _CPUCS
	.globl _GPCR2
	.globl _GPIF_WAVE3_DATA
	.globl _GPIF_WAVE2_DATA
	.globl _GPIF_WAVE1_DATA
	.globl _GPIF_WAVE0_DATA
	.globl _GPIF_WAVE_DATA
	.globl _eeprom_write_PARM_3
	.globl _eeprom_write_PARM_2
	.globl _eeprom_read_PARM_3
	.globl _eeprom_read_PARM_2
	.globl _eeprom_select_PARM_2
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_IOA	=	0x0080
_SP	=	0x0081
_DPL0	=	0x0082
_DPH0	=	0x0083
_DPL1	=	0x0084
_DPH1	=	0x0085
_DPS	=	0x0086
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_CKCON	=	0x008e
_IOB	=	0x0090
_EXIF	=	0x0091
_MPAGE	=	0x0092
__XPAGE	=	0x0092
_SCON0	=	0x0098
_SBUF0	=	0x0099
_AUTOPTRH1	=	0x009a
_AUTOPTRL1	=	0x009b
_AUTOPTRH2	=	0x009d
_AUTOPTRL2	=	0x009e
_IOC	=	0x00a0
_INT2CLR	=	0x00a1
_INT4CLR	=	0x00a2
_IE	=	0x00a8
_EP2468STAT	=	0x00aa
_EP24FIFOFLGS	=	0x00ab
_EP68FIFOFLGS	=	0x00ac
_AUTOPTRSETUP	=	0x00af
_IOD	=	0x00b0
_IOE	=	0x00b1
_OEA	=	0x00b2
_OEB	=	0x00b3
_OEC	=	0x00b4
_OED	=	0x00b5
_OEE	=	0x00b6
_IP	=	0x00b8
_EP01STAT	=	0x00ba
_GPIFTRIG	=	0x00bb
_GPIFSGLDATH	=	0x00bd
_GPIFSGLDATLX	=	0x00be
_GPIFSGLDATLNOX	=	0x00bf
_SCON1	=	0x00c0
_SBUF1	=	0x00c1
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
_PSW	=	0x00d0
_EICON	=	0x00d8
_ACC	=	0x00e0
_EIE	=	0x00e8
_BREG	=	0x00f0
_EIP	=	0x00f8
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_IOA0	=	0x0080
_IOA1	=	0x0081
_IOA2	=	0x0082
_IOA3	=	0x0083
_IOA4	=	0x0084
_IOA5	=	0x0085
_IOA6	=	0x0086
_IOA7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_IOB0	=	0x0090
_IOB1	=	0x0091
_IOB2	=	0x0092
_IOB3	=	0x0093
_IOB4	=	0x0094
_IOB5	=	0x0095
_IOB6	=	0x0096
_IOB7	=	0x0097
_RI_0	=	0x0098
_TI_0	=	0x0099
_RB8_0	=	0x009a
_TB8_0	=	0x009b
_REN_0	=	0x009c
_SM2_0	=	0x009d
_SM1_0	=	0x009e
_SM0_0	=	0x009f
_IOC0	=	0x00a0
_IOC1	=	0x00a1
_IOC2	=	0x00a2
_IOC3	=	0x00a3
_IOC4	=	0x00a4
_IOC5	=	0x00a5
_IOC6	=	0x00a6
_IOC7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES0	=	0x00ac
_ET2	=	0x00ad
_ES1	=	0x00ae
_EA	=	0x00af
_IOD0	=	0x00b0
_IOD1	=	0x00b1
_IOD2	=	0x00b2
_IOD3	=	0x00b3
_IOD4	=	0x00b4
_IOD5	=	0x00b5
_IOD6	=	0x00b6
_IOD7	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS0	=	0x00bc
_PT2	=	0x00bd
_PS1	=	0x00be
_RI_1	=	0x00c0
_TI_1	=	0x00c1
_RB8_1	=	0x00c2
_TB8_1	=	0x00c3
_REN_1	=	0x00c4
_SM2_1	=	0x00c5
_SM1_1	=	0x00c6
_SM0_1	=	0x00c7
_CPRL2	=	0x00c8
_CT2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
_PF	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_INT6	=	0x00db
_RESI	=	0x00dc
_ERESI	=	0x00dd
_SMOD1	=	0x00df
_ACC0	=	0x00e0
_ACC1	=	0x00e1
_ACC2	=	0x00e2
_ACC3	=	0x00e3
_ACC4	=	0x00e4
_ACC5	=	0x00e5
_ACC6	=	0x00e6
_ACC7	=	0x00e7
_EUSB	=	0x00e8
_EI2C	=	0x00e9
_EIEX4	=	0x00ea
_EIEX5	=	0x00eb
_EIEX6	=	0x00ec
_BREG0	=	0x00f0
_BREG1	=	0x00f1
_BREG2	=	0x00f2
_BREG3	=	0x00f3
_BREG4	=	0x00f4
_BREG5	=	0x00f5
_BREG6	=	0x00f6
_BREG7	=	0x00f7
_PUSB	=	0x00f8
_PI2C	=	0x00f9
_EIPX4	=	0x00fa
_EIPX5	=	0x00fb
_EIPX6	=	0x00fc
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; overlayable bit register bank
;--------------------------------------------------------
	.area BIT_BANK	(REL,OVR,DATA)
bits:
	.ds 1
	b0 = bits[0]
	b1 = bits[1]
	b2 = bits[2]
	b3 = bits[3]
	b4 = bits[4]
	b5 = bits[5]
	b6 = bits[6]
	b7 = bits[7]
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_eeprom_select_PARM_2:
	.ds 1
_eeprom_read_PARM_2:
	.ds 2
_eeprom_read_PARM_3:
	.ds 1
_eeprom_write_PARM_2:
	.ds 2
_eeprom_write_PARM_3:
	.ds 1
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
	.area	OSEG    (OVR,DATA)
_sendStringDescriptor_PARM_2::
	.ds 1
_sendStringDescriptor_PARM_3::
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_GPIF_WAVE_DATA	=	0xe400
_GPIF_WAVE0_DATA	=	0xe400
_GPIF_WAVE1_DATA	=	0xe420
_GPIF_WAVE2_DATA	=	0xe440
_GPIF_WAVE3_DATA	=	0xe460
_GPCR2	=	0xe50d
_CPUCS	=	0xe600
_IFCONFIG	=	0xe601
_PINFLAGSAB	=	0xe602
_PINFLAGSCD	=	0xe603
_FIFORESET	=	0xe604
_BREAKPT	=	0xe605
_BPADDRH	=	0xe606
_BPADDRL	=	0xe607
_UART230	=	0xe608
_FIFOPINPOLAR	=	0xe609
_REVID	=	0xe60a
_REVCTL	=	0xe60b
_GPIFHOLDAMOUNT	=	0xe60c
_EP1OUTCFG	=	0xe610
_EP1INCFG	=	0xe611
_EP2CFG	=	0xe612
_EP4CFG	=	0xe613
_EP6CFG	=	0xe614
_EP8CFG	=	0xe615
_EP2FIFOCFG	=	0xe618
_EP4FIFOCFG	=	0xe619
_EP6FIFOCFG	=	0xe61a
_EP8FIFOCFG	=	0xe61b
_EP2AUTOINLENH	=	0xe620
_EP2AUTOINLENL	=	0xe621
_EP4AUTOINLENH	=	0xe622
_EP4AUTOINLENL	=	0xe623
_EP6AUTOINLENH	=	0xe624
_EP6AUTOINLENL	=	0xe625
_EP8AUTOINLENH	=	0xe626
_EP8AUTOINLENL	=	0xe627
_ECCCFG	=	0xe628
_ECCRESET	=	0xe629
_ECC1B0	=	0xe62a
_ECC1B1	=	0xe62b
_ECC1B2	=	0xe62c
_ECC2B0	=	0xe62d
_ECC2B1	=	0xe62e
_ECC2B2	=	0xe62f
_EP2FIFOPFH	=	0xe630
_EP2FIFOPFL	=	0xe631
_EP4FIFOPFH	=	0xe632
_EP4FIFOPFL	=	0xe633
_EP6FIFOPFH	=	0xe634
_EP6FIFOPFL	=	0xe635
_EP8FIFOPFH	=	0xe636
_EP8FIFOPFL	=	0xe637
_EP2ISOINPKTS	=	0xe640
_EP4ISOINPKTS	=	0xe641
_EP6ISOINPKTS	=	0xe642
_EP8ISOINPKTS	=	0xe643
_INPKTEND	=	0xe648
_OUTPKTEND	=	0xe649
_EP2FIFOIE	=	0xe650
_EP2FIFOIRQ	=	0xe651
_EP4FIFOIE	=	0xe652
_EP4FIFOIRQ	=	0xe653
_EP6FIFOIE	=	0xe654
_EP6FIFOIRQ	=	0xe655
_EP8FIFOIE	=	0xe656
_EP8FIFOIRQ	=	0xe657
_IBNIE	=	0xe658
_IBNIRQ	=	0xe659
_NAKIE	=	0xe65a
_NAKIRQ	=	0xe65b
_USBIE	=	0xe65c
_USBIRQ	=	0xe65d
_EPIE	=	0xe65e
_EPIRQ	=	0xe65f
_GPIFIE	=	0xe660
_GPIFIRQ	=	0xe661
_USBERRIE	=	0xe662
_USBERRIRQ	=	0xe663
_ERRCNTLIM	=	0xe664
_CLRERRCNT	=	0xe665
_INT2IVEC	=	0xe666
_INT4IVEC	=	0xe667
_INTSETUP	=	0xe668
_PORTACFG	=	0xe670
_PORTCCFG	=	0xe671
_PORTECFG	=	0xe672
_I2CS	=	0xe678
_I2DAT	=	0xe679
_I2CTL	=	0xe67a
_XAUTODAT1	=	0xe67b
_EXTAUTODAT1	=	0xe67b
_XAUTODAT2	=	0xe67c
_EXTAUTODAT2	=	0xe67c
_UDMACRCH	=	0xe67d
_UDMACRCL	=	0xe67e
_UDMACRCQUALIFIER	=	0xe67f
_USBCS	=	0xe680
_SUSPEND	=	0xe681
_WAKEUPCS	=	0xe682
_TOGCTL	=	0xe683
_USBFRAMEH	=	0xe684
_USBFRAMEL	=	0xe685
_MICROFRAME	=	0xe686
_FNADDR	=	0xe687
_EP0BCH	=	0xe68a
_EP0BCL	=	0xe68b
_EP1OUTBC	=	0xe68d
_EP1INBC	=	0xe68f
_EP2BCH	=	0xe690
_EP2BCL	=	0xe691
_EP4BCH	=	0xe694
_EP4BCL	=	0xe695
_EP6BCH	=	0xe698
_EP6BCL	=	0xe699
_EP8BCH	=	0xe69c
_EP8BCL	=	0xe69d
_EP0CS	=	0xe6a0
_EP1OUTCS	=	0xe6a1
_EP1INCS	=	0xe6a2
_EPXCS	=	0xe6a3
_EP2CS	=	0xe6a3
_EP4CS	=	0xe6a4
_EP6CS	=	0xe6a5
_EP8CS	=	0xe6a6
_EP2FIFOFLGS	=	0xe6a7
_EP4FIFOFLGS	=	0xe6a8
_EP6FIFOFLGS	=	0xe6a9
_EP8FIFOFLGS	=	0xe6aa
_EP2FIFOBCH	=	0xe6ab
_EP2FIFOBCL	=	0xe6ac
_EP4FIFOBCH	=	0xe6ad
_EP4FIFOBCL	=	0xe6ae
_EP6FIFOBCH	=	0xe6af
_EP6FIFOBCL	=	0xe6b0
_EP8FIFOBCH	=	0xe6b1
_EP8FIFOBCL	=	0xe6b2
_SUDPTRH	=	0xe6b3
_SUDPTRL	=	0xe6b4
_SUDPTRCTL	=	0xe6b5
_SETUPDAT	=	0xe6b8
_bmRequestType	=	0xe6b8
_bRequest	=	0xe6b9
_wValueL	=	0xe6ba
_wValueH	=	0xe6bb
_wIndexL	=	0xe6bc
_wIndexH	=	0xe6bd
_wLengthL	=	0xe6be
_wLengthH	=	0xe6bf
_GPIFWFSELECT	=	0xe6c0
_GPIFIDLECS	=	0xe6c1
_GPIFIDLECTL	=	0xe6c2
_GPIFCTLCFG	=	0xe6c3
_GPIFADRH	=	0xe6c4
_GPIFADRL	=	0xe6c5
_FLOWSTATE	=	0xe6c6
_FLOWLOGIC	=	0xe6c7
_FLOWEQ0CTL	=	0xe6c8
_FLOWEQ1CTL	=	0xe6c9
_FLOWHOLDOFF	=	0xe6ca
_FLOWSTB	=	0xe6cb
_FLOWSTBEDGE	=	0xe6cc
_FLOWSTBHPERIOD	=	0xe6cd
_GPIFTCB3	=	0xe6ce
_GPIFTCB2	=	0xe6cf
_GPIFTCB1	=	0xe6d0
_GPIFTCB0	=	0xe6d1
_EP2GPIFFLGSEL	=	0xe6d2
_EP2GPIFPFSTOP	=	0xe6d3
_EP2GPIFTRIG	=	0xe6d4
_EP4GPIFFLGSEL	=	0xe6da
_EP4GPIFPFSTOP	=	0xe6db
_EP4GPIFTRIG	=	0xe6dc
_EP6GPIFFLGSEL	=	0xe6e2
_EP6GPIFPFSTOP	=	0xe6e3
_EP6GPIFTRIG	=	0xe6e4
_EP8GPIFFLGSEL	=	0xe6ea
_EP8GPIFPFSTOP	=	0xe6eb
_EP8GPIFTRIG	=	0xe6ec
_XGPIFSGLDATH	=	0xe6f0
_XGPIFSGLDATLX	=	0xe6f1
_XGPIFSGLDATLNOX	=	0xe6f2
_GPIFREADYCFG	=	0xe6f3
_GPIFREADYSTAT	=	0xe6f4
_GPIFABORT	=	0xe6f5
_EP0BUF	=	0xe740
_EP1OUTBUF	=	0xe780
_EP1INBUF	=	0xe7c0
_EP2FIFOBUF	=	0xf000
_EP4FIFOBUF	=	0xf400
_EP6FIFOBUF	=	0xf800
_EP8FIFOBUF	=	0xfc00
_INT0VEC_IE0	=	0x0003
_INT1VEC_T0	=	0x000b
_INT2VEC_IE1	=	0x0013
_INT3VEC_T1	=	0x001b
_INT4VEC_USART0	=	0x0023
_INT5VEC_T2	=	0x002b
_INT6VEC_RESUME	=	0x0033
_INT7VEC_USART1	=	0x003b
_INT8VEC_USB	=	0x0043
_INT9VEC_I2C	=	0x004b
_INT10VEC_GPIF	=	0x0053
_INT11VEC_IE5	=	0x005b
_INT12VEC_IE6	=	0x0063
_INTVEC_SUDAV	=	0x0100
_INTVEC_SOF	=	0x0104
_INTVEC_SUTOK	=	0x0108
_INTVEC_SUSPEND	=	0x010c
_INTVEC_USBRESET	=	0x0110
_INTVEC_HISPEED	=	0x0114
_INTVEC_EP0ACK	=	0x0118
_INTVEC_EP0IN	=	0x0120
_INTVEC_EP0OUT	=	0x0124
_INTVEC_EP1IN	=	0x0128
_INTVEC_EP1OUT	=	0x012c
_INTVEC_EP2	=	0x0130
_INTVEC_EP4	=	0x0134
_INTVEC_EP6	=	0x0138
_INTVEC_EP8	=	0x013c
_INTVEC_IBN	=	0x0140
_INTVEC_EP0PING	=	0x0148
_INTVEC_EP1PING	=	0x014c
_INTVEC_EP2PING	=	0x0150
_INTVEC_EP4PING	=	0x0154
_INTVEC_EP6PING	=	0x0158
_INTVEC_EP8PING	=	0x015c
_INTVEC_ERRLIMIT	=	0x0160
_INTVEC_EP2ISOERR	=	0x0170
_INTVEC_EP4ISOERR	=	0x0174
_INTVEC_EP6ISOERR	=	0x0178
_INTVEC_EP8ISOERR	=	0x017c
_INTVEC_EP2PF	=	0x0180
_INTVEC_EP4PF	=	0x0184
_INTVEC_EP6PF	=	0x0188
_INTVEC_EP8PF	=	0x018c
_INTVEC_EP2EF	=	0x0190
_INTVEC_EP4EF	=	0x0194
_INTVEC_EP6EF	=	0x0198
_INTVEC_EP8EF	=	0x019c
_INTVEC_EP2FF	=	0x01a0
_INTVEC_EP6FF	=	0x01a8
_INTVEC_EP8FF	=	0x01ac
_INTVEC_GPIFDONE	=	0x01b0
_INTVEC_GPIFWF	=	0x01b4
_eeprom_addr::
	.ds 2
_eeprom_write_bytes::
	.ds 2
_eeprom_write_checksum::
	.ds 1
_debug_counter::
	.ds 2
_debug_stack_size::
	.ds 1
_debug_msg_size::
	.ds 1
_debug_stack::
	.ds 96
_debug_stack_ptr::
	.ds 2
_debug_msg_buf::
	.ds 3
_debug_read_addr::
	.ds 2
_ZTEX_DESCRIPTOR	=	0x006c
_ZTEX_DESCRIPTOR_VERSION	=	0x006d
_ZTEXID	=	0x006e
_PRODUCT_ID	=	0x0072
_FW_VERSION	=	0x0076
_INTERFACE_VERSION	=	0x0077
_INTERFACE_CAPABILITIES	=	0x0078
_MODULE_RESERVED	=	0x007e
_SN_STRING	=	0x008a
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
_ep0_payload_remaining::
	.ds 2
_ep0_payload_transfer::
	.ds 1
_ep0_prev_setup_request::
	.ds 1
_ep0_vendor_cmd_setup::
	.ds 1
_ISOFRAME_COUNTER::
	.ds 8
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'abscode_intvec'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ezintavecs.h:92: void abscode_intvec() _naked
;	-----------------------------------------
;	 function abscode_intvec
;	-----------------------------------------
_abscode_intvec:
;	naked function: no prologue.
;	../../../include/ezintavecs.h:317: ERROR: no line number 317 in file ../../../include/ezintavecs.h
	
	    .area ABSCODE (ABS,CODE)
	    .org 0x0000
	ENTRY:
	 ljmp #0x0200
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0003
;	# 34 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x000b
;	# 35 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0013
;	# 36 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x001b
;	# 37 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0023
;	# 38 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x002b
;	# 39 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0033
;	# 40 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x003b
;	# 41 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0043
;	# 42 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x004b
;	# 43 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0053
;	# 44 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x005b
;	# 45 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0063
;	# 46 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0100
;	# 47 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0104
;	# 48 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0108
;	# 49 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x010C
;	# 50 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0110
;	# 51 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0114
;	# 52 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0118
;	# 53 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0120
;	# 54 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0124
;	# 55 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0128
;	# 56 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x012C
;	# 57 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0130
;	# 58 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0134
;	# 59 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0138
;	# 60 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x013C
;	# 61 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0140
;	# 62 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0148
;	# 63 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x014C
;	# 64 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0150
;	# 65 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0154
;	# 66 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0158
;	# 67 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x015C
;	# 68 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0160
;	# 69 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0170
;	# 70 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0174
;	# 71 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0178
;	# 72 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x017C
;	# 73 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0180
;	# 74 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0184
;	# 75 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0188
;	# 76 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x018C
;	# 77 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0190
;	# 78 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0194
;	# 79 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x0198
;	# 80 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x019C
;	# 81 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x01A0
;	# 82 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x01A8
;	# 83 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x01AC
;	# 84 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x01B0
;	# 85 "../../../include/ezintavecs.h"
	 reti
;	# 94 "../../../include/ezintavecs.h"
	    .org 0x01B4
;	# 101 "../../../include/ezintavecs.h"
	 reti
	    .org 0x01b8
	INTVEC_DUMMY:
	        reti
	    .area CSEG (CODE)
	    
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'wait'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;i                         Allocated to registers r6 r7 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	-----------------------------------------
;	 function wait
;	-----------------------------------------
_wait:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
	mov	r2,dpl
	mov	r3,dph
;	../../../include/ztex-utils.h:80: for (j=0; j<ms; j++) 
	mov	r4,#0x00
	mov	r5,#0x00
00104$:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	00108$
;	../../../include/ztex-utils.h:81: for (i=0; i<1200; i++);
	mov	r6,#0xB0
	mov	r7,#0x04
00103$:
	dec	r6
	cjne	r6,#0xff,00117$
	dec	r7
00117$:
	mov	a,r6
	orl	a,r7
	jnz	00103$
;	../../../include/ztex-utils.h:80: for (j=0; j<ms; j++) 
	inc	r4
	cjne	r4,#0x00,00104$
	inc	r5
	sjmp	00104$
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'uwait'
;------------------------------------------------------------
;us                        Allocated to registers r2 r3 
;i                         Allocated to registers r6 r7 
;j                         Allocated to registers r4 r5 
;------------------------------------------------------------
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	-----------------------------------------
;	 function uwait
;	-----------------------------------------
_uwait:
	mov	r2,dpl
	mov	r3,dph
;	../../../include/ztex-utils.h:90: for (j=0; j<us; j++) 
	mov	r4,#0x00
	mov	r5,#0x00
00104$:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	00108$
;	../../../include/ztex-utils.h:91: for (i=0; i<10; i++);
	mov	r6,#0x0A
	mov	r7,#0x00
00103$:
	dec	r6
	cjne	r6,#0xff,00117$
	dec	r7
00117$:
	mov	a,r6
	orl	a,r7
	jnz	00103$
;	../../../include/ztex-utils.h:90: for (j=0; j<us; j++) 
	inc	r4
	cjne	r4,#0x00,00104$
	inc	r5
	sjmp	00104$
00108$:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'MEM_COPY1_int'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-utils.h:99: void MEM_COPY1_int() __naked {
;	-----------------------------------------
;	 function MEM_COPY1_int
;	-----------------------------------------
_MEM_COPY1_int:
;	naked function: no prologue.
;	../../../include/ztex-utils.h:109: _endasm;
	
	020001$:
	     mov _AUTOPTRSETUP,#0x07
	     mov dptr,#_XAUTODAT1
	     movx a,@dptr
	     mov dptr,#_XAUTODAT2
	     movx @dptr,a
	     djnz r2, 020001$
	     ret
	 
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitWrite'
;------------------------------------------------------------
;i2csbuf                   Allocated to registers r2 
;toc                       Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:41: BYTE i2c_waitWrite()
;	-----------------------------------------
;	 function i2c_waitWrite
;	-----------------------------------------
_i2c_waitWrite:
;	../../../include/ztex-eeprom.h:44: for ( toc=0; toc<255 && !(I2CS & bmBIT0); toc++ );
	mov	r2,#0x00
00105$:
	cjne	r2,#0xFF,00116$
00116$:
	jnc	00108$
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r3,a
	jb	acc.0,00108$
	inc	r2
	sjmp	00105$
00108$:
;	../../../include/ztex-eeprom.h:45: i2csbuf = I2CS;
	mov	dptr,#_I2CS
	movx	a,@dptr
;	../../../include/ztex-eeprom.h:46: if ( (i2csbuf & bmBIT2) || (!(i2csbuf & bmBIT1)) ) {
	mov	r2,a
	jb	acc.2,00101$
	mov	a,r2
	jb	acc.1,00102$
00101$:
;	../../../include/ztex-eeprom.h:47: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:48: return 1;
	mov	dpl,#0x01
;	../../../include/ztex-eeprom.h:50: return 0;
	ret
00102$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitRead'
;------------------------------------------------------------
;i2csbuf                   Allocated to registers r2 
;toc                       Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:57: BYTE i2c_waitRead(void)
;	-----------------------------------------
;	 function i2c_waitRead
;	-----------------------------------------
_i2c_waitRead:
;	../../../include/ztex-eeprom.h:60: for ( toc=0; toc<255 && !(I2CS & bmBIT0); toc++ );
	mov	r2,#0x00
00104$:
	cjne	r2,#0xFF,00115$
00115$:
	jnc	00107$
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r3,a
	jb	acc.0,00107$
	inc	r2
	sjmp	00104$
00107$:
;	../../../include/ztex-eeprom.h:61: i2csbuf = I2CS;
	mov	dptr,#_I2CS
	movx	a,@dptr
;	../../../include/ztex-eeprom.h:62: if (i2csbuf & bmBIT2) {
	mov	r2,a
	jnb	acc.2,00102$
;	../../../include/ztex-eeprom.h:63: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:64: return 1;
	mov	dpl,#0x01
;	../../../include/ztex-eeprom.h:66: return 0;
	ret
00102$:
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitStart'
;------------------------------------------------------------
;toc                       Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:73: BYTE i2c_waitStart()
;	-----------------------------------------
;	 function i2c_waitStart
;	-----------------------------------------
_i2c_waitStart:
;	../../../include/ztex-eeprom.h:76: for ( toc=0; toc<255; toc++ ) {
	mov	r2,#0x00
00103$:
	cjne	r2,#0xFF,00112$
00112$:
	jnc	00106$
;	../../../include/ztex-eeprom.h:77: if ( ! (I2CS & bmBIT2) )
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r3,a
	jb	acc.2,00105$
;	../../../include/ztex-eeprom.h:78: return 0;
	mov	dpl,#0x00
	ret
00105$:
;	../../../include/ztex-eeprom.h:76: for ( toc=0; toc<255; toc++ ) {
	inc	r2
	sjmp	00103$
00106$:
;	../../../include/ztex-eeprom.h:80: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'i2c_waitStop'
;------------------------------------------------------------
;toc                       Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:87: BYTE i2c_waitStop()
;	-----------------------------------------
;	 function i2c_waitStop
;	-----------------------------------------
_i2c_waitStop:
;	../../../include/ztex-eeprom.h:90: for ( toc=0; toc<255; toc++ ) {
	mov	r2,#0x00
00103$:
	cjne	r2,#0xFF,00112$
00112$:
	jnc	00106$
;	../../../include/ztex-eeprom.h:91: if ( ! (I2CS & bmBIT6) )
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r3,a
	jb	acc.6,00105$
;	../../../include/ztex-eeprom.h:92: return 0;
	mov	dpl,#0x00
	ret
00105$:
;	../../../include/ztex-eeprom.h:90: for ( toc=0; toc<255; toc++ ) {
	inc	r2
	sjmp	00103$
00106$:
;	../../../include/ztex-eeprom.h:94: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_select'
;------------------------------------------------------------
;stop                      Allocated with name '_eeprom_select_PARM_2'
;to                        Allocated to registers r2 
;toc                       Allocated to registers 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:103: BYTE eeprom_select ( BYTE to, BYTE stop ) {
;	-----------------------------------------
;	 function eeprom_select
;	-----------------------------------------
_eeprom_select:
	mov	r2,dpl
;	../../../include/ztex-eeprom.h:105: eeprom_select_start:
	clr	c
	clr	a
	subb	a,r2
	clr	a
	rlc	a
	mov	r2,a
00101$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x80
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:107: i2c_waitStart();
	push	ar2
	lcall	_i2c_waitStart
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	mov	a,#0xA2
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:109: if ( ! i2c_waitWrite() ) {
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar2
	jnz	00107$
;	../../../include/ztex-eeprom.h:110: if ( stop ) {
	mov	a,_eeprom_select_PARM_2
	jz	00103$
;	../../../include/ztex-eeprom.h:111: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:112: i2c_waitStop();
	lcall	_i2c_waitStop
00103$:
;	../../../include/ztex-eeprom.h:114: return 0;
	mov	dpl,#0x00
	ret
00107$:
;	../../../include/ztex-eeprom.h:116: else if (toc<to) {
	mov	a,r2
	jz	00108$
;	../../../include/ztex-eeprom.h:117: uwait(10);
	mov	dptr,#0x000A
	push	ar2
	lcall	_uwait
	pop	ar2
;	../../../include/ztex-eeprom.h:118: goto eeprom_select_start;
	sjmp	00101$
00108$:
;	../../../include/ztex-eeprom.h:120: if ( stop ) {
	mov	a,_eeprom_select_PARM_2
	jz	00110$
;	../../../include/ztex-eeprom.h:121: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x40
	movx	@dptr,a
00110$:
;	../../../include/ztex-eeprom.h:123: return 1;
	mov	dpl,#0x01
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_read'
;------------------------------------------------------------
;addr                      Allocated with name '_eeprom_read_PARM_2'
;length                    Allocated with name '_eeprom_read_PARM_3'
;buf                       Allocated to registers r2 r3 
;bytes                     Allocated to registers r4 
;i                         Allocated to registers 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:131: BYTE eeprom_read ( __xdata BYTE *buf, WORD addr, BYTE length ) { 
;	-----------------------------------------
;	 function eeprom_read
;	-----------------------------------------
_eeprom_read:
	mov	r2,dpl
	mov	r3,dph
;	../../../include/ztex-eeprom.h:132: BYTE bytes = 0,i;
	mov	r4,#0x00
;	../../../include/ztex-eeprom.h:134: if ( length == 0 ) 
	mov	a,_eeprom_read_PARM_3
;	../../../include/ztex-eeprom.h:135: return 0;
	jnz	00102$
	mov	dpl,a
	ret
00102$:
;	../../../include/ztex-eeprom.h:137: if ( eeprom_select(100,0) ) 
	mov	_eeprom_select_PARM_2,#0x00
	mov	dpl,#0x64
	push	ar2
	push	ar3
	push	ar4
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jz	00134$
	ljmp	00117$
00134$:
;	../../../include/ztex-eeprom.h:30: ***** global variables **********************************************
	mov	dptr,#_I2DAT
	mov	a,(_eeprom_read_PARM_2 + 1)
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:141: if ( i2c_waitWrite() ) goto eeprom_read_end;
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jz	00135$
	ljmp	00117$
00135$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	mov	a,_eeprom_read_PARM_2
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:143: if ( i2c_waitWrite() ) goto eeprom_read_end;
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jz	00136$
	ljmp	00117$
00136$:
;	../../../include/ztex-eeprom.h:144: I2CS |= bmBIT6;
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:145: i2c_waitStop();
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitStop
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x80
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:148: i2c_waitStart();
	lcall	_i2c_waitStart
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	mov	a,#0xA3
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:150: if ( i2c_waitWrite() ) goto eeprom_read_end;
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00117$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:153: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00117$
	mov	r5,a
00118$:
;	../../../include/ztex-eeprom.h:154: for (; bytes<length; bytes++ ) {
	clr	c
	mov	a,r5
	subb	a,_eeprom_read_PARM_3
	jnc	00121$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	movx	a,@dptr
	mov	dpl,r2
	mov	dph,r3
	movx	@dptr,a
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
;	../../../include/ztex-eeprom.h:156: buf++;
;	../../../include/ztex-eeprom.h:157: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00117$
;	../../../include/ztex-eeprom.h:154: for (; bytes<length; bytes++ ) {
	inc	r5
	mov	ar4,r5
	sjmp	00118$
00121$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x20
	movx	@dptr,a
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	../../../include/ztex-eeprom.h:162: if ( i2c_waitRead()) goto eeprom_read_end; 
	push	ar4
	lcall	_i2c_waitRead
	mov	a,dpl
	pop	ar4
	jnz	00117$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
	mov	dptr,#_I2DAT
	movx	a,@dptr
;	../../../include/ztex-eeprom.h:166: i2c_waitStop();
	push	ar4
	lcall	_i2c_waitStop
	pop	ar4
;	../../../include/ztex-eeprom.h:168: eeprom_read_end:
00117$:
;	../../../include/ztex-eeprom.h:169: return bytes;
	mov	dpl,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_write'
;------------------------------------------------------------
;addr                      Allocated with name '_eeprom_write_PARM_2'
;length                    Allocated with name '_eeprom_write_PARM_3'
;buf                       Allocated to registers r2 r3 
;bytes                     Allocated to registers r4 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:178: BYTE eeprom_write ( __xdata BYTE *buf, WORD addr, BYTE length ) {
;	-----------------------------------------
;	 function eeprom_write
;	-----------------------------------------
_eeprom_write:
	mov	r2,dpl
	mov	r3,dph
;	../../../include/ztex-eeprom.h:179: BYTE bytes = 0;
	mov	r4,#0x00
;	../../../include/ztex-eeprom.h:181: if ( eeprom_select(100,0) ) 
	mov	_eeprom_select_PARM_2,#0x00
	mov	dpl,#0x64
	push	ar2
	push	ar3
	push	ar4
	lcall	_eeprom_select
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jz	00121$
	ljmp	00109$
00121$:
;	../../../include/ztex-eeprom.h:30: ***** global variables **********************************************
	mov	dptr,#_I2DAT
	mov	a,(_eeprom_write_PARM_2 + 1)
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:185: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jz	00122$
	ljmp	00109$
00122$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2DAT
	mov	a,_eeprom_write_PARM_2
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:187: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar2
	push	ar3
	push	ar4
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00109$
	mov	r5,a
00110$:
;	../../../include/ztex-eeprom.h:189: for (; bytes<length; bytes++ ) {
	clr	c
	mov	a,r5
	subb	a,_eeprom_write_PARM_3
	jnc	00113$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dpl,r2
	mov	dph,r3
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	mov	r2,dpl
	mov	r3,dph
	mov	dptr,#_I2DAT
	mov	a,r6
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:191: eeprom_write_checksum += *buf;
	mov	dptr,#_eeprom_write_checksum
	movx	a,@dptr
	mov	r7,a
	mov	a,r6
	add	a,r7
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:192: buf++;
;	../../../include/ztex-eeprom.h:193: eeprom_write_bytes+=1;
	mov	dptr,#_eeprom_write_bytes
	movx	a,@dptr
	mov	r6,a
	inc	dptr
	movx	a,@dptr
	mov	r7,a
	mov	dptr,#_eeprom_write_bytes
	mov	a,#0x01
	add	a,r6
	movx	@dptr,a
	clr	a
	addc	a,r7
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:194: if ( i2c_waitWrite() ) goto eeprom_write_end;
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	_i2c_waitWrite
	mov	a,dpl
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	jnz	00109$
;	../../../include/ztex-eeprom.h:189: for (; bytes<length; bytes++ ) {
	inc	r5
	mov	ar4,r5
	sjmp	00110$
00113$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_I2CS
	movx	a,@dptr
	orl	a,#0x40
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:197: i2c_waitStop();
	push	ar4
	lcall	_i2c_waitStop
	pop	ar4
;	../../../include/ztex-eeprom.h:199: eeprom_write_end:
00109$:
;	../../../include/ztex-eeprom.h:200: return bytes;
	mov	dpl,r4
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_read_ep0'
;------------------------------------------------------------
;i                         Allocated to registers r3 
;b                         Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:206: BYTE eeprom_read_ep0 () { 
;	-----------------------------------------
;	 function eeprom_read_ep0
;	-----------------------------------------
_eeprom_read_ep0:
;	../../../include/ztex-eeprom.h:208: b = ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
	mov	r2,a
;	../../../include/ztex-eeprom.h:209: i = eeprom_read(EP0BUF, eeprom_addr, b);
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	_eeprom_read_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(_eeprom_read_PARM_2 + 1),a
	mov	_eeprom_read_PARM_3,r2
	mov	dptr,#_EP0BUF
	push	ar2
	lcall	_eeprom_read
	mov	r3,dpl
	pop	ar2
;	../../../include/ztex-eeprom.h:210: eeprom_addr += b;
	mov	r4,#0x00
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dptr,#_eeprom_addr
	mov	a,r2
	add	a,r5
	movx	@dptr,a
	mov	a,r4
	addc	a,r6
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:211: return i;
	mov	dpl,r3
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'eeprom_write_ep0'
;------------------------------------------------------------
;length                    Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-eeprom.h:227: void eeprom_write_ep0 ( BYTE length ) { 	
;	-----------------------------------------
;	 function eeprom_write_ep0
;	-----------------------------------------
_eeprom_write_ep0:
	mov	r2,dpl
;	../../../include/ztex-eeprom.h:228: eeprom_write(EP0BUF, eeprom_addr, length);
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	_eeprom_write_PARM_2,a
	inc	dptr
	movx	a,@dptr
	mov	(_eeprom_write_PARM_2 + 1),a
	mov	_eeprom_write_PARM_3,r2
	mov	dptr,#_EP0BUF
	push	ar2
	lcall	_eeprom_write
	pop	ar2
;	../../../include/ztex-eeprom.h:229: eeprom_addr += length;
	mov	r3,#0x00
	mov	dptr,#_eeprom_addr
	movx	a,@dptr
	mov	r4,a
	inc	dptr
	movx	a,@dptr
	mov	r5,a
	mov	dptr,#_eeprom_addr
	mov	a,r2
	add	a,r4
	movx	@dptr,a
	mov	a,r3
	addc	a,r5
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'debug_add_msg'
;------------------------------------------------------------
;i                         Allocated to registers r4 
;------------------------------------------------------------
;	../../../include/ztex-debug.h:48: void debug_add_msg () {
;	-----------------------------------------
;	 function debug_add_msg
;	-----------------------------------------
_debug_add_msg:
;	../../../include/ztex-debug.h:50: i = debug_counter % DEBUG_STACK_SIZE;
	mov	dptr,#_debug_counter
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	a,#0x1F
	anl	a,r2
;	../../../include/ztex-debug.h:51: debug_stack_ptr = &debug_stack[i*DEBUG_MSG_SIZE];
	mov	b,#0x03
	mul	ab
	add	a,#_debug_stack
	mov	r4,a
	clr	a
	addc	a,#(_debug_stack >> 8)
	mov	r5,a
	mov	dptr,#_debug_stack_ptr
	mov	a,r4
	movx	@dptr,a
	inc	dptr
	mov	a,r5
	movx	@dptr,a
;	../../../include/ztex-utils.h:120: AUTOPTRL1=LO(&($0));
	mov	_AUTOPTRL1,#_debug_msg_buf
;	../../../include/ztex-utils.h:121: AUTOPTRH1=HI(&($0));
	mov	r6,#_debug_msg_buf
	mov	r7,#(_debug_msg_buf >> 8)
	mov	_AUTOPTRH1,r7
;	../../../include/ztex-utils.h:122: AUTOPTRL2=LO(&($1));
	mov	ar6,r4
	mov	ar7,r5
	mov	_AUTOPTRL2,r6
;	../../../include/ztex-utils.h:123: AUTOPTRH2=HI(&($1));
	mov	_AUTOPTRH2,r5
;	../../../include/ztex-utils.h:129: _endasm; 
	
	  push ar2
	    mov r2,#(3);
	  lcall _MEM_COPY1_int
	  pop ar2
	        
;	../../../include/ztex-debug.h:53: debug_counter += 1;
	mov	dptr,#_debug_counter
	mov	a,#0x01
	add	a,r2
	movx	@dptr,a
	clr	a
	addc	a,r3
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'debug_init'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-debug.h:60: void debug_init () {
;	-----------------------------------------
;	 function debug_init
;	-----------------------------------------
_debug_init:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_debug_counter
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-debug.h:62: debug_stack_size = DEBUG_STACK_SIZE;
	mov	dptr,#_debug_stack_size
	mov	a,#0x20
	movx	@dptr,a
;	../../../include/ztex-debug.h:63: debug_msg_size = DEBUG_MSG_SIZE;
	mov	dptr,#_debug_msg_size
	mov	a,#0x03
	movx	@dptr,a
;	../../../include/ztex-debug.h:64: debug_stack_ptr = debug_stack;
	mov	dptr,#_debug_stack_ptr
	mov	a,#_debug_stack
	movx	@dptr,a
	inc	dptr
	mov	a,#(_debug_stack >> 8)
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'debug_read_ep0'
;------------------------------------------------------------
;b                         Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-debug.h:71: BYTE debug_read_ep0 () { 
;	-----------------------------------------
;	 function debug_read_ep0
;	-----------------------------------------
_debug_read_ep0:
;	../../../include/ztex-debug.h:73: b = ep0_payload_transfer;
	mov	dptr,#_ep0_payload_transfer
	movx	a,@dptr
;	../../../include/ztex-debug.h:74: if ( b != 0) {
	mov	r2,a
	jnz	00106$
	ljmp	00102$
00106$:
;	../../../include/ztex-utils.h:120: AUTOPTRL1=LO(&($0));
	mov	dptr,#_debug_read_addr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	_AUTOPTRL1,r3
;	../../../include/ztex-utils.h:121: AUTOPTRH1=HI(&($0));
	mov	_AUTOPTRH1,r4
;	../../../include/ztex-utils.h:122: AUTOPTRL2=LO(&($1));
	mov	_AUTOPTRL2,#0x40
;	../../../include/ztex-utils.h:123: AUTOPTRH2=HI(&($1));
	mov	_AUTOPTRH2,#0xE7
;	../../../include/ztex-utils.h:129: _endasm; 
	
	  push ar2
	    mov r2,#(b);
	  lcall _MEM_COPY1_int
	  pop ar2
	        
00102$:
;	../../../include/ztex-debug.h:77: debug_read_addr += b;
	mov	dptr,#_debug_read_addr
	movx	a,@dptr
	mov	r3,a
	inc	dptr
	movx	a,@dptr
	mov	r4,a
	mov	dptr,#_debug_read_addr
	mov	a,r2
	add	a,r3
	movx	@dptr,a
	clr	a
	addc	a,r4
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-debug.h:78: return b;
	mov	dpl,r2
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'abscode_identity'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-descriptors.h:116: void abscode_identity() _naked
;	-----------------------------------------
;	 function abscode_identity
;	-----------------------------------------
_abscode_identity:
;	naked function: no prologue.
;	../../../include/ztex-descriptors.h:170: .db MODULE_RESERVED_03
	
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
;	# 158 "../../../include/ztex-descriptors.h"
	    .db 0 + 1 + 8
;	# 160 "../../../include/ztex-descriptors.h"
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
	
	    .area CSEG (CODE)
	    
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'resetToggleData'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:34: static void resetToggleData () {
;	-----------------------------------------
;	 function resetToggleData
;	-----------------------------------------
_resetToggleData:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	../../../include/ztex-isr.h:46: TOGCTL = 0 | bmBIT5;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	../../../include/ztex-isr.h:48: TOGCTL = 0x10 | bmBIT5;
	mov	dptr,#_TOGCTL
	clr	a
	movx	@dptr,a
	mov	a,#0x20
	movx	@dptr,a
	mov	a,#0x10
	movx	@dptr,a
	mov	a,#0x30
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	../../../include/ztex-isr.h:51: TOGCTL = 1 | bmBIT5;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
;	../../../include/ztex-isr.h:55: TOGCTL = 0x11 | bmBIT5;
	mov	dptr,#_TOGCTL
	mov	a,#0x01
	movx	@dptr,a
	mov	a,#0x21
	movx	@dptr,a
	mov	a,#0x11
	movx	@dptr,a
	mov	a,#0x31
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'sendStringDescriptor'
;------------------------------------------------------------
;hiAddr                    Allocated with name '_sendStringDescriptor_PARM_2'
;size                      Allocated with name '_sendStringDescriptor_PARM_3'
;loAddr                    Allocated to registers r2 
;i                         Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-isr.h:68: static void sendStringDescriptor (BYTE loAddr, BYTE hiAddr, BYTE size)
;	-----------------------------------------
;	 function sendStringDescriptor
;	-----------------------------------------
_sendStringDescriptor:
	mov	r2,dpl
;	../../../include/ztex-isr.h:71: if ( size > 31)
	mov	a,_sendStringDescriptor_PARM_3
	add	a,#0xff - 0x1F
	jnc	00102$
;	../../../include/ztex-isr.h:72: size = 31;
	mov	_sendStringDescriptor_PARM_3,#0x1F
00102$:
;	../../../include/ztex-isr.h:73: AUTOPTRSETUP = 7;
	mov	_AUTOPTRSETUP,#0x07
;	../../../include/ztex-isr.h:74: AUTOPTRL1 = loAddr;
	mov	_AUTOPTRL1,r2
;	../../../include/ztex-isr.h:75: AUTOPTRH1 = hiAddr;
	mov	_AUTOPTRH1,_sendStringDescriptor_PARM_2
;	../../../include/ztex-isr.h:76: AUTOPTRL2 = (BYTE)(((unsigned short)(&EP0BUF))+1);
	mov	_AUTOPTRL2,#0x41
;	../../../include/ztex-isr.h:77: AUTOPTRH2 = (BYTE)((((unsigned short)(&EP0BUF))+1) >> 8);
	mov	_AUTOPTRH2,#0xE7
;	../../../include/ztex-isr.h:78: XAUTODAT2 = 3;
	mov	dptr,#_XAUTODAT2
	mov	a,#0x03
	movx	@dptr,a
;	../../../include/ztex-isr.h:79: for (i=0; i<size; i++) {
	mov	r2,#0x00
00103$:
	clr	c
	mov	a,r2
	subb	a,_sendStringDescriptor_PARM_3
	jnc	00106$
;	../../../include/ztex-isr.h:80: XAUTODAT2 = XAUTODAT1;
	mov	dptr,#_XAUTODAT1
	movx	a,@dptr
	mov	r3,a
	mov	dptr,#_XAUTODAT2
	movx	@dptr,a
;	../../../include/ztex-isr.h:81: XAUTODAT2 = 0;
	mov	dptr,#_XAUTODAT2
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:79: for (i=0; i<size; i++) {
	inc	r2
	sjmp	00103$
00106$:
;	../../../include/ztex-isr.h:83: i = (size+1) << 1;
	mov	a,_sendStringDescriptor_PARM_3
	inc	a
;	../../../include/ztex-isr.h:84: EP0BUF[0] = i;
	add	a,acc
	mov	r2,a
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	../../../include/ztex-isr.h:85: EP0BUF[1] = 3;
	mov	dptr,#(_EP0BUF + 0x0001)
	mov	a,#0x03
	movx	@dptr,a
;	../../../include/ztex-isr.h:86: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:87: EP0BCL = i;
	mov	dptr,#_EP0BCL
	mov	a,r2
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ep0_payload_update'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:93: static void ep0_payload_update() {
;	-----------------------------------------
;	 function ep0_payload_update
;	-----------------------------------------
_ep0_payload_update:
;	../../../include/ztex-isr.h:94: ep0_payload_transfer = ( ep0_payload_remaining > 64 ) ? 64 : ep0_payload_remaining;
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	clr	c
	mov	a,#0x40
	subb	a,r2
	clr	a
	subb	a,r3
	jnc	00103$
	mov	r4,#0x40
	mov	r5,#0x00
	sjmp	00104$
00103$:
	mov	ar4,r2
	mov	ar5,r3
00104$:
	mov	dptr,#_ep0_payload_transfer
	mov	a,r4
	movx	@dptr,a
;	../../../include/ztex-isr.h:95: ep0_payload_remaining -= ep0_payload_transfer;
	mov	r5,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r2
	clr	c
	subb	a,r4
	movx	@dptr,a
	mov	a,r3
	subb	a,r5
	inc	dptr
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ep0_vendor_cmd_su'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:102: static void ep0_vendor_cmd_su() {
;	-----------------------------------------
;	 function ep0_vendor_cmd_su
;	-----------------------------------------
_ep0_vendor_cmd_su:
;	../../../include/ztex-isr.h:103: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x39,00102$
;	../../../include/ztex-eeprom.h:233: eeprom_write_checksum = 0;
	mov	dptr,#_eeprom_write_checksum
;	../../../include/ztex-eeprom.h:234: eeprom_write_bytes = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_eeprom_write_bytes
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#_eeprom_addr
	mov	a,r4
	orl	a,r2
	movx	@dptr,a
	mov	a,r5
	orl	a,r3
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-conf.h:115: break;
;	../../../include/ztex-isr.h:105: default:
	ret
00102$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_EP0CS
	movx	a,@dptr
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:107: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SUDAV_ISR'
;------------------------------------------------------------
;a                         Allocated to registers r2 
;------------------------------------------------------------
;	../../../include/ztex-isr.h:113: static void SUDAV_ISR () interrupt
;	-----------------------------------------
;	 function SUDAV_ISR
;	-----------------------------------------
_SUDAV_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	../../../include/ztex-isr.h:116: ep0_prev_setup_request = bRequest;
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#_ep0_prev_setup_request
	movx	@dptr,a
;	../../../include/ztex-isr.h:117: SUDPTRCTL = 1;
	mov	dptr,#_SUDPTRCTL
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:120: switch ( bRequest ) {
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov  r2,a
	add	a,#0xff - 0x0C
	jnc	00214$
	ljmp	00160$
00214$:
	mov	a,r2
	add	a,r2
	add	a,r2
	mov	dptr,#00215$
	jmp	@a+dptr
00215$:
	ljmp	00101$
	ljmp	00112$
	ljmp	00160$
	ljmp	00122$
	ljmp	00160$
	ljmp	00160$
	ljmp	00132$
	ljmp	00152$
	ljmp	00153$
	ljmp	00154$
	ljmp	00155$
	ljmp	00156$
	ljmp	00157$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00101$:
;	../../../include/ztex-isr.h:122: switch(SETUPDAT[0]) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x80,00216$
	sjmp	00102$
00216$:
	cjne	r2,#0x81,00217$
	sjmp	00103$
00217$:
	cjne	r2,#0x82,00218$
	sjmp	00104$
00218$:
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00102$:
	mov	dptr,#_EP0BUF
;	../../../include/ztex-isr.h:125: EP0BUF[1] = 0;
;	../../../include/ztex-isr.h:126: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:127: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ztex-isr.h:128: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00103$:
	mov	dptr,#_EP0BUF
;	../../../include/ztex-isr.h:131: EP0BUF[1] = 0;
;	../../../include/ztex-isr.h:132: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:133: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ztex-isr.h:134: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:135: case 0x82:	
00104$:
;	../../../include/ztex-isr.h:136: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r2,a
	jz	00106$
	cjne	r2,#0x01,00220$
	sjmp	00107$
00220$:
	cjne	r2,#0x80,00221$
	sjmp	00106$
00221$:
;	../../../include/ztex-isr.h:138: case 0x80 :
	cjne	r2,#0x81,00109$
	sjmp	00108$
00106$:
;	../../../include/ztex-isr.h:139: EP0BUF[0] = EP0CS & bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	anl	ar2,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-isr.h:140: break;
;	../../../include/ztex-isr.h:141: case 0x01 :
	sjmp	00110$
00107$:
;	../../../include/ztex-isr.h:142: EP0BUF[0] = EP1OUTCS & bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r2,a
	anl	ar2,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-isr.h:143: break;
;	../../../include/ztex-isr.h:144: case 0x81 :
	sjmp	00110$
00108$:
;	../../../include/ztex-isr.h:145: EP0BUF[0] = EP1INCS & bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r2,a
	anl	ar2,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-isr.h:146: break;
;	../../../include/ztex-isr.h:147: default:
	sjmp	00110$
00109$:
;	../../../include/ztex-isr.h:148: EP0BUF[0] = EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] & bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r2,a
	anl	ar2,#0x01
	mov	dptr,#_EP0BUF
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-isr.h:150: }
00110$:
;	../../../include/ztex-isr.h:151: EP0BUF[1] = 0;
	mov	dptr,#(_EP0BUF + 0x0001)
;	../../../include/ztex-isr.h:152: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:153: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ztex-isr.h:156: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00112$:
;	../../../include/ztex-isr.h:158: if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x02,00223$
	sjmp	00224$
00223$:
	ljmp	00160$
00224$:
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	jz	00225$
	ljmp	00160$
00225$:
;	../../../include/ztex-isr.h:159: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r2,a
	jz	00114$
	cjne	r2,#0x01,00227$
	sjmp	00115$
00227$:
	cjne	r2,#0x80,00228$
	sjmp	00114$
00228$:
;	../../../include/ztex-isr.h:161: case 0x80 :
	cjne	r2,#0x81,00117$
	sjmp	00116$
00114$:
;	../../../include/ztex-isr.h:162: EP0CS &= ~bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xFE
	movx	@dptr,a
;	../../../include/ztex-isr.h:163: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:164: case 0x01 :
00115$:
;	../../../include/ztex-isr.h:165: EP1OUTCS &= ~bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xFE
	movx	@dptr,a
;	../../../include/ztex-isr.h:166: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:167: case 0x81 :
00116$:
;	../../../include/ztex-isr.h:168: EP1INCS &= ~bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r2,a
	anl	a,#0xFE
	movx	@dptr,a
;	../../../include/ztex-isr.h:169: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:170: default:
00117$:
;	../../../include/ztex-isr.h:171: EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] &= ~bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	r2,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	r3,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	anl	ar4,#0xFE
	mov	dpl,r2
	mov	dph,r3
	mov	a,r4
	movx	@dptr,a
;	../../../include/ztex-isr.h:175: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00122$:
;	../../../include/ztex-isr.h:177: if ( SETUPDAT[0] == 2 && SETUPDAT[2] == 0 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x02,00230$
	sjmp	00231$
00230$:
	ljmp	00160$
00231$:
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	jz	00232$
	ljmp	00160$
00232$:
;	../../../include/ztex-isr.h:178: switch ( SETUPDAT[4] ) {
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r2,a
	jz	00124$
	cjne	r2,#0x01,00234$
	sjmp	00125$
00234$:
	cjne	r2,#0x80,00235$
	sjmp	00124$
00235$:
;	../../../include/ztex-isr.h:180: case 0x80 :
	cjne	r2,#0x81,00127$
	sjmp	00126$
00124$:
;	../../../include/ztex-isr.h:181: EP0CS |= bmBIT0;
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:182: break;
;	../../../include/ztex-isr.h:183: case 0x01 :
	sjmp	00128$
00125$:
;	../../../include/ztex-isr.h:184: EP1OUTCS |= bmBIT0;
	mov	dptr,#_EP1OUTCS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:185: break;
;	../../../include/ztex-isr.h:186: case 0x81 :
	sjmp	00128$
00126$:
;	../../../include/ztex-isr.h:187: EP1INCS |= bmBIT0;
	mov	dptr,#_EP1INCS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:188: break;
;	../../../include/ztex-isr.h:189: default:
	sjmp	00128$
00127$:
;	../../../include/ztex-isr.h:190: EPXCS[ ((SETUPDAT[4] >> 1)-1) & 3 ] |= ~bmBIT0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	r2,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	r3,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,#_EPXCS
	mov	dpl,a
	clr	a
	addc	a,#(_EPXCS >> 8)
	mov	dph,a
	movx	a,@dptr
	mov	r4,a
	orl	ar4,#0xFE
	mov	dpl,r2
	mov	dph,r3
	mov	a,r4
	movx	@dptr,a
;	../../../include/ztex-isr.h:192: }
00128$:
;	../../../include/ztex-isr.h:193: a = ( (SETUPDAT[4] & 0x80) >> 3 ) | (SETUPDAT[4] & 0x0f);
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	anl	a,#0x80
	swap	a
	rl	a
	anl	a,#0x1f
	mov	r2,a
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	mov	r3,a
	mov	a,#0x0F
	anl	a,r3
	orl	ar2,a
;	../../../include/ztex-isr.h:194: TOGCTL = a;
;	../../../include/ztex-isr.h:195: TOGCTL = a | bmBIT5;
	mov	dptr,#_TOGCTL
	mov	a,r2
	movx	@dptr,a
	mov	a,#0x20
	orl	a,r2
	movx	@dptr,a
;	../../../include/ztex-isr.h:197: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00132$:
;	../../../include/ztex-isr.h:199: switch(SETUPDAT[3]) {
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x01,00237$
	sjmp	00133$
00237$:
	cjne	r2,#0x02,00238$
	sjmp	00134$
00238$:
	cjne	r2,#0x03,00239$
	sjmp	00138$
00239$:
	cjne	r2,#0x06,00240$
	ljmp	00145$
00240$:
	cjne	r2,#0x07,00241$
	ljmp	00146$
00241$:
	ljmp	00150$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00133$:
;	../../../include/ztex-isr.h:201: SUDPTRH = MSB(&DeviceDescriptor);
	mov	r2,#_DeviceDescriptor
	mov	r3,#(_DeviceDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:202: SUDPTRL = LSB(&DeviceDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_DeviceDescriptor
	movx	@dptr,a
;	../../../include/ztex-isr.h:203: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00134$:
;	../../../include/ztex-isr.h:205: if (USBCS & bmBIT7) {
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r2,a
	jnb	acc.7,00136$
;	../../../include/ztex-isr.h:206: SUDPTRH = MSB(&HighSpeedConfigDescriptor);
	mov	r2,#_HighSpeedConfigDescriptor
	mov	r3,#(_HighSpeedConfigDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:207: SUDPTRL = LSB(&HighSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_HighSpeedConfigDescriptor
	movx	@dptr,a
	ljmp	00160$
00136$:
;	../../../include/ztex-isr.h:210: SUDPTRH = MSB(&FullSpeedConfigDescriptor);
	mov	r2,#_FullSpeedConfigDescriptor
	mov	r3,#(_FullSpeedConfigDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:211: SUDPTRL = LSB(&FullSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_FullSpeedConfigDescriptor
	movx	@dptr,a
;	../../../include/ztex-isr.h:213: break; 
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00138$:
;	../../../include/ztex-isr.h:215: switch (SETUPDAT[2]) {
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x01,00243$
	sjmp	00139$
00243$:
	cjne	r2,#0x02,00244$
	sjmp	00140$
00244$:
	cjne	r2,#0x03,00245$
	sjmp	00141$
00245$:
;	../../../include/ztex-isr.h:216: case 1:
	cjne	r2,#0x04,00143$
	sjmp	00142$
00139$:
;	../../../include/ztex-isr.h:217: SEND_STRING_DESCRIPTOR(manufacturerString);
	mov	dpl,#_manufacturerString
	mov	r2,#_manufacturerString
	mov	r3,#(_manufacturerString >> 8)
	mov	_sendStringDescriptor_PARM_2,r3
	mov	_sendStringDescriptor_PARM_3,#0x05
	lcall	_sendStringDescriptor
;	../../../include/ztex-isr.h:218: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:219: case 2:
00140$:
;	../../../include/ztex-isr.h:220: SEND_STRING_DESCRIPTOR(productString);
	mov	dpl,#_productString
	mov	r2,#_productString
	mov	r3,#(_productString >> 8)
	mov	_sendStringDescriptor_PARM_2,r3
	mov	_sendStringDescriptor_PARM_3,#0x19
	lcall	_sendStringDescriptor
;	../../../include/ztex-isr.h:221: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:222: case 3:
00141$:
;	../../../include/ztex-isr.h:223: SEND_STRING_DESCRIPTOR(SN_STRING);
	mov	dpl,#_SN_STRING
	mov	r2,#_SN_STRING
	mov	r3,#(_SN_STRING >> 8)
	mov	_sendStringDescriptor_PARM_2,r3
	mov	_sendStringDescriptor_PARM_3,#0x0A
	lcall	_sendStringDescriptor
;	../../../include/ztex-isr.h:224: break;
	ljmp	00160$
;	../../../include/ztex-isr.h:225: case 4:
00142$:
;	../../../include/ztex-isr.h:226: SEND_STRING_DESCRIPTOR(configurationString);
	mov	dpl,#_configurationString
	mov	r2,#_configurationString
	mov	r3,#(_configurationString >> 8)
	mov	_sendStringDescriptor_PARM_2,r3
	mov	_sendStringDescriptor_PARM_3,#0x0A
	lcall	_sendStringDescriptor
;	../../../include/ztex-isr.h:227: break; 
	ljmp	00160$
;	../../../include/ztex-isr.h:228: default:
00143$:
;	../../../include/ztex-isr.h:229: SUDPTRH = MSB(&EmptyStringDescriptor);
	mov	r2,#_EmptyStringDescriptor
	mov	r3,#(_EmptyStringDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:230: SUDPTRL = LSB(&EmptyStringDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_EmptyStringDescriptor
	movx	@dptr,a
;	../../../include/ztex-isr.h:233: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00145$:
;	../../../include/ztex-isr.h:235: SUDPTRH = MSB(&DeviceQualifierDescriptor);
	mov	r2,#_DeviceQualifierDescriptor
	mov	r3,#(_DeviceQualifierDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:236: SUDPTRL = LSB(&DeviceQualifierDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_DeviceQualifierDescriptor
	movx	@dptr,a
;	../../../include/ztex-isr.h:237: break;
	ljmp	00160$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00146$:
;	../../../include/ztex-isr.h:239: if (USBCS & bmBIT7) {
	mov	dptr,#_USBCS
	movx	a,@dptr
	mov	r2,a
	jnb	acc.7,00148$
;	../../../include/ztex-isr.h:240: SUDPTRH = MSB(&FullSpeedConfigDescriptor);
	mov	r2,#_FullSpeedConfigDescriptor
	mov	r3,#(_FullSpeedConfigDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:241: SUDPTRL = LSB(&FullSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_FullSpeedConfigDescriptor
	movx	@dptr,a
	ljmp	00160$
00148$:
;	../../../include/ztex-isr.h:244: SUDPTRH = MSB(&HighSpeedConfigDescriptor);
	mov	r2,#_HighSpeedConfigDescriptor
	mov	r3,#(_HighSpeedConfigDescriptor >> 8)
	mov	dptr,#_SUDPTRH
	mov	a,r3
	movx	@dptr,a
;	../../../include/ztex-isr.h:245: SUDPTRL = LSB(&HighSpeedConfigDescriptor);
	mov	dptr,#_SUDPTRL
	mov	a,#_HighSpeedConfigDescriptor
	movx	@dptr,a
;	../../../include/ztex-isr.h:247: break; 
;	../../../include/ztex-isr.h:248: default:
	sjmp	00160$
00150$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:251: break;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00152$:
;	../../../include/ztex-isr.h:253: break;			
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00153$:
	mov	dptr,#_EP0BUF
;	../../../include/ztex-isr.h:256: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:257: EP0BCL = 1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:258: break;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00154$:
;	../../../include/ztex-isr.h:260: resetToggleData();
	lcall	_resetToggleData
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00155$:
	mov	dptr,#_EP0BUF
;	../../../include/ztex-isr.h:264: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:265: EP0BCL = 1;
	mov	dptr,#_EP0BCL
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:266: break;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00156$:
;	../../../include/ztex-isr.h:268: resetToggleData();
	lcall	_resetToggleData
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00160$
00157$:
;	../../../include/ztex-isr.h:271: if ( SETUPDAT[0] == 0x82 ) {
	mov	dptr,#_SETUPDAT
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x82,00160$
;	../../../include/ztex-isr.h:272: ISOFRAME_COUNTER[ ((SETUPDAT[4] >> 1)-1) & 3 ] = 0;
	mov	dptr,#(_SETUPDAT + 0x0004)
	movx	a,@dptr
	clr	c
	rrc	a
	dec	a
	anl	a,#0x03
	add	a,acc
	add	a,#_ISOFRAME_COUNTER
	mov	dpl,a
	clr	a
	addc	a,#(_ISOFRAME_COUNTER >> 8)
	mov	dph,a
	clr	a
	movx	@dptr,a
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_USBFRAMEL
	movx	a,@dptr
	mov	dptr,#_EP0BUF
	movx	@dptr,a
;	../../../include/ztex-isr.h:274: EP0BUF[1] = USBFRAMEH;	
	mov	dptr,#_USBFRAMEH
	movx	a,@dptr
	mov	r2,a
	mov	dptr,#(_EP0BUF + 0x0001)
	movx	@dptr,a
;	../../../include/ztex-isr.h:275: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:276: EP0BCL = 2;
	mov	dptr,#_EP0BCL
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ztex-isr.h:280: }
00160$:
;	../../../include/ztex-isr.h:283: switch ( bmRequestType ) {
	mov	dptr,#_bmRequestType
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x40,00250$
	ljmp	00168$
00250$:
	cjne	r2,#0xC0,00251$
	sjmp	00252$
00251$:
	ljmp	00172$
00252$:
;	../../../include/ztex-isr.h:285: ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r4
	orl	a,r2
	movx	@dptr,a
	mov	a,r5
	orl	a,r3
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-isr.h:286: ep0_payload_update();
	lcall	_ep0_payload_update
;	../../../include/ztex-isr.h:288: switch ( bRequest ) {
	mov	dptr,#_bRequest
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x22,00253$
	sjmp	00162$
00253$:
	cjne	r2,#0x28,00254$
	ljmp	00165$
00254$:
	cjne	r2,#0x38,00255$
	sjmp	00163$
00255$:
	cjne	r2,#0x3A,00256$
	sjmp	00164$
00256$:
	ljmp	00166$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
00162$:
;	../../../include/ztex-isr.h:290: SUDPTRCTL = 0;
	mov	dptr,#_SUDPTRCTL
;	../../../include/ztex-isr.h:291: EP0BCH = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCH
	movx	@dptr,a
;	../../../include/ztex-isr.h:292: EP0BCL = ZTEX_DESCRIPTOR_LEN;
	mov	dptr,#_EP0BCL
	mov	a,#0x28
	movx	@dptr,a
;	../../../include/ztex-isr.h:293: SUDPTRH = MSB(ZTEX_DESCRIPTOR_OFFS);
	mov	dptr,#_SUDPTRH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:294: SUDPTRL = LSB(ZTEX_DESCRIPTOR_OFFS); 
	mov	dptr,#_SUDPTRL
	mov	a,#0x6C
	movx	@dptr,a
;	../../../include/ztex-isr.h:295: break;
	ljmp	00172$
;	../../../include/ztex-conf.h:90: case $0:
00163$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#(_SETUPDAT + 0x0003)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#(_SETUPDAT + 0x0002)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#_eeprom_addr
	mov	a,r4
	orl	a,r2
	movx	@dptr,a
	mov	a,r5
	orl	a,r3
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:216: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:217: EP0BCL = eeprom_read_ep0(); 
	lcall	_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	../../../include/ztex-conf.h:92: break;
	ljmp	00172$
;	../../../include/ztex-conf.h:90: case $0:
00164$:
;	../../../include/ztex-eeprom.h:244: EP0BUF[0] = LSB(eeprom_write_bytes);
	mov	dptr,#_eeprom_write_bytes
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	mov	ar4,r2
	mov	dptr,#_EP0BUF
	mov	a,r4
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:245: EP0BUF[1] = MSB(eeprom_write_bytes);
	mov	ar2,r3
	mov	dptr,#(_EP0BUF + 0x0001)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:246: EP0BUF[2] = eeprom_write_checksum;
	mov	dptr,#_eeprom_write_checksum
	movx	a,@dptr
	mov	dptr,#(_EP0BUF + 0x0002)
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	_eeprom_select_PARM_2,#0x01
	mov	dpl,#0x00
	lcall	_eeprom_select
	mov	r2,dpl
	mov	dptr,#(_EP0BUF + 0x0003)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:248: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:249: EP0BCL = 4;
	mov	dptr,#_EP0BCL
	mov	a,#0x04
	movx	@dptr,a
;	../../../include/ztex-conf.h:92: break;
;	../../../include/ztex-conf.h:90: case $0:
	sjmp	00172$
00165$:
;	../../../include/ztex-debug.h:82: debug_read_addr = (__xdata BYTE*)&debug_counter;
	mov	dptr,#_debug_read_addr
	mov	a,#_debug_counter
	movx	@dptr,a
	inc	dptr
	mov	a,#(_debug_counter >> 8)
	movx	@dptr,a
;	../../../include/ztex-debug.h:83: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-debug.h:84: EP0BCL = debug_read_ep0(); 
	lcall	_debug_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	../../../include/ztex-conf.h:92: break;
;	../../../include/ztex-isr.h:297: default:
	sjmp	00172$
00166$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:300: break;
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	sjmp	00172$
00168$:
;	../../../include/ztex-isr.h:305: if ( SETUPDAT[7]!=0 || SETUPDAT[6]!=0 ) {
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	jnz	00169$
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	jz	00170$
00169$:
;	../../../include/ztex-isr.h:306: ep0_vendor_cmd_setup = 1;
	mov	dptr,#_ep0_vendor_cmd_setup
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:307: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
	sjmp	00173$
00170$:
	lcall	_ep0_vendor_cmd_su
;	../../../include/ztex-isr.h:313: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:315: }
00172$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x01
	movx	@dptr,a
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x80
	movx	@dptr,a
00173$:
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'SOF_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:325: void SOF_ISR() interrupt
;	-----------------------------------------
;	 function SOF_ISR
;	-----------------------------------------
_SOF_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:327: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:328: USBIRQ = bmBIT1;
	mov	dptr,#_USBIRQ
	mov	a,#0x02
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SUTOK_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:334: void SUTOK_ISR() interrupt 
;	-----------------------------------------
;	 function SUTOK_ISR
;	-----------------------------------------
_SUTOK_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:336: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:337: USBIRQ = bmBIT2;
	mov	dptr,#_USBIRQ
	mov	a,#0x04
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'SUSP_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:343: void SUSP_ISR() interrupt
;	-----------------------------------------
;	 function SUSP_ISR
;	-----------------------------------------
_SUSP_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:345: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:346: USBIRQ = bmBIT3;
	mov	dptr,#_USBIRQ
	mov	a,#0x08
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'URES_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:352: void URES_ISR() interrupt
;	-----------------------------------------
;	 function URES_ISR
;	-----------------------------------------
_URES_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:354: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:355: USBIRQ = bmBIT4;
	mov	dptr,#_USBIRQ
	mov	a,#0x10
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'HSGRANT_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:361: void HSGRANT_ISR() interrupt
;	-----------------------------------------
;	 function HSGRANT_ISR
;	-----------------------------------------
_HSGRANT_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:363: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:364: USBIRQ = bmBIT5;
	mov	dptr,#_USBIRQ
	mov	a,#0x20
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0ACK_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:370: void EP0ACK_ISR() interrupt
;	-----------------------------------------
;	 function EP0ACK_ISR
;	-----------------------------------------
_EP0ACK_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	anl	_EXIF,#0xEF
	mov	dptr,#_USBIRQ
	mov	a,#0x40
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0IN_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:379: static void EP0IN_ISR () interrupt
;	-----------------------------------------
;	 function EP0IN_ISR
;	-----------------------------------------
_EP0IN_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	clr	_EUSB
;	../../../include/ztex-isr.h:382: ep0_payload_update();
	lcall	_ep0_payload_update
;	../../../include/ztex-isr.h:383: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x28,00111$
	sjmp	00103$
00111$:
	cjne	r2,#0x38,00112$
	sjmp	00101$
00112$:
;	../../../include/ztex-conf.h:95: case $0:
	cjne	r2,#0x3A,00104$
	sjmp	00105$
00101$:
;	../../../include/ztex-eeprom.h:219: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-eeprom.h:220: EP0BCL = eeprom_read_ep0(); 
	lcall	_eeprom_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	../../../include/ztex-conf.h:97: break;
;	../../../include/ztex-conf.h:95: case $0:
	sjmp	00105$
00103$:
;	../../../include/ztex-debug.h:86: EP0BCH = 0;
	mov	dptr,#_EP0BCH
	clr	a
	movx	@dptr,a
;	../../../include/ztex-debug.h:87: EP0BCL = debug_read_ep0(); 
	lcall	_debug_read_ep0
	mov	a,dpl
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	../../../include/ztex-conf.h:97: break;
;	../../../include/ztex-isr.h:385: default:
	sjmp	00105$
00104$:
;	../../../include/ztex-isr.h:386: EP0BCH = 0;
	mov	dptr,#_EP0BCH
;	../../../include/ztex-isr.h:387: EP0BCL = 0;
	clr	a
	movx	@dptr,a
	mov	dptr,#_EP0BCL
	movx	@dptr,a
;	../../../include/ztex-isr.h:388: }
00105$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	anl	_EXIF,#0xEF
	mov	dptr,#_EPIRQ
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ztex-isr.h:391: EUSB = 1;
	setb	_EUSB
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'EP0OUT_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:397: static void EP0OUT_ISR () interrupt
;	-----------------------------------------
;	 function EP0OUT_ISR
;	-----------------------------------------
_EP0OUT_ISR:
	push	bits
	push	acc
	push	b
	push	dpl
	push	dph
	push	(0+2)
	push	(0+3)
	push	(0+4)
	push	(0+5)
	push	(0+6)
	push	(0+7)
	push	(0+0)
	push	(0+1)
	push	psw
	mov	psw,#0x00
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	clr	_EUSB
;	../../../include/ztex-isr.h:400: if ( ep0_vendor_cmd_setup ) {
	mov	dptr,#_ep0_vendor_cmd_setup
	movx	a,@dptr
	mov	r2,a
	jz	00102$
;	../../../include/ztex-isr.h:401: ep0_vendor_cmd_setup = 0;
	mov	dptr,#_ep0_vendor_cmd_setup
	clr	a
	movx	@dptr,a
;	../../../include/ztex-isr.h:402: ep0_payload_remaining = (SETUPDAT[7] << 8) | SETUPDAT[6];
	mov	dptr,#(_SETUPDAT + 0x0007)
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	mov	dptr,#(_SETUPDAT + 0x0006)
	movx	a,@dptr
	mov	r4,a
	mov	r5,#0x00
	mov	dptr,#_ep0_payload_remaining
	mov	a,r4
	orl	a,r2
	movx	@dptr,a
	mov	a,r5
	orl	a,r3
	inc	dptr
	movx	@dptr,a
;	../../../include/ztex-isr.h:403: ep0_vendor_cmd_su();
	lcall	_ep0_vendor_cmd_su
00102$:
;	../../../include/ztex-isr.h:406: ep0_payload_update();
	lcall	_ep0_payload_update
;	../../../include/ztex-isr.h:408: switch ( ep0_prev_setup_request ) {
	mov	dptr,#_ep0_prev_setup_request
	movx	a,@dptr
	mov	r2,a
	cjne	r2,#0x39,00104$
;	../../../include/ztex-eeprom.h:237: eeprom_write_ep0(EP0BCL);
	mov	dptr,#_EP0BCL
	movx	a,@dptr
	mov	dpl,a
	lcall	_eeprom_write_ep0
;	../../../include/ztex-isr.h:410: } 
00104$:
;	../../../include/ztex-isr.h:412: EP0BCL = 0;
	mov	dptr,#_EP0BCL
	clr	a
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	anl	_EXIF,#0xEF
	mov	dptr,#_EPIRQ
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ztex-isr.h:416: if ( ep0_payload_remaining == 0 ) {
	mov	dptr,#_ep0_payload_remaining
	movx	a,@dptr
	mov	r2,a
	inc	dptr
	movx	a,@dptr
	mov	r3,a
	orl	a,r2
	jnz	00106$
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	dptr,#_EP0CS
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x80
	movx	@dptr,a
00106$:
;	../../../include/ztex-isr.h:419: EUSB = 1;
	setb	_EUSB
	pop	psw
	pop	(0+1)
	pop	(0+0)
	pop	(0+7)
	pop	(0+6)
	pop	(0+5)
	pop	(0+4)
	pop	(0+3)
	pop	(0+2)
	pop	dph
	pop	dpl
	pop	b
	pop	acc
	pop	bits
	reti
;------------------------------------------------------------
;Allocation info for local variables in function 'EP1IN_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:426: void EP1IN_ISR() interrupt
;	-----------------------------------------
;	 function EP1IN_ISR
;	-----------------------------------------
_EP1IN_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:428: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:429: EPIRQ = bmBIT2;
	mov	dptr,#_EPIRQ
	mov	a,#0x04
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP1OUT_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:436: void EP1OUT_ISR() interrupt
;	-----------------------------------------
;	 function EP1OUT_ISR
;	-----------------------------------------
_EP1OUT_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:438: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:439: EPIRQ = bmBIT3;
	mov	dptr,#_EPIRQ
	mov	a,#0x08
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP2_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:445: void EP2_ISR() interrupt
;	-----------------------------------------
;	 function EP2_ISR
;	-----------------------------------------
_EP2_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:447: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:448: EPIRQ = bmBIT4;
	mov	dptr,#_EPIRQ
	mov	a,#0x10
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP4_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:454: void EP4_ISR() interrupt
;	-----------------------------------------
;	 function EP4_ISR
;	-----------------------------------------
_EP4_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:456: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:457: EPIRQ = bmBIT5;
	mov	dptr,#_EPIRQ
	mov	a,#0x20
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP6_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:463: void EP6_ISR() interrupt
;	-----------------------------------------
;	 function EP6_ISR
;	-----------------------------------------
_EP6_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:465: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:466: EPIRQ = bmBIT6;
	mov	dptr,#_EPIRQ
	mov	a,#0x40
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'EP8_ISR'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex-isr.h:472: void EP8_ISR() interrupt
;	-----------------------------------------
;	 function EP8_ISR
;	-----------------------------------------
_EP8_ISR:
	push	acc
	push	dpl
	push	dph
;	../../../include/ztex-isr.h:474: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex-isr.h:475: EPIRQ = bmBIT7;
	mov	dptr,#_EPIRQ
	mov	a,#0x80
	movx	@dptr,a
	pop	dph
	pop	dpl
	pop	acc
	reti
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'init_USB'
;------------------------------------------------------------
;------------------------------------------------------------
;	../../../include/ztex.h:165: void init_USB ()
;	-----------------------------------------
;	 function init_USB
;	-----------------------------------------
_init_USB:
;	../../../include/ztex.h:167: USBCS |= 0x08;
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	../../../include/ztex.h:169: CPUCS = bmBIT4 | bmBIT1;
	mov	dptr,#_CPUCS
	mov	a,#0x12
	movx	@dptr,a
;	../../../include/ztex.h:170: CKCON &= ~7;
	anl	_CKCON,#0xF8
;	../../../include/ztex.h:191: EA = 0;
	clr	_EA
;	../../../include/ztex.h:192: EUSB = 0;
	clr	_EUSB
;	../../../include/ezintavecs.h:123: INT8VEC_USB.op=0x02;
	mov	dptr,#_INT8VEC_USB
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:124: INT8VEC_USB.addrH = 0x01;
	mov	dptr,#(_INT8VEC_USB + 0x0001)
	mov	a,#0x01
	movx	@dptr,a
;	../../../include/ezintavecs.h:125: INT8VEC_USB.addrL = 0xb8;
	mov	dptr,#(_INT8VEC_USB + 0x0002)
	mov	a,#0xB8
	movx	@dptr,a
;	../../../include/ezintavecs.h:126: INTSETUP |= 8;
	mov	dptr,#_INTSETUP
	movx	a,@dptr
	orl	a,#0x08
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUDAV
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_SUDAV_ISR
	mov	r3,#(_SUDAV_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_SUDAV + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUDAV + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SOF
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_SOF_ISR
	mov	r3,#(_SOF_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_SOF + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SOF + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUTOK
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_SUTOK_ISR
	mov	r3,#(_SUTOK_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_SUTOK + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUTOK + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_SUSPEND
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_SUSP_ISR
	mov	r3,#(_SUSP_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_SUSPEND + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_SUSPEND + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_USBRESET
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_URES_ISR
	mov	r3,#(_URES_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_USBRESET + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_USBRESET + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_HISPEED
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_HSGRANT_ISR
	mov	r3,#(_HSGRANT_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_HISPEED + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_HISPEED + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0ACK
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP0ACK_ISR
	mov	r3,#(_EP0ACK_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP0ACK + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0ACK + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0IN
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP0IN_ISR
	mov	r3,#(_EP0IN_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP0IN + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0IN + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP0OUT
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP0OUT_ISR
	mov	r3,#(_EP0OUT_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP0OUT + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP0OUT + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP1IN
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP1IN_ISR
	mov	r3,#(_EP1IN_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP1IN + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP1IN + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP1OUT
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP1OUT_ISR
	mov	r3,#(_EP1OUT_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP1OUT + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP1OUT + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP2
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP2_ISR
	mov	r3,#(_EP2_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP2 + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP2 + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP4
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP4_ISR
	mov	r3,#(_EP4_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP4 + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP4 + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP6
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP6_ISR
	mov	r3,#(_EP6_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP6 + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP6 + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ezintavecs.h:115: $0.op=0x02;
	mov	dptr,#_INTVEC_EP8
	mov	a,#0x02
	movx	@dptr,a
;	../../../include/ezintavecs.h:116: $0.addrH=((unsigned short)(&$1)) >> 8;
	mov	r2,#_EP8_ISR
	mov	r3,#(_EP8_ISR >> 8)
	mov	ar4,r3
	mov	dptr,#(_INTVEC_EP8 + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ezintavecs.h:117: $0.addrL=(unsigned short)(&$1);
	mov	dptr,#(_INTVEC_EP8 + 0x0002)
	mov	a,r2
	movx	@dptr,a
;	../../../include/ztex.h:213: EXIF &= ~bmBIT4;
	anl	_EXIF,#0xEF
;	../../../include/ztex.h:214: USBIRQ = 0x7f;
	mov	dptr,#_USBIRQ
	mov	a,#0x7F
	movx	@dptr,a
;	../../../include/ztex.h:215: USBIE |= 0x7f; 
	mov	dptr,#_USBIE
	movx	a,@dptr
	mov	r2,a
	orl	a,#0x7F
	movx	@dptr,a
;	../../../include/ztex.h:216: EPIRQ = 0xff;
	mov	dptr,#_EPIRQ
	mov	a,#0xFF
	movx	@dptr,a
;	../../../include/ztex.h:217: EPIE = 0xff;
	mov	dptr,#_EPIE
	mov	a,#0xFF
	movx	@dptr,a
;	../../../include/ztex.h:219: EUSB = 1;
	setb	_EUSB
;	../../../include/ztex.h:220: EA = 1;
	setb	_EA
;	../../../include/ztex.h:154: EP$0CFG = bmBIT7 | bmBIT5;
	mov	dptr,#_EP1INCFG
	mov	a,#0xA0
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:154: EP$0CFG = bmBIT7 | bmBIT5;
	mov	dptr,#_EP1OUTCFG
	mov	a,#0xA0
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:149: ;
	mov	dptr,#_EP2CFG
	clr	a
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:149: ;
	mov	dptr,#_EP4CFG
	clr	a
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:149: ;
	mov	dptr,#_EP6CFG
	clr	a
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:149: ;
	mov	dptr,#_EP8CFG
	clr	a
	movx	@dptr,a
;	../../../include/ezregs.h:46: _endasm;
	
	 nop
	 nop
	 nop
	 nop
	    
;	../../../include/ztex.h:236: debug_init();
	lcall	_debug_init
;	../../../include/ztex.h:239: USBCS |= bmBIT7 | bmBIT1;
	mov	dptr,#_USBCS
	movx	a,@dptr
	orl	a,#0x82
	movx	@dptr,a
;	../../../include/ztex.h:240: wait(250);
	mov	dptr,#0x00FA
	lcall	_wait
;	../../../include/ztex.h:241: USBCS &= ~0x08;
	mov	dptr,#_USBCS
	movx	a,@dptr
	anl	a,#0xF7
	movx	@dptr,a
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers 
;b                         Allocated to registers r4 
;------------------------------------------------------------
;	debug.c:32: void main(void)	
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	debug.c:38: init_USB();
	lcall	_init_USB
;	debug.c:41: while (1) {	
	mov	r2,#0x00
	mov	r3,#0x00
00102$:
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	mov	ar4,r2
	mov	dptr,#_debug_msg_buf
	mov	a,r4
	movx	@dptr,a
;	debug.c:44: debug_msg_buf[1] = i >> 8;
	mov	ar4,r3
	mov	dptr,#(_debug_msg_buf + 0x0001)
	mov	a,r4
	movx	@dptr,a
;	../../../include/ztex-conf.h:30: ][#noexpand[!dnapxeon!]//$0!dnapxeon!
	push	ar2
	push	ar3
	lcall	_debug_add_msg
	pop	ar3
	pop	ar2
;	debug.c:46: i+=1;
	inc	r2
	cjne	r2,#0x00,00113$
	inc	r3
00113$:
;	debug.c:30: #include[ztex.h]
	mov	r4,#0x00
00104$:
	cjne	r4,#0x64,00114$
00114$:
	jnc	00102$
	mov	dptr,#_debug_stack_ptr
	movx	a,@dptr
	mov	r5,a
	inc	dptr
	movx	a,@dptr
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	inc	dptr
	inc	dptr
	mov	a,r4
	movx	@dptr,a
	mov	dptr,#0x000A
	push	ar2
	push	ar3
	push	ar4
	lcall	_wait
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r4
	sjmp	00104$
	.area CSEG    (CODE)
	.area CONST   (CODE)
_manufacturerString:
	.ascii "ZTEX"
	.db 0x00
_productString:
	.ascii "debug for EZ-USB devices"
	.db 0x00
_configurationString:
	.ascii "(unknown)"
	.db 0x00
_PadByte:
	.db #0x00
_DeviceDescriptor:
	.db #0x12
	.db #0x01
	.db #0x00
	.db #0x02
	.db #0xFF
	.db #0xFF
	.db #0xFF
	.db #0x40
	.db #0x1A
	.db #0x22
	.db #0x00
	.db #0x01
	.db #0x00
	.db #0x00
	.db #0x01
	.db #0x02
	.db #0x03
	.db #0x01
_DeviceQualifierDescriptor:
	.db #0x0A
	.db #0x06
	.db #0x00
	.db #0x02
	.db #0xFF
	.db #0xFF
	.db #0xFF
	.db #0x40
	.db #0x01
	.db #0x00
_HighSpeedConfigDescriptor:
	.db #0x09
	.db #0x02
	.db #0x20
	.db #0x00
	.db #0x01
	.db #0x01
	.db #0x04
	.db #0xC0
	.db #0x32
	.db #0x09
	.db #0x04
	.db #0x00
	.db #0x00
	.db #0x02
	.db #0xFF
	.db #0xFF
	.db #0xFF
	.db #0x00
	.db #0x07
	.db #0x05
	.db #0x81
	.db #0x02
	.db #0x00
	.db #0x02
	.db #0x00
	.db #0x07
	.db #0x05
	.db #0x01
	.db #0x02
	.db #0x00
	.db #0x02
	.db #0x00
_HighSpeedConfigDescriptor_PadByte:
	.db #0x00
	.db 0x00
_FullSpeedConfigDescriptor:
	.db #0x09
	.db #0x02
	.db #0x20
	.db #0x00
	.db #0x01
	.db #0x01
	.db #0x04
	.db #0xC0
	.db #0x32
	.db #0x09
	.db #0x04
	.db #0x00
	.db #0x00
	.db #0x02
	.db #0xFF
	.db #0xFF
	.db #0xFF
	.db #0x00
	.db #0x07
	.db #0x05
	.db #0x81
	.db #0x02
	.db #0x40
	.db #0x00
	.db #0x00
	.db #0x07
	.db #0x05
	.db #0x01
	.db #0x02
	.db #0x40
	.db #0x00
	.db #0x00
_FullSpeedConfigDescriptor_PadByte:
	.db #0x00
	.db 0x00
_EmptyStringDescriptor:
	.db #0x04
	.db #0x03
	.db #0x00
	.db #0x00
	.area XINIT   (CODE)
__xinit__ep0_payload_remaining:
	.byte #0x00,#0x00
__xinit__ep0_payload_transfer:
	.db #0x00
__xinit__ep0_prev_setup_request:
	.db #0xFF
__xinit__ep0_vendor_cmd_setup:
	.db #0x00
__xinit__ISOFRAME_COUNTER:
	.byte #0x00,#0x00
	.byte #0x00,#0x00
	.byte #0x00,#0x00
	.byte #0x00,#0x00
	.area CABS    (ABS,CODE)
