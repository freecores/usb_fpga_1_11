/*!
   flashdemo -- demo for Flash memory access from firmware and host software for ZTEX USB-FPGA Module 1.15
   Copyright (C) 2009-2011 ZTEX GmbH.
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

import java.io.*;
import java.util.*;

import ch.ntb.usb.*;

import ztex.*;

// *****************************************************************************
// ******* ParameterException **************************************************
// *****************************************************************************
// Exception the prints a help message
class ParameterException extends Exception {
    public final static String helpMsg = new String (
		"Parameters:\n"+
		"    -d <number>  Device Number (default: 0)\n" +
		"    -p           Print bus info\n" +
		"    -f           Force upload Firmware to RAM\n" + 
		"    -v           Upload configuration data for USB-FPGA Modules 1.15y\n" +
		"    -c           Clear settings from configuration data\n" +
		"    -ue          Upload Firmware to EEPROM\n" +
		"    -re          Reset EEPROM Firmware\n" +
		"    -h           This help" );
    
    public ParameterException (String msg) {
	super( msg + "\n" + helpMsg );
    }
}

// *****************************************************************************
// ******* Default *************************************************************
// *****************************************************************************
class Default {

// ******* main ****************************************************************
    public static void main (String args[]) {
    
	int devNum = 0;
	boolean force = false;
	boolean clear = false;
	int variant = 0;
	
	try {
// init USB stuff
	    LibusbJava.usb_init();

// scan the USB bus
	    ZtexScanBus1 bus = new ZtexScanBus1( ZtexDevice1.ztexVendorId, ZtexDevice1.ztexProductId, true, false, 1);
	    if ( bus.numberOfDevices() <= 0) {
		System.err.println("No devices found");
	        System.exit(0);
	    }
	    
// scan the command line arguments
    	    for (int i=0; i<args.length; i++ ) {
	        if ( args[i].equals("-d") ) {
	    	    i++;
		    try {
			if (i>=args.length) throw new Exception();
    			devNum = Integer.parseInt( args[i] );
		    } 
		    catch (Exception e) {
		        throw new ParameterException("Device number expected after -d");
		    }
		}
		else if ( args[i].equals("-p") ) {
	    	    bus.printBus(System.out);
		    System.exit(0);
		}
		else if ( args[i].equals("-f") ) {
	    	    force = true;
		}
		else if ( args[i].equals("-v") ) {
		    variant = 1;
		}
		else if ( args[i].equals("-c") ) {
		    clear = true;
		}
		else if ( args[i].equals("-h") ) {
		    System.err.println(ParameterException.helpMsg);
	    	    System.exit(0);
		}
		else if ( !args[i].equals("-re") && !args[i].equals("-ue") )
		    throw new ParameterException("Invalid Parameter: "+args[i]);
	    }

// create the main class	    
	    Ztex1v1 ztex = new Ztex1v1 ( bus.device(devNum) );
	    
// upload the firmware if necessary
	    if ( force || ! ztex.valid() || ! ztex.InterfaceCapabilities(ztex.CAPABILITY_EEPROM) || ! ztex.InterfaceCapabilities(ztex.CAPABILITY_MAC_EEPROM) ) {
		System.out.println("Firmware upload time: " + ztex.uploadFirmware( "default.ihx", force ) + " ms");
	    }	
	    
    	    for (int i=0; i<args.length; i++ ) {
		if ( args[i].equals("-re") ) {
		    ztex.eepromDisable();
		} 
		else if ( args[i].equals("-ue") ) {
		    System.out.println("Firmware to EEPROM upload time: " + ztex.eepromUpload( "default.ihx", force ) + " ms");
		}
	    }

//	    if ( ztex.config!=null ) System.out.println(ztex.config.getName());
	    
// generate and upload config data
	    if ( variant > 0 )
	    {
    		ConfigData config = new ConfigData();
    		if ( ! clear  ) {
    		    if ( config.connect(ztex) ) 
    			System.out.println("Reading configuration data."); 
    		    config.disconnect();
    		}
    		
//    		System.out.println("ud[33]="+config.getUserData(33));
//    		config.setUserData(33, (byte) (config.getUserData(33)+1) );
    		
		config.setName("ZTEX USB-FPGA Module", 1, 15, "y");
		config.setFpga("Quad-XC6SLX150", "CSG484", "3NC");

		System.out.println("Writing configuration data."); 
    		ztex.config=null;
		ztex.macEepromWrite(0, config.data(), 128);
	    }
	    
		
	}
	catch (Exception e) {
	    System.out.println("Error: "+e.getLocalizedMessage() );
	} 
	catch (Error e) {
	    System.out.println("Error: "+e.getLocalizedMessage() );
	} 
    } 
   
}
