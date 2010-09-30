/*!
   Java Driver API for the ZTEX Firmware Kit
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
    Functions for USB devices with ZTEX descriptor 1, Interface 1
    Interface capabilities and vendor requests (VR) / commands (VC):
    0.0  : EEPROM support
	VR 0x38 : read from EEPROM
	    Returns:
		EEPROM data
	VC 0x39 : write to EEPROM
	VR 0x3a : EEPROM state
	    Returns:
	        Offs	Description
		0-1   	bytes written
		2	checksum
		3	0:idle, 1:busy or error
	    
    0.1  : FPGA Configuration
	VR 0x30 : get FPGA state
	    Returns:
	        Offs	Description
		0	1: unconfigured, 0:configured
	        1	checksum
		2-5	transferred bytes
		6  	INIT_B state
	VC 0x31 : reset FPGA
	VC 0x32 : send FPGA configuration data (Bitstream)

    0.2  : Flash memory support
	VR 0x40 : read Flash state
	    Returns:
	        Offs	Description
		0	1:enabled, 0:disabled
		1-2	Sector size
		3-6	Number of sectors
		7	Error code
	VR 0x41 : read from Flash
	VR 0x42 : write to Flash
    0.3  : Debug helper support
	VR 0x28 : read debug data
	    Returns:
	        Offs	Description
		0-1	number of messages
		2	stack size in messages
		3       message size in bytes
		>=4	message stack
*/
package ztex;

import java.io.*;
import java.util.*;

import ch.ntb.usb.*;

/**
  * This class implements the communication protocol of the interface version 1 for the interaction with the ZTEX firmware.
  * <p>
  * The features supported by this interface can be accessed via vendor commands and vendor requests via Endpoint 0.
  * Each feature can be enabled or disabled by the firmware and also depends from the hardware.
  * The presence of a feature is indicated by a 1 in the corresponding feature bit of the ZTEX descriptor 1, see {@link ZtexDevice1}.
  * The following table gives an overview about the features
  * <table bgcolor="#404040" cellspacing=1 cellpadding=10>
  *   <tr>
  *     <td bgcolor="#d0d0d0" valign="bottom"><b>Capability bit</b></td>
  *     <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">0.0</td>
  *     <td bgcolor="#ffffff" valign="top" colspan=2>
  *	  EEPROM support<p>
  *       <table bgcolor="#404040" cellspacing=1 cellpadding=6>
  *         <tr>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Vendor request (VR)<br> or command (VC)</b></td>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x38</td>
  *           <td bgcolor="#ffffff" valign="top">Read from EEPROM</td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VC 0x39</td>
  *           <td bgcolor="#ffffff" valign="top">Write to EEPROM</td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x3a</td>
  *           <td bgcolor="#ffffff" valign="top">Get EEPROM state. Returns:
  *             <table bgcolor="#404040" cellspacing=1 cellpadding=4>
  *               <tr>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Bytes</b></td>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">0-1</td>
  *                 <td bgcolor="#ffffff" valign="top">Number of bytes written.</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">2</td>
  *                 <td bgcolor="#ffffff" valign="top">Checksum</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">3</td>
  *                 <td bgcolor="#ffffff" valign="top">0:idle, 1:busy or error</td>
  *               </tr>
  *             </table>
  *           </td>
  *         </tr>
  *       </table>
  *	</td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">0.1</td>
  *     <td bgcolor="#ffffff" valign="top" colspan=2>
  *       FPGA Configuration<p>
  *       <table bgcolor="#404040" cellspacing=1 cellpadding=6>
  *         <tr>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Vendor request (VR)<br> or command (VC)</b></td>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x30</td>
  *           <td bgcolor="#ffffff" valign="top">Get FPGA state. Returns:
  *             <table bgcolor="#404040" cellspacing=1 cellpadding=4>
  *               <tr>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Bytes</b></td>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">0</td>
  *                 <td bgcolor="#ffffff" valign="top">1: unconfigured, 0:configured</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">1</td>
  *                 <td bgcolor="#ffffff" valign="top">Checksum</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">2-5</td>
  *                 <td bgcolor="#ffffff" valign="top">Number of bytes transferred.</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">6</td>
  *                 <td bgcolor="#ffffff" valign="top">INIT_B states (Must be 222).</td>
  *               </tr>
  *             </table>
  *           </td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VC 0x31</td>
  *           <td bgcolor="#ffffff" valign="top">Reset FPGA</td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x32</td>
  *           <td bgcolor="#ffffff" valign="top">Send Bitstream</td>
  *         </tr>
  *       </table>
  *     </td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">0.2</td>
  *     <td bgcolor="#ffffff" valign="top" colspan=2>
  *       Flash memory support<p>
  *       <table bgcolor="#404040" cellspacing=1 cellpadding=6>
  *         <tr>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Vendor request (VR)<br> or command (VC)</b></td>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x40</td>
  *           <td bgcolor="#ffffff" valign="top">Get Flash state. Returns:
  *             <table bgcolor="#404040" cellspacing=1 cellpadding=4>
  *               <tr>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Bytes</b></td>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">0</td>
  *                 <td bgcolor="#ffffff" valign="top">1:enabled, 0:disabled</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">1-2</td>
  *                 <td bgcolor="#ffffff" valign="top">Sector size</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">3-6</td>
  *                 <td bgcolor="#ffffff" valign="top">Number of sectors</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">7</td>
  *                 <td bgcolor="#ffffff" valign="top">Error code</td>
  *               </tr>
  *             </table>
  *           </td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x41</td>
  *           <td bgcolor="#ffffff" valign="top">Read one sector from Flash</td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VC 0x42</td>
  *           <td bgcolor="#ffffff" valign="top">Write one sector to Flash</td>
  *         </tr>
  *       </table>
  *     </td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">0.3</td>
  *     <td bgcolor="#ffffff" valign="top" colspan=2>
  *       Debug helper support<p>
  *       <table bgcolor="#404040" cellspacing=1 cellpadding=6>
  *         <tr>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Vendor request (VR)<br> or command (VC)</b></td>
  *           <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *         </tr>
  *         <tr>
  *           <td bgcolor="#ffffff" valign="top">VR 0x28</td>
  *           <td bgcolor="#ffffff" valign="top">Get debug data. Returns:
  *             <table bgcolor="#404040" cellspacing=1 cellpadding=4>
  *               <tr>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Bytes</b></td>
  *                 <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">0-1</td>
  *                 <td bgcolor="#ffffff" valign="top">Number of the last message</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">2</td>
  *                 <td bgcolor="#ffffff" valign="top">Stack size in messages</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">3</td>
  *                 <td bgcolor="#ffffff" valign="top">Message size in bytes</td>
  *               </tr>
  *               <tr>
  *                 <td bgcolor="#ffffff" valign="top">&ge;4</td>
  *                 <td bgcolor="#ffffff" valign="top">Message stack</td>
  *               </tr>
  *             </table>
  *           </td>
  *         </tr>
  *       </table>
  *     </td>
  *   </tr>
  * </table>
  * @see ZtexDevice1
  * @see Ztex1
  */

public class Ztex1v1 extends Ztex1 {
    /** * Capability index for EEPROM support. */
    public static final int CAPABILITY_EEPROM = 0;
    /** * Capability index for FPGA configuration support. */
    public static final int CAPABILITY_FPGA = 1;
    /** * Capability index for FLASH memory support. */
    public static final int CAPABILITY_FLASH = 2;
    /** * Capability index for DEBUG helper support. */
    public static final int CAPABILITY_DEBUG = 3;
    /** * Capability index for AVR XMEGA support. */
    public static final int CAPABILITY_XMEGA = 4;

    /** * The names of the capabilities */
    public static final String capabilityStrings[] = {
	"EEPROM read/write" ,
	"FPGA configuration" ,
	"Flash memory support",
	"Debug helper",
	"XMEGA support"
    };
    
    private boolean fpgaConfigured = false;
    private int fpgaChecksum = 0;
    private int fpgaBytes = 0;
    private int fpgaInitB = 0;
    private int fpgaFlashResult = 255;
    private boolean fpgaFlashBitSwap = false;
    
    /** * Number of bytes written to EEPROM. (Obtained by {@link #eepromState()}.) */
    public int eepromBytes = 0;
    /** * Checksum of the last EEPROM transfer. (Obtained by {@link #eepromState()}.) */
    public int eepromChecksum = 0;

    private int flashEnabled = -1;
    private int flashSectorSize = -1;
    private int flashSectors = -1;

    /** * Last Flash error code obtained by {@link #flashState()}. See FLASH_EC_* for possible error codes. */
    public int flashEC = 0;
    /** * Means no error. */
    public static final int FLASH_EC_NO_ERROR = 0;
    /** * Signals an error while attempting to execute a command. */
    public static final int FLASH_EC_CMD_ERROR = 1;
    /** * Signals that a timeout occurred. */
    public static final int FLASH_EC_TIMEOUT = 2;
    /** * Signals that Flash memory it busy. */
    public static final int FLASH_EC_BUSY = 3;
    /** * Signals that another Flash operation is pending. */
    public static final int FLASH_EC_PENDING = 4;
    /** * Signals an error while attempting to read from Flash. */
    public static final int FLASH_EC_READ_ERROR = 5;
    /** * Signals an error while attempting to write to Flash. */
    public static final int FLASH_EC_WRITE_ERROR = 6;
    /** * Signals the the installed Flash memeory is not supported. */
    public static final int FLASH_EC_NOTSUPPORTED = 7;
    
    private int debugStackSize = -1;
    private int debugMsgSize = -1;
    private int debugLastMsg = 0;
    /** * Is set by {@link #debugReadMessages(boolean,byte[])} and conains the number of new messages. */
    public int debugNewMessages = 0;

// ******* Ztex1v1 *************************************************************
/** 
  * Constructs an instance from a given device.
  * @param pDev The given device.
  * @throws UsbException if an communication error occurred.
  */
    public Ztex1v1 ( ZtexDevice1 pDev ) throws UsbException {
	super ( pDev );
    }

// ******* valid ***************************************************************
/** 
  * Returns true if ZTEX interface 1 is available.
  * @return true if ZTEX interface 1 is available.
  */
    public boolean valid ( ) {
	return dev().valid() && dev().interfaceVersion()==1;
    }

/** 
  * Returns true if ZTEX interface 1 and capability i.j are available.
  * @param i byte index of the capability
  * @param j bit index of the capability
  * @return true if ZTEX interface 1 and capability i.j are available.
  */
    public boolean valid ( int i, int j) {
	return dev().valid() && dev().interfaceVersion()==1 && dev().interfaceCapabilities(i,j);
    }

// ******* compatible **********************************************************
/** 
  * Checks whether the given product ID is compatible to the device corresponding to this class and whether interface 1 is supported.<br>
  * The given product ID is compatible
  * <pre>if ( this.productId(0)==0 || productId0<=0 || this.productId(0)==productId0 ) && 
   ( this.productId(0)==0 || productId1<=0 || this.productId(1)==productId1 ) && 
   ( this.productId(2)==0 || productId2<=0 || this.productId(2)==productId2 ) && 
   ( this.productId(3)==0 || productId3<=0 || this.productId(3)==productId3 ) </pre>
  * @param productId0 Byte 0 of the given product ID
  * @param productId1 Byte 1 of the given product ID
  * @param productId2 Byte 2 of the given product ID
  * @param productId3 Byte 3 of the given product ID
  * @return true if the given product ID is compatible and interface 1 is supported.
  */
    public boolean compatible ( int productId0, int productId1, int productId2, int productId3 ) {
	return dev().valid() && dev().compatible ( productId0, productId1, productId2, productId3 ) && dev().interfaceVersion()==1;
    }

// ******* checkValid **********************************************************
/** 
  * Checks whether ZTEX descriptor 1 is available and interface 1 is supported.
  * @throws InvalidFirmwareException if ZTEX descriptor 1 is not available or interface 1 is not supported.
  */
    public void checkValid () throws InvalidFirmwareException {
	super.checkValid();
	if ( dev().interfaceVersion() != 1 )
	    throw new InvalidFirmwareException(this, "Wrong interface: " + dev().interfaceVersion() + ", expected: 1" );
    }

// ******* checkCapability *****************************************************
/** 
  * Checks whether ZTEX descriptor 1 is available and interface 1 and a given capability are supported.
  * @param i byte index of the capability
  * @param j bit index of the capability
  * @throws InvalidFirmwareException if ZTEX descriptor 1 is not available or interface 1 is not supported.
  * @throws CapabilityException if the given capability is not supported.
  */
    public void checkCapability ( int i, int j ) throws InvalidFirmwareException, CapabilityException {
	checkValid();
	if ( ! dev().interfaceCapabilities(i,j) ) {
	    int k = i*8 + j;
	    if ( k>=0 && k<capabilityStrings.length )
	    throw new CapabilityException( this, ( k>=0 && k<=capabilityStrings.length ) ? capabilityStrings[k] : ("Capabilty " + i + "," + j) ); 
	}
    }

/** 
  * Checks whether ZTEX descriptor 1 is available and interface 1 and a given capability are supported.
  * @param i capability index (0..47)
  * @throws InvalidFirmwareException if ZTEX descriptor 1 is not available or interface 1 is not supported.
  * @throws CapabilityException if the given capability is not supported.
  */
    public void checkCapability ( int i ) throws InvalidFirmwareException, CapabilityException {
	checkCapability(i/8, i%8);
    }

// ******* checkCompatible *****************************************************
/**
  * Checks whether the given product ID is compatible to the device corresponding to this class and whether interface 1 is supported.
  * See {@link #compatible(int,int,int,int)}.
  * @param productId0 Byte 0 of the given product ID
  * @param productId1 Byte 1 of the given product ID
  * @param productId2 Byte 2 of the given product ID
  * @param productId3 Byte 3 of the given product ID
  * @throws InvalidFirmwareException if the given product ID is not compatible or interface 1 is not supported.
  */
    public void checkCompatible ( int productId0, int productId1, int productId2, int productId3 ) throws InvalidFirmwareException {
	checkValid();
	if ( ! dev().compatible ( productId0, productId1, productId2, productId3 ) )
	    throw new InvalidFirmwareException(this, "Incompatible Product ID");
    }

// ******* getFpgaState ********************************************************
    private void getFpgaState () throws UsbException, InvalidFirmwareException, CapabilityException {
	byte[] buffer = new byte[9];
	checkCapability(CAPABILITY_FPGA);
	vendorRequest2(0x30, "getFpgaState", buffer, 9);
	fpgaConfigured = buffer[0] == 0;
	fpgaChecksum = buffer[1] & 0xff;
	fpgaBytes = ((buffer[5] & 0xff)<<24) | ((buffer[4] & 0xff)<<16) | ((buffer[3] & 0xff)<<8) | (buffer[2] & 0xff);
	fpgaInitB = buffer[6] & 0xff;
	fpgaFlashResult = buffer[7];
	fpgaFlashBitSwap = buffer[8] != 0;
    }

// ******* printFpgaState ******************************************************
/**
  * Prints out the FPGA state.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public void printFpgaState () throws UsbException, InvalidFirmwareException, CapabilityException {
	getFpgaState();
	System.out.println( "size=" + fpgaBytes + ";  checksum=" + fpgaChecksum + "; INIT_B_HIST=" + fpgaInitB +" (should be 222); flash_configuration_result=" + fpgaFlashResult );
    }

// ******* getFpgaConfiguration ************************************************
/**
  * Returns true if the FPGA is configured.
  * @return true if the FPGA is configured.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public boolean getFpgaConfiguration () throws UsbException, InvalidFirmwareException, CapabilityException {
	getFpgaState ();
	return fpgaConfigured;
    }

// ******* getFpgaConfigurationStr *********************************************
/**
  * Returns a string that indicates the FPGA configuration status.
  * @return a string that indicates the FPGA configuration status.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public String getFpgaConfigurationStr () throws UsbException, InvalidFirmwareException, CapabilityException {
	getFpgaState ();
	return fpgaConfigured ? "FPGA configured" : "FPGA unconfigured";
    }

// ******* resetFGPA ***********************************************************
/**
  * Resets the FPGA.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public void resetFpga () throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FPGA);
	vendorCommand(0x31, "resetFpga" );
    }


// ******* detectBitstreamBitOrder *********************************************
    private int detectBitstreamBitOrder ( byte[] buf ) {
	for ( int i=0; i<buf.length-3; i++ ) {
	    if ( ((buf[i] & 255)==0xaa) && ((buf[i+1] & 255)==0x99) && ((buf[i+2] & 255)==0x55) && ((buf[i+3] & 255)==0x66) )
		return 1;
	    if ( ((buf[i] & 255)==0x55) && ((buf[i+1] & 255)==0x99) && ((buf[i+2] & 255)==0xaa) && ((buf[i+3] & 255)==0x66) )
		return 0;
	} 
	System.err.println("Warning: Unable to determine bitstream bit order: no signature found");
	return 0;
    }

// ******* swapBits ************************************************************
    private void swapBits ( byte[][] buf, int size ) {
	int j=0, k=0;
	for (int i=0; i<size; i++ ) {
	    while ( k >= buf[j].length ) {
		j++;
		k=0;
	    }
	    byte b = buf[j][k];
	    buf[j][k] = (byte) ( ((b & 128) >> 7) |
 		     	         ((b &  64) >> 5) |
		     	         ((b &  32) >> 3) |
		     	         ((b &  16) >> 1) |
		     	         ((b &   8) << 1) |
		     	         ((b &   4) << 3) |
		     	         ((b &   2) << 5) |
		     	         ((b &   1) << 7) );
	    k++;
	}
    }

// ******* configureFpga *******************************************************
//  returns configuration time in ms
/**
  * Upload a Bitstream to the FPGA.
  * @param fwFileName The file name of the Bitstream. The file can be a regular file or a system resource (e.g. a file from the current jar archive).
  * @param force If set to true existing configurations will be overwritten. (By default an {@link AlreadyConfiguredException} is thrown).
  * @param bs 0: disable bit swapping, 1: enable bit swapping, all other values: automatic detection of bit order.
  * @throws BitstreamReadException if an error occurred while attempting to read the Bitstream.
  * @throws BitstreamUploadException if an error occurred while attempting to upload the Bitstream.
  * @throws AlreadyConfiguredException if the FPGA is already configured.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public long configureFpga ( String fwFileName, boolean force, int bs ) throws BitstreamReadException, UsbException, BitstreamUploadException, AlreadyConfiguredException, InvalidFirmwareException, CapabilityException {
	final int transactionBytes = certainWorkarounds ? 256 : 2048;
	long t0 = 0;

	checkCapability(CAPABILITY_FPGA);
	
	if ( !force && getFpgaConfiguration() )
	    throw new AlreadyConfiguredException(); 

// read the Bitstream file	
        byte[][] buffer = new byte[16*1024*1024/transactionBytes][];
	int size = 0;
	try {
	    InputStream inputStream = JInputStream.getInputStream( fwFileName );
	    int j = transactionBytes;
	    for ( int i=0; i<buffer.length && j==transactionBytes; i++ ) {
		buffer[i] = new byte[transactionBytes]; 
		j = inputStream.read( buffer[i] );
		if ( j < 0 ) 
		    j = 0;
		if ( j < transactionBytes && j % 64 == 0 )	// ensures size % 64 != 0
		    j+=1;
		size += j;
	    }
	    
	    try {
		inputStream.close();
	    }
	    catch ( Exception e ) {
		System.err.println( "Warning: Error closing file " + fwFileName + ": " + e.getLocalizedMessage() );
	    }
	}
	catch (IOException e) {
	    throw new BitstreamReadException(e.getLocalizedMessage());
	}
	if ( size < 64 || size % 64 == 0 ) 
	    throw new BitstreamReadException("Invalid file size: " + size );

// detect bitstream bit order and swap bits if necessary 
	if ( bs<0 || bs>1 )
	    bs = detectBitstreamBitOrder ( buffer[0] );
	if ( bs == 1 )
	    swapBits(buffer,size);
	    
// upload the Bitstream file	
	for ( int tries=10; tries>0; tries-- ) {
	    
	    resetFpga();

	    try {
		t0 = -new Date().getTime();
		int cs = 0;
		bs = 0;
		    
	    	for ( int i=0; i<buffer.length && i*transactionBytes < size; i++ ) {
		    int j = size-i*transactionBytes;
		    if (j>transactionBytes) 
			j = transactionBytes;
		    vendorCommand2(0x32, "sendFpgaData", 0,0, buffer[i], j);

		    bs+=j;
		    for ( int k=0; k<buffer[i].length; k++ ) 
		        cs = ( cs + (buffer[i][k] & 0xff) ) & 0xff;
		}

 		getFpgaState();
//		System.err.println("fpgaConfigred=" + fpgaConfigured + "   fpgaBytes="+fpgaBytes + " ("+bs+")   fpgaChecksum="+fpgaChecksum + " ("+cs+")   fpgaInitB="+fpgaInitB );
		if ( ! fpgaConfigured ) {
		    throw new BitstreamUploadException( "FPGA configuration failed: DONE pin does not go high (size=" + fpgaBytes + " ,  " + (bs - fpgaBytes) + " bytes went lost;  checksum=" 
			+ fpgaChecksum + " , should be " + cs + ";  INIT_B_HIST=" + fpgaInitB +", should be 222)" );
		}
//		System.out.println( "FPGA configuration: size=" + fpgaBytes + " ,  " + (bs - fpgaBytes) + " bytes went lost;  checksum=" + fpgaChecksum + " , should be " + cs + ";  INIT_B_HIST=" + fpgaInitB +", should be 222" );
//		if ( fpgaInitB != 222 )
//		    System.err.println ( "Warning: FPGA configuration may have failed: DONE pin has gone high but INIT_B states are wrong: " + fpgaInitB +", should be 222");
			
		tries = 0;
		t0 += new Date().getTime();

	    } 
	    catch ( BitstreamUploadException e ) {
		if ( tries>1 ) 
		    System.err.println("Warning: " + e.getLocalizedMessage() +": Retrying it ...");
		else 
		    throw e;
	    }
	}

    	try {
    	    Thread.sleep( 200 );
    	}
	catch ( InterruptedException e) {
        } 
	
	return t0;
    } 

/**
  * Upload a Bitstream to the FPGA.
  * @param fwFileName The file name of the Bitstream. The file can be a regular file or a system resource (e.g. a file from the current jar archive).
  * @param force If set to true existing configurations will be overwritten. (By default an {@link AlreadyConfiguredException} is thrown).
  * @throws BitstreamReadException if an error occurred while attempting to read the Bitstream.
  * @throws BitstreamUploadException if an error occurred while attempting to upload the Bitstream.
  * @throws AlreadyConfiguredException if the FPGA is already configured.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if FPGA configuration is not supported by the firmware.
  */
    public long configureFpga ( String fwFileName, boolean force ) throws BitstreamReadException, UsbException, BitstreamUploadException, AlreadyConfiguredException, InvalidFirmwareException, CapabilityException {
	return configureFpga(fwFileName, force, -1);
    }

// ******* eepromState *********************************************************
// returns true if EEPROM is ready
/**
  * Reads the current EEPROM status.
  * This method also sets the varibles {@link #eepromBytes} and {@link #eepromChecksum}.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if EEPROM access is not supported by the firmware.
  * @return true if EEPROM is ready.
  */
    public boolean eepromState ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	byte[] buf = new byte[4];
	checkCapability(CAPABILITY_EEPROM);
	vendorRequest2(0x3A, "EEPROM State", 0, 0, buf, 4);
	eepromBytes = (buf[0] & 255) | (buf[1] & 255)<<8;
	eepromChecksum = buf[2] & 255;
	return buf[3] == 0;
    }

// ******* eepromWrite *********************************************************
/**
  * Writes data to the EEPROM.
  * @param addr The destination address of the EEPROM.
  * @param buf The data.
  * @param length The amount of bytes to be sent.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if EEPROM access is not supported by the firmware.
  */
    public void eepromWrite ( int addr, byte[] buf, int length ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_EEPROM);
	vendorCommand2( 0x39, "EEPROM Write", addr, 0, buf, length );
    	try {
    	    Thread.sleep( 10 );
    	}
	catch ( InterruptedException e) {
        } 
    }

// ******* eepromRead **********************************************************
/**
  * Reads data from the EEPROM.
  * @param addr The source address of the EEPROM.
  * @param buf A buffer for the storage of the data.
  * @param length The amount of bytes to be read.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if EEPROM access is not supported by the firmware.
  */
    public void eepromRead ( int addr, byte[] buf, int length ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_EEPROM);
	vendorRequest2( 0x38, "EEPROM Read", addr, 0, buf, length );		// sometimes a little bit slow
    	try {
    	    Thread.sleep( 10 );
    	}
	catch ( InterruptedException e) {
        } 
    }

// ******* eepromUpload ********************************************************
//  returns upload time in ms
/**
  * Upload the firmware to the EEPROM.
  * In order to start the uploaded firmware the device must be reset.
  * @param ihxFileName The file name of the firmware image in ihx format. The file can be a regular file or a system resource (e.g. a file from the current jar archive).
  * @param force Skips the compatibility check if true.
  * @throws IncompatibleFirmwareException if the given firmware is not compatible to the installed one, see {@link #compatible(int,int,int,int)} (Upload can be enforced using the <tt>force</tt> parameter.)
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws CapabilityException if EEPROM access is not supported by the firmware.
  * @throws FirmwareUploadException if an error occurred while attempting to upload the firmware.
  */
    public long eepromUpload ( String ihxFileName, boolean force ) throws IncompatibleFirmwareException, FirmwareUploadException, InvalidFirmwareException, CapabilityException {
	final int pagesMax = 256;
	final int pageSize = 256;
	int pages = 0;
	byte[][] buffer = new byte[pagesMax][];

	checkCapability(CAPABILITY_EEPROM);
	
// load the ihx file
	ZtexIhxFile1 ihxFile;
	try {
	    ihxFile = new ZtexIhxFile1( ihxFileName );
	}
	catch ( IOException e ) {
	    throw new FirmwareUploadException( e.getLocalizedMessage() );
	}
	catch ( IhxFileDamagedException e ) {
	    throw new FirmwareUploadException( e.getLocalizedMessage() );
	}
//	ihxFile.dataInfo(System.out);
//	System.out.println(ihxFile);

// check for compatibility
	if ( ! force && dev().valid() ) {
	    if ( ihxFile.interfaceVersion() != 1 )
		throw new IncompatibleFirmwareException("Wrong interface version: Expected 1, got " + ihxFile.interfaceVersion() );
	
	    if ( ! dev().compatible ( ihxFile.productId(0), ihxFile.productId(1), ihxFile.productId(2), ihxFile.productId(3) ) )
		throw new IncompatibleFirmwareException("Incompatible productId's: Current firmware: " + ZtexDevice1.byteArrayString(dev().productId()) 
		    + "  Ihx File: " + ZtexDevice1.byteArrayString(ihxFile.productId()) );
	}

	Usb_Device_Descriptor dd = dev().dev().getDescriptor();
	int vid = dd.getIdVendor() & 65535;
	int pid = dd.getIdProduct() & 65535;

	buffer[0] = new byte[pageSize];
	buffer[0][0] = (byte) 0xc2;
	buffer[0][1] = (byte) (vid & 255);
	buffer[0][2] = (byte) ((vid >> 8) & 255);
	buffer[0][3] = (byte) (pid & 255);
	buffer[0][4] = (byte) ((pid >> 8) & 255);
	buffer[0][5] = 0;
	buffer[0][6] = 0;
	buffer[0][7] = 0;
	
	int ptr = 8, i = 0;
	
	while ( i < ihxFile.ihxData.length ) {
	    if ( ihxFile.ihxData[i]>=0 && ihxFile.ihxData[i]<256 ) {			// new data block
		int j = 1;
		while ( i+j<ihxFile.ihxData.length && ihxFile.ihxData[i+j]>=0 && ihxFile.ihxData[i+j]<255 ) 
		    j++;

		for (int k=ptr/pageSize + 1; k < (ptr+j+4)/pageSize + 1; k++ )	// also considers 5 bytes for the last data block
		    buffer[k] = new byte[pageSize];

		buffer[(ptr+0)/pageSize][(ptr+0) % pageSize] = (byte) ((j >> 8) & 255);	
		buffer[(ptr+1)/pageSize][(ptr+1) % pageSize] = (byte) (j & 255);		// length
		buffer[(ptr+2)/pageSize][(ptr+2) % pageSize] = (byte) ((i >> 8) & 255);
		buffer[(ptr+3)/pageSize][(ptr+3) % pageSize] = (byte) (i & 255);		// address
		ptr+=4;
		for ( int k=0; k<j; k++ )  					// data
		    buffer[(ptr+k)/pageSize][(ptr+k) % pageSize] = (byte) ihxFile.ihxData[i+k];
		ptr+=j;
		i+=j;
	    }
	    else {
		i+=1;
	    }
	}
	
	buffer[(ptr+0)/pageSize][(ptr+0) % pageSize] = (byte) 0x80;		// last data block
	buffer[(ptr+1)/pageSize][(ptr+1) % pageSize] = (byte) 0x01;
	buffer[(ptr+2)/pageSize][(ptr+2) % pageSize] = (byte) 0xe6;
	buffer[(ptr+3)/pageSize][(ptr+3) % pageSize] = (byte) 0x00;
	buffer[(ptr+3)/pageSize][(ptr+4) % pageSize] = (byte) 0x00;
	ptr+=5;


	long t0 = new Date().getTime();
	byte[] rbuf = new byte[pageSize];

	for ( i=(ptr-1)/pageSize; i>=0; i-- ) {
	    
	    int k = (i+1)*pageSize < ptr ? pageSize : ptr-i*pageSize;
	    int cs = 0;
	    for (int j=0; j<k; j++ ) {
		cs = ( cs + (buffer[i][j] & 255) ) & 255;
	    }

	    for ( int tries=3; tries>0; tries-- ) {
	    	try {
		    eepromWrite(i*pageSize, buffer[i], k);
		    eepromState();
		    if ( eepromBytes!=k )
			throw new FirmwareUploadException("Error writing data to EEPROM: Wrote " + eepromBytes + " bytes instead of "  + k + " bytes" );
		    if ( eepromChecksum!=cs )
			throw new FirmwareUploadException("Error writing data to EEPROM: Checksum error");

    		    eepromRead(i*pageSize, rbuf, k);
		    for (int j=0; j<k; j++ ) {
			if ( rbuf[j] != buffer[i][j] )
			    throw new FirmwareUploadException("Error writing data to EEPROM: Verification failed");
		    }
		    tries = 0;
		}
		catch ( Exception e ) {
		    if ( tries > 1 ) {
			System.err.println("Warning: " + e.getLocalizedMessage() +": Retrying it ...");
		    }
		    else {
			throw new FirmwareUploadException(e.getLocalizedMessage());
		    }
		}
	    } 
	}
	
	return new Date().getTime() - t0;
    }
    

// ******* eepromDisable ********************************************************
/**
  * Disables the firmware stored in the EEPROM.
  * This is achived by writing a "0" to the address 0 of the EEPROM.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws CapabilityException if EEPROM access is not supported by the firmware.
  * @throws FirmwareUploadException if an error occurred while attempting to disable the firmware.
  */
    public void eepromDisable ( ) throws FirmwareUploadException, InvalidFirmwareException, CapabilityException {
	byte[] buf = { 0 };

	for ( int tries=3; tries>0; tries-- ) {
	    try {
	        eepromWrite(0, buf, 1);

    		eepromRead(0, buf, 1);
		if ( buf[0] != 0 )
		    throw new FirmwareUploadException("Error disabeling EEPROM firmware: Verification failed");
		tries = 0;

    	    }
	    catch ( Exception e ) {
	        if ( tries > 1 ) {
	    	    System.err.println("Warning: " + e.getLocalizedMessage() +": Retrying it ...");
		}
		else {
		    throw new FirmwareUploadException(e.getLocalizedMessage());
		}
	    } 
	}
    } 

// ******* flashStrError *******************************************************
/** 
  * Converts a given error code into a String.
  * @param errNum The error code.
  * @return an error message.
  */
    public static String flashStrError ( int errNum ) {
	switch ( errNum ) {
	    case FLASH_EC_NO_ERROR:
		return "USB error: " + LibusbJava.usb_strerror();
	    case FLASH_EC_CMD_ERROR:
		return "Command error";
	    case FLASH_EC_TIMEOUT:
		return "Timeout error";
	    case FLASH_EC_BUSY:
		return "Busy";
	    case FLASH_EC_PENDING:
		return "Another operation is pending";
	    case FLASH_EC_READ_ERROR:
		return "Read error";
	    case FLASH_EC_WRITE_ERROR:
		return "Write error";
	    case FLASH_EC_NOTSUPPORTED:
		return "Not supported";
	}
	return "Error " + errNum;
    }

/** 
  * Gets the last Flash error from the device.
  * @return an error message.
  */
    public String flashStrError ( ) {
	try {
	    return flashStrError( getFlashEC() );
	}
	catch ( Exception e ) {
	    return "Unknown error (Error receiving errorcode: "+e.getLocalizedMessage() +")";
	}
    }

// ******* flashState **********************************************************
/**
  * Reads the the Flash memory status and information.
  * This method also sets the variables {@link #flashEnabled}, {@link #flashSectorSize} and {@link #flashSectors}.
  * @return true if Flash memory is installed.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public boolean flashState () throws UsbException, InvalidFirmwareException, CapabilityException {
	byte[] buf = new byte[8];
	checkCapability(CAPABILITY_FLASH);

	// device may be busy due to initialization, we try it up to up to 4s
	vendorRequest2(0x40, "Flash State", 0, 0, buf, 8);
    	flashEC = buf[7] & 255;
	int tries=20;	
	while ( flashEC==FLASH_EC_BUSY && tries>0 )
	{
	    try {
    		Thread.sleep( 200 );
    	    }
	    catch ( InterruptedException e) {
    	    } 
	    tries-=1;
	    vendorRequest2(0x40, "Flash State", 0, 0, buf, 8);
    	    flashEC = buf[7] & 255;
	}
	flashEnabled = buf[0] & 255;
	flashSectorSize = flashEnabled == 1 ? ((buf[2] & 255) << 8) | (buf[1] & 255) : 0;
	flashSectors = flashEnabled == 1 ? ((buf[6] & 255) << 24) | ((buf[5] & 255) << 16) | ((buf[4] & 255) << 8) | (buf[3] & 255) : 0;
	return flashEnabled == 1;
    }

// ******* getFlashEC **********************************************************
// reads the current error code
/**
  * Gets the last Flash error from the device.
  * @return The last error code.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public int getFlashEC () throws UsbException, InvalidFirmwareException, CapabilityException {
	byte[] buf = new byte[8];
	checkCapability(CAPABILITY_FLASH);
	vendorRequest2(0x40, "Flash State", 0, 0, buf, 8);
    	flashEC = buf[7] & 255;
	return flashEC;
    }

// ******* flashReadSector ****************************************************
// read exactly one sector
/**
  * Reads one sector from the Flash.
  * @param sector The sector number to be read.
  * @param buf A buffer for the storage of the data.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public void flashReadSector ( int sector, byte[] buf ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FLASH);
	if ( ! flashEnabled() )
	    throw new CapabilityException(this, "No Flash memory installed or");

	try {
	    vendorRequest2( 0x41, "Flash Read", sector, sector >> 16, buf, flashSectorSize );
        }
        catch ( UsbException e ) {
	    throw new UsbException( dev().dev(), "Flash Read: " + flashStrError() ); 
	}
    }

// ******* flashWriteSector ***************************************************
// write exactly one sector
/**
  * Writes one sector to the Flash.
  * @param sector The sector number to be written.
  * @param buf The data.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public void flashWriteSector ( int sector, byte[] buf ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FLASH);
	if ( ! flashEnabled() )
	    throw new CapabilityException(this, "No Flash memory installed or");

	try {
	    vendorCommand2( 0x42, "Flash Write", sector, sector >> 16, buf, flashSectorSize );
	}
	catch ( UsbException e ) {
	    throw new UsbException( dev().dev(), "Flash Write: " + flashStrError() );
	}
    }

// ******* flashEnabled ********************************************************
// returns enabled / disabled state 
/**
  * Returns true if Flash memory is installed.
  * @return true if Flash memory is installed.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public boolean flashEnabled () throws UsbException, InvalidFirmwareException, CapabilityException {
	if ( flashEnabled < 0 ) // init variable
	    flashState();
	return flashEnabled == 1;
    }

// ******* flashSectorSize *****************************************************
// returns sector size of Flash memory, if available
/**
  * Returns the sector size of the Flash memory or 0, if no flash memory is installed.
  * If required, the sector size is determined form the device first.
  * @return the sector size of the Flash memory.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public int flashSectorSize () throws UsbException, InvalidFirmwareException, CapabilityException {
	if ( flashSectorSize < 0 ) // init variable
	    flashState();
	return flashSectorSize;
    }

// ******* flashSectors ********************************************************
// returns number of sectors of Flash memory, if available
/**
  * Returns the number of sectors of the Flash memory or 0, if no Flash memory is installed.
  * If required, the number of sectors is determined form the device first.
  * @return the number of sectors of the Flash memory.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public int flashSectors () throws UsbException, InvalidFirmwareException, CapabilityException {
	if ( flashSectors < 0 ) // init variable
	    flashState();
	return flashSectors;
    }

// ******* flashSize ***********************************************************
// returns size of Flash memory, if available
/**
  * Returns the size of Flash memory or 0, if no Flash memory is installed.
  * If required, the Flash size is determined form the device first.
  * @return the size of Flash memory.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public long flashSize () throws UsbException, InvalidFirmwareException, CapabilityException {
	return flashSectorSize() * (long)flashSectors();
    }

// ******* printMmcState *******************************************************
// returns true if Flash is available
/**
  * Prints out some debug information about *SD/MMC Flash cards in SPI mode.<br>
  * <b>Only use this method if such kind of Flash is installed.</b>
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not supported by the firmware.
  */
    public boolean printMmcState ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	byte[] buf = new byte[23];
	checkCapability(CAPABILITY_FLASH);
	vendorRequest2(0x43, "MMC State", 0, 0, buf, 23);
	System.out.println("status=" + Integer.toBinaryString(256+(buf[0] & 255)).substring(1) + "." + Integer.toBinaryString(256+(buf[1] & 255)).substring(1) + 
		"   lastCmd=" + buf[3] + 
		"   lastCmdResponse=" + Integer.toBinaryString(256+(buf[4] & 255)).substring(1) + 
		"   ec=" + buf[2] +
		"   BUSY=" + buf[22] + 
		"   SDHC=" + buf[5] + 
		"   buf=" + (buf[6] & 255)+" "+(buf[7] & 255)+" "+(buf[8] & 255)+" "+(buf[9] & 255)+" "+(buf[10] & 255)+" "+(buf[11] & 255)+"  "+(buf[12] & 255)); // +" "+(buf[13] & 255)+" "+(buf[14] & 255)+" "+(buf[15] & 255)+" "+(buf[16] & 255)+" "+(buf[17] & 255));

	return flashEnabled == 1;
    }

// ******* flashUploadBitstream ************************************************
/* 
    Returns configuration time in ms.
    The format of the boot sector (sector 0 of the Flash memory) is
	0..7	
	8..9	Number of sectors, or 0 is disabled
	10..11  Number of bytes in the last sector, i.e. th total size of Bitstream is ((bs[8] | (bs[9]<<8) - 1) * flash_sector_size + ((bs[10] | (bs[11]<<8))
*/	
/**
  * Uploads a Bitstream to the Flash.
  * This allows the firmware to load the Bitstream from Flash. Together with installation of the firmware in EEPROM
  * it is possible to construct fully autonomous devices.
  * <p>
  * Information about the bitstream is stored in sector 0.
  * This so called boot sector has the following format:
  * <table bgcolor="#404040" cellspacing=1 cellpadding=4>
  *   <tr>
  *     <td bgcolor="#d0d0d0" valign="bottom"><b>Bytes</b></td>
  *     <td bgcolor="#d0d0d0" valign="bottom"><b>Description</b></td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">0..7</td>
  *     <td bgcolor="#ffffff" valign="top">ID, must be "ZTEXBS",1,1</td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">8..9</td>
  *     <td bgcolor="#ffffff" valign="top">The number of sectors used to store the Bitstream. 0 means no Bitstream.</td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">10..11</td>
  *     <td bgcolor="#ffffff" valign="top">The number of bytes in the last sector.</td>
  *   </tr>
  *   <tr>
  *     <td bgcolor="#ffffff" valign="top">12..sectorSize-1</td>
  *     <td bgcolor="#ffffff" valign="top">This data is reserved for future use and preserved by this method.</td>
  *   </tr>
  * </table>
  * <p>
  * The total size of the Bitstream is computed as ((bs[8] | (bs[9]<<8) - 1) * flash_sector_size + ((bs[10] | (bs[11]<<8))
  * where bs[i] denotes byte i of the boot sector.
  * <p>
  * The first sector of the Bitstream is sector 1.
  * @param fwFileName The file name of the Bitstream. The file can be a regular file or a system resource (e.g. a file from the current jar archive).
  * @param bs 0: disable bit swapping, 1: enable bit swapping, all other values: automatic detection of bit order.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  * @throws BitstreamReadException if an error occurred while attempting to read the Bitstream.
  */
    public long flashUploadBitstream ( String fwFileName, int bs ) throws BitstreamReadException, UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FPGA);
	checkCapability(CAPABILITY_FLASH);
	if ( ! flashEnabled() )
	    throw new CapabilityException(this, "No Flash memory installed or");
	getFpgaState();
	
// read the Bitstream file	
        byte[][] buffer = new byte[32768][];
	int i,j;
	try {
	    InputStream inputStream = JInputStream.getInputStream( fwFileName );
	    j = flashSectorSize;
	    for ( i=0; i<buffer.length && j==flashSectorSize; i++ ) {
		buffer[i] = new byte[flashSectorSize]; 
		j = inputStream.read( buffer[i] );
		if ( j < 0 ) 
		    j = 0;
	    }
	    
	    try {
		inputStream.close();
	    }
	    catch ( Exception e ) {
		System.err.println( "Warning: Error closing file " + fwFileName + ": " + e.getLocalizedMessage() );
	    }
	}
	catch (IOException e) {
	    throw new BitstreamReadException(e.getLocalizedMessage());
	}

// detect bitstream bit order and swap bits if necessary 
	if ( bs<0 || bs>1 )
	    bs = detectBitstreamBitOrder(buffer[0]);
	if ( fpgaFlashBitSwap != (bs==1) )
	    swapBits( buffer, flashSectorSize*i );

// upload the Bitstream file	
	byte[] sector = new byte[flashSectorSize];
	byte[] ID = new String("ZTEXBS").getBytes(); 

	flashReadSector(0,sector);			// read the boot sector (only the first 16 bytes are overwritten)
	for (int k=0; k<6; k++)
	    sector[k]=ID[k];
	sector[6] = 1;
	sector[7] = 1;
	sector[8] = (byte) (i & 255);
	sector[9] = (byte) ((i>>8) & 255);
	sector[10] = (byte) (j & 255);
	sector[11] = (byte) ((j>>8) & 255);
	long t0 = new Date().getTime();
	flashWriteSector(0,sector);			// write the boot sector
	for (int k=0; k<i; k++)
	    flashWriteSector(k+1,buffer[k]);		// write the Bitstream sectors

	return new Date().getTime() - t0;
    } 

/**
  * Uploads a Bitstream to the Flash.
  * This allows the firmware to load the Bitstream from Flash. Together with installation of the firmware in EEPROM
  * it is possible to construct fully autonomous devices.
  * See {@link #flashUploadBitstream(String,int)} for further details.
  * @param fwFileName The file name of the Bitstream. The file can be a regular file or a system resource (e.g. a file from the current jar archive).
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  * @throws BitstreamReadException if an error occurred while attempting to read the Bitstream.
  */
    public long flashUploadBitstream ( String fwFileName ) throws BitstreamReadException, UsbException, InvalidFirmwareException, CapabilityException {
	return flashUploadBitstream(fwFileName, -1);
    }

// ******* flashResetBitstream *************************************************
// Clears a Bitstream from the Flash.
/**
  * Clears a Bitstream from the Flash.
  * This is achieved by writing 0 to bytes 8..9 of the boot sector, see {@link #flashUploadBitstream(String)}.
  * If no boot sector is installed the method returns without any write action.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public void flashResetBitstream ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FLASH);
	if ( ! flashEnabled() )
	    throw new CapabilityException(this, "No Flash memory installed or");
	byte[] sector = new byte[flashSectorSize];
	byte[] ID = new String("ZTEXBS").getBytes(); 

	flashReadSector(0,sector);			// read the boot sector
	for (int k=0; k<6; k++)
	    if ( sector[k] != ID[k] )
		return;
	if (sector[6]!=1 || sector[7]!=1 )
	    return;
	sector[8] = 0;
	sector[9] = 0;
	flashWriteSector(0,sector);			// write the boot sector
    } 

// ******* flashFirstFreeSector ************************************************
// Returns the first free sector of the Flash memory, i.e. the first sector behind the Bitstream
/**
  * Returns the first free sector of the Flash memory.
  * This is the first sector behind the Bitstream, or 0 if no boot sector is installed (or 1 if a boot sector but no Bitstream is installed).
  * @return the first free sector of the Flash memory.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public int flashFirstFreeSector ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_FLASH);
	if ( ! flashEnabled() )
	    throw new CapabilityException(this, "No Flash memory installed or");

	byte[] sector = new byte[flashSectorSize];
	byte[] ID = new String("ZTEXBS").getBytes(); 

	flashReadSector(0,sector);			// read the boot sector
	for (int k=0; k<6; k++)
	    if ( sector[k] != ID[k] )
		return 0;
	if (sector[6]!=1 || sector[7]!=1 )
	    return 0;
	return (sector[8] & 255) + ((sector[9] & 255) << 8) + 1;
    }
    

// ******* debugStackSize ******************************************************
/**
  * Returns the size of message stack in messages.
  * @return the size of message stack in messages.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public int debugStackSize ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_DEBUG);
	if ( debugStackSize<=0 || debugMsgSize<=0 ) {
	    byte[] buf = new byte[7];
	    vendorRequest2(0x28, "Read debug data", 0, 0, buf, 4);
	    debugStackSize = buf[2] & 255;
	    debugMsgSize = buf[3] & 255;
	}
	return debugStackSize;
    }

// ******* debugMsgSize ********************************************************
/**
  * Returns the size of messages in bytes.
  * @return the size of messages in bytes.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public int debugMsgSize ( ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_DEBUG);
	if ( debugMsgSize<=0 ) 
	    debugStackSize();
	
	return debugMsgSize;
    }

// ******* debugLastMsg ********************************************************
/**
  * Returns the number of the last message read out by {@link #debugReadMessages(boolean,byte[])}
  * @return the number of the last message read out by {@link #debugReadMessages(boolean,byte[])}
  */
    public final int debugLastMsg ( )  {
	return debugLastMsg;
    }

// ******* debugReadMessages ***************************************************
/**
  * Reads debug messages from message stack.
  * The number of messages stored in buf is returned. The total number of new messages is stored in {@link #debugNewMessages}.
  * The number of the latest message is returned by {@link #debugLastMsg()}.
  * @param all If true, all messages from stack are written to buf. If it is false, only the new messages are written to buf.
  * @param buf The buffer to store the messages.
  * @return the size of messages stored in buffer.
  * @throws InvalidFirmwareException if interface 1 is not supported.
  * @throws UsbException if a communication error occurs.
  * @throws CapabilityException if Flash memory access is not possible.
  */
    public int debugReadMessages ( boolean all, byte[] buf ) throws UsbException, InvalidFirmwareException, CapabilityException {
	checkCapability(CAPABILITY_DEBUG);
	byte buf2[] = new byte[ debugStackSize()*debugMsgSize() + 4 ];
	vendorRequest2(0x28, "Read debug data", 0, 0, buf2, buf2.length);
	int lm = (buf2[0] & 255) | ((buf2[1] & 255) << 8);
	debugNewMessages = lm - debugLastMsg;
	
	int r = Math.min( Math.min( buf.length/debugMsgSize() , debugStackSize ), lm);
	if ( !all ) r = Math.min(r,debugNewMessages);
	for (int i = 0; i<r; i++) {
	    int k=(lm-r+i) % debugStackSize;
	    for (int j=0; j<debugMsgSize; j++ )
		buf[i*debugMsgSize+j] = buf2[k*debugMsgSize+j+4];
	}
	
	debugLastMsg = lm;
	return r;
    }
    
// ******* toString ************************************************************
/** 
  * Returns a lot of useful information about the corresponding device.
  * @return a lot of useful information about the corresponding device.
  */
    public String toString () {
	String str = dev().toString();
	try {
	    str += "\n   " + getFpgaConfigurationStr();
	}
	catch ( Exception e ) {
	}
	return str;
    }

// ******* capabilityInfo ******************************************************
/**
  * Creates a String with capability information.
  * @param pf A separator between the single capabilities, e.g. ", "
  * @return a string of the supported capabilities.
  */
    public String capabilityInfo ( String pf ) {
	String str = "";
	for ( int i=0; i<6; i++ ) 
	    for (int j=0; j<8; j++ ) 
		if ( dev().interfaceCapabilities(i,j) ) {
		    if ( ! str.equals("") ) 
			str+=pf;
		    if (i*8+j < capabilityStrings.length) 
			str+=capabilityStrings[i*8+j];
		    else
			str+=i+"."+j;
		}
	return str;
    }
}    

