--*****************************************************************************
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
--
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: %version
--  \   \         Application: MIG
--  /   /         Filename: mcb_soft_calibration.vhd
-- /___/   /\     Date Last Modified: $Date: 2009/10/30 13:11:40 $
-- \   \  /  \    Date Created: Mon Feb 9 2009
--  \___\/\___\
--
--Device: Spartan6
--Design Name: DDR/DDR2/DDR3/LPDDR
--Purpose:  Xilinx reference design for MCB Soft
--           Calibration
--Reference:
--
--  Revision:      Date:  Comment
--       1.0:  2/06/09:   Initial version for MIG wrapper.
--       1.1:  2/09/09:   moved Max_Value_Previous assignments to be completely inside CASE statement for next-state logic (needed to get it working correctly)
--       1.2:  2/12/09:   Many other changes.
--       1.3:  2/26/09:   Removed section with Max_Value_pre and DQS_COUNT_PREVIOUS_pre, and instead added PREVIOUS_STATE reg and moved assignment to within STATE
--       1.4:  3/02/09:   Removed comments out of sensitivity list of always block to mux SDI, SDO, CS, and ADD.  Also added reg declaration for PREVIOUS_STATE
--       1.5:  3/16/09:   Added pll_lock port, and using it to gate reset.  Changing RST (except input port) to RST_reg and gating it with pll_lock.
--       1.6:  6/05/09:   Added START_DYN_CAL_PRE with pulse on SYSRST; removed MCB_UIDQCOUNT.
--       1.7:  6/24/09:   Gave RZQ and ZIO each their own unique ADD and SDI nets
-- End Revision
--**********************************************************************************

library ieee;
   use ieee.std_logic_1164.all;
   use ieee.std_logic_unsigned.all;
   USE ieee.numeric_std.all;

entity mcb_soft_calibration is
   generic (
      C_MEM_TZQINIT_MAXCNT      : std_logic_vector(9 downto 0) := "0100010010"; --x"512";  -- DDR3 Minimum delay between resets
      SKIP_IN_TERM_CAL          : integer := 0;		-- provides option to skip the input termination calibration
      SKIP_DYNAMIC_CAL          : integer := 0;		-- provides option to skip the dynamic delay calibration
      SKIP_DYN_IN_TERM          : integer := 1;         --provides option to skip the input termination calibration
      C_MC_CALIBRATION_MODE     : string  := "CALIBRATION"
      
      
      -- active high flag signals soft calibration of input delays is complete and MCB_UODONECAL is high (MCB hard calib complete)
      -- Lock signal from PLL
      -- IODRP ADD port
      -- IODRP SDI port
      -- RZQ pin from board - expected to have a 2*R resistor to ground
      -- RZQ IODRP's SDO port
      -- RZQ IODRP's CS port
      -- Z-stated IO pin - garanteed not to be driven externally
      -- ZIO IODRP's SDO port
      -- ZIO IODRP's CS port
      -- to MCB's UIADD port
      -- to MCB's UISDI port
      -- from MCB's UOSDO port (User output SDO)
      -- indicates when MCB hard calibration process is complete
      --  high during refresh cycle and time when MCB is innactive
      -- to MCB's UICS port (User Input CS)
      -- MCB's UIDRPUPDATE port (gets passed to IODRP2_MCB's MEMUPDATE port: this controls shadow latch used during IODRP2_MCB writes).  Currently just trasnparent
      -- only to MCB's UIBROADCAST port (User Input BROADCAST - gets passed to IODRP2_MCB's BKST port)
      --  to MCB's UIADDR port (gets passed to IODRP2_MCB's AUXADDR port
      --  set to 1 to take control of UI interface - removes control from internal calib block
      --  set to 0 to "tell" controller that it's still in a calibrate state
      --  enables read w/o writing by turning on a SDO->SDI loopback inside the IODRP2_MCBs (doesn't exist in regular IODRP2).  IODRPCTRLR_R_WB becomes don't-care.
      --  future hook to drive MCB's RECAL pin - initiates a hard re-calibration sequence when high
      --  drives the MCB's SYSRST pin - the main reset for MCB
      
   );
   port (
      UI_CLK                    : in std_logic; -- main clock input for logic and IODRP CLK pins.  At top level, this should also connect to IODRP2_MCB CLK pins
      RST                       : in std_logic; -- main system reset for both this Soft Calibration block - also will act as a passthrough to MCB's SYSRST
      DONE_SOFTANDHARD_CAL      : out std_logic;
      PLL_LOCK                  : in std_logic;
      IODRP_ADD                 : out std_logic;
      IODRP_SDI                 : out std_logic;
      RZQ_IN                    : in std_logic;
      RZQ_IODRP_SDO             : in std_logic;
      RZQ_IODRP_CS              : out std_logic;
      ZIO_IN                    : in std_logic;
      ZIO_IODRP_SDO             : in std_logic;
      ZIO_IODRP_CS              : out std_logic;
      MCB_UIADD                 : out std_logic;
      MCB_UISDI                 : out std_logic;
      MCB_UOSDO                 : in std_logic;
      MCB_UODONECAL             : in std_logic;
      MCB_UOREFRSHFLAG          : in std_logic;
      MCB_UICS                  : out std_logic;
      MCB_UIDRPUPDATE           : out std_logic;
      MCB_UIBROADCAST           : out std_logic;
      MCB_UIADDR                : out std_logic_vector(4 downto 0);
      MCB_UICMDEN               : out std_logic;
      MCB_UIDONECAL             : out std_logic;
      MCB_UIDQLOWERDEC          : out std_logic := '0';
      MCB_UIDQLOWERINC          : out std_logic := '0';
      MCB_UIDQUPPERDEC          : out std_logic := '0';
      MCB_UIDQUPPERINC          : out std_logic := '0';
      MCB_UILDQSDEC             : out std_logic;
      MCB_UILDQSINC             : out std_logic;
      MCB_UIREAD                : out std_logic;
      MCB_UIUDQSDEC             : out std_logic;
      MCB_UIUDQSINC             : out std_logic;
      MCB_RECAL                 : out std_logic := '0';
      MCB_UICMD                 : out std_logic;
      MCB_UICMDIN               : out std_logic;
      MCB_UIDQCOUNT             : out std_logic_vector(3 downto 0);
      MCB_UODATA                : in std_logic_vector(7 downto 0);
      MCB_UODATAVALID           : in std_logic;
      MCB_UOCMDREADY            : in std_logic;
      MCB_SYSRST                : out std_logic;
      Max_Value                 : out std_logic_vector(7 downto 0)
   );
end entity mcb_soft_calibration;

architecture trans of mcb_soft_calibration is


     constant IOI_DQ0                   : std_logic_vector(4 downto 0) := ("0000" & '1');
     constant IOI_DQ1                   : std_logic_vector(4 downto 0) := ("0000" & '0');
     constant IOI_DQ2                   : std_logic_vector(4 downto 0) := ("0001" & '1');
     constant IOI_DQ3                   : std_logic_vector(4 downto 0) := ("0001" & '0');
     constant IOI_DQ4                   : std_logic_vector(4 downto 0) := ("0010" & '1');
     constant IOI_DQ5                   : std_logic_vector(4 downto 0) := ("0010" & '0');
     constant IOI_DQ6                   : std_logic_vector(4 downto 0) := ("0011" & '1');
     constant IOI_DQ7                   : std_logic_vector(4 downto 0) := ("0011" & '0');
     constant IOI_DQ8                   : std_logic_vector(4 downto 0) := ("0100" & '1');
     constant IOI_DQ9                   : std_logic_vector(4 downto 0) := ("0100" & '0');
     constant IOI_DQ10                  : std_logic_vector(4 downto 0) := ("0101" & '1');
     constant IOI_DQ11                  : std_logic_vector(4 downto 0) := ("0101" & '0');
     constant IOI_DQ12                  : std_logic_vector(4 downto 0) := ("0110" & '1');
     constant IOI_DQ13                  : std_logic_vector(4 downto 0) := ("0110" & '0');
     constant IOI_DQ14                  : std_logic_vector(4 downto 0) := ("0111" & '1');
     constant IOI_DQ15                  : std_logic_vector(4 downto 0) := ("0111" & '0');
     constant IOI_UDM                   : std_logic_vector(4 downto 0) := ("1000" & '1');
     constant IOI_LDM                   : std_logic_vector(4 downto 0) := ("1000" & '0');
     constant IOI_CK_P                  : std_logic_vector(4 downto 0) := ("1001" & '1');
     constant IOI_CK_N                  : std_logic_vector(4 downto 0) := ("1001" & '0');
     constant IOI_RESET                 : std_logic_vector(4 downto 0) := ("1010" & '1');
     constant IOI_A11                   : std_logic_vector(4 downto 0) := ("1010" & '0');
     constant IOI_WE                    : std_logic_vector(4 downto 0) := ("1011" & '1');
     constant IOI_BA2                   : std_logic_vector(4 downto 0) := ("1011" & '0');
     constant IOI_BA0                   : std_logic_vector(4 downto 0) := ("1100" & '1');
     constant IOI_BA1                   : std_logic_vector(4 downto 0) := ("1100" & '0');
     constant IOI_RASN                  : std_logic_vector(4 downto 0) := ("1101" & '1');
     constant IOI_CASN                  : std_logic_vector(4 downto 0) := ("1101" & '0');
     constant IOI_UDQS_CLK              : std_logic_vector(4 downto 0) := ("1110" & '1');
     constant IOI_UDQS_PIN              : std_logic_vector(4 downto 0) := ("1110" & '0');
     constant IOI_LDQS_CLK              : std_logic_vector(4 downto 0) := ("1111" & '1');
     constant IOI_LDQS_PIN              : std_logic_vector(4 downto 0) := ("1111" & '0');



     constant START                     : std_logic_vector(6 downto 0) := "0000000";
     constant LOAD_RZQ_NTERM            : std_logic_vector(6 downto 0) := "0000001";
     constant WAIT1                     : std_logic_vector(6 downto 0) := "0000010";
     constant LOAD_RZQ_PTERM            : std_logic_vector(6 downto 0) := "0000011";
     constant WAIT2                     : std_logic_vector(6 downto 0) := "0000100";
     constant INC_PTERM                 : std_logic_vector(6 downto 0) := "0000101";
     constant LOAD_ZIO_PTERM            : std_logic_vector(6 downto 0) := "0000110";
     constant WAIT3                     : std_logic_vector(6 downto 0) := "0000111";
     constant LOAD_ZIO_NTERM            : std_logic_vector(6 downto 0) := "0001000";
     constant WAIT4                     : std_logic_vector(6 downto 0) := "0001001";
     constant INC_NTERM                 : std_logic_vector(6 downto 0) := "0001010";
     constant WAIT_FOR_START_BROADCAST  : std_logic_vector(6 downto 0) := "0001011";
     constant BROADCAST_PTERM           : std_logic_vector(6 downto 0) := "0001100";
     constant WAIT5                     : std_logic_vector(6 downto 0) := "0001101";
     constant BROADCAST_NTERM           : std_logic_vector(6 downto 0) := "0001110";
     constant WAIT6                     : std_logic_vector(6 downto 0) := "0001111";
     constant OFF_RZQ_PTERM             : std_logic_vector(6 downto 0) := "0010000";
     constant WAIT7                     : std_logic_vector(6 downto 0) := "0010001";
     constant OFF_ZIO_NTERM             : std_logic_vector(6 downto 0) := "0010010";
     constant WAIT8                     : std_logic_vector(6 downto 0) := "0010011";
     constant RST_DELAY			: std_logic_vector(6 downto 0) := "0010100";
     constant START_DYN_CAL_PRE         : std_logic_vector(6 downto 0) := "0010101";
     constant WAIT_FOR_UODONE           : std_logic_vector(6 downto 0) := "0010110";
     constant LDQS_WRITE_POS_INDELAY    : std_logic_vector(6 downto 0) := "0010111";
     constant LDQS_WAIT1		: std_logic_vector(6 downto 0) := "0011000";
     constant LDQS_WRITE_NEG_INDELAY    : std_logic_vector(6 downto 0) := "0011001";
     constant LDQS_WAIT2		: std_logic_vector(6 downto 0) := "0011010";
     constant UDQS_WRITE_POS_INDELAY    : std_logic_vector(6 downto 0) := "0011011";
     constant UDQS_WAIT1                : std_logic_vector(6 downto 0) := "0011100";
     constant UDQS_WRITE_NEG_INDELAY    : std_logic_vector(6 downto 0) := "0011101";
     constant UDQS_WAIT2		: std_logic_vector(6 downto 0) := "0011110";
     constant START_DYN_CAL		: std_logic_vector(6 downto 0) := "0011111";

     constant WRITE_CALIBRATE           : std_logic_vector(6 downto 0) := "0100000";
     constant WAIT9			: std_logic_vector(6 downto 0) := "0100001";
     constant READ_MAX_VALUE            : std_logic_vector(6 downto 0) := "0100010";
     constant WAIT10			: std_logic_vector(6 downto 0) := "0100011";
     constant ANALYZE_MAX_VALUE         : std_logic_vector(6 downto 0) := "0100100";
     constant FIRST_DYN_CAL		: std_logic_vector(6 downto 0) := "0100101";
     constant INCREMENT                 : std_logic_vector(6 downto 0) := "0100110";
     constant DECREMENT			: std_logic_vector(6 downto 0) := "0100111";
     constant DONE                      : std_logic_vector(6 downto 0) := "1001111";
      


     constant RZQ                       : std_logic_vector(1 downto 0) := "00";
     constant ZIO                       : std_logic_vector(1 downto 0) := "01";
     constant MCB_PORT                  : std_logic_vector(1 downto 0) := "11";
      
     constant WRITE_MODE                : std_logic := '0';
     constant READ_MODE                 : std_logic := '1';
      
      -- IOI Registers
     constant NoOp                      : std_logic_vector(7 downto 0) := "00000000";
     constant DelayControl              : std_logic_vector(7 downto 0) := "00000001";
     constant PosEdgeInDly              : std_logic_vector(7 downto 0) := "00000010";
     constant NegEdgeInDly              : std_logic_vector(7 downto 0) := "00000011";
     constant PosEdgeOutDly             : std_logic_vector(7 downto 0) := "00000100";
     constant NegEdgeOutDly             : std_logic_vector(7 downto 0) := "00000101";
     constant MiscCtl1                  : std_logic_vector(7 downto 0) := "00000110";
     constant MiscCtl2                  : std_logic_vector(7 downto 0) := "00000111";
     constant MaxValue                  : std_logic_vector(7 downto 0) := "00001000";
      
      -- IOB Registers
     constant PDrive                    : std_logic_vector(7 downto 0) := "10000000";
     constant PTerm                     : std_logic_vector(7 downto 0) := "10000001";
     constant NDrive                    : std_logic_vector(7 downto 0) := "10000010";
     constant NTerm                     : std_logic_vector(7 downto 0) := "10000011";
     constant SlewRateCtl               : std_logic_vector(7 downto 0) := "10000100";
     constant LVDSControl               : std_logic_vector(7 downto 0) := "10000101";
     constant MiscControl               : std_logic_vector(7 downto 0) := "10000110";
     constant InputControl              : std_logic_vector(7 downto 0) := "10000111";
     constant TestReadback              : std_logic_vector(7 downto 0) := "10001000";

     constant MULT                      : integer := 7;
     constant DIV                       : integer  := 4;

     constant DQS_NUMERATOR             : integer  := 6;
     constant DQS_DENOMINATOR           : integer  := 16;
     constant INCDEC_THRESHOLD          : std_logic_vector(7 downto 0) := x"03";





  constant RST_CNT           : std_logic_vector(9 downto 0) := "0000010000";--x"10";
  constant TZQINIT_MAXCNT    : std_logic_vector(9 downto 0) := C_MEM_TZQINIT_MAXCNT + RST_CNT;

  constant IN_TERM_PASS : std_logic := '0';
  constant DYN_CAL_PASS : std_logic := '1';



--
 

   component iodrp_mcb_controller is
      port (
         memcell_address           : in std_logic_vector(7 downto 0);
         write_data                : in std_logic_vector(7 downto 0);
         read_data                 : out std_logic_vector(7 downto 0);
         rd_not_write              : in std_logic;
         cmd_valid                 : in std_logic;
         rdy_busy_n                : out std_logic;
         use_broadcast             : in std_logic;
         drp_ioi_addr              : in std_logic_vector(4 downto 0);
         sync_rst                  : in std_logic;
         DRP_CLK                   : in std_logic;
         DRP_CS                    : out std_logic;
         DRP_SDI                   : out std_logic;
         DRP_ADD                   : out std_logic;
         DRP_BKST                  : out std_logic;
         DRP_SDO                   : in std_logic;
         MCB_UIREAD                : out std_logic
      );
   end component;
   
   component iodrp_controller is
      port (
         memcell_address           : in std_logic_vector(7 downto 0);
         write_data                : in std_logic_vector(7 downto 0);
         read_data                 : out std_logic_vector(7 downto 0);
         rd_not_write              : in std_logic;
         cmd_valid                 : in std_logic;
         rdy_busy_n                : out std_logic;
         use_broadcast             : in std_logic;
         sync_rst                  : in std_logic;
         DRP_CLK                   : in std_logic;
         DRP_CS                    : out std_logic;
         DRP_SDI                   : out std_logic;
         DRP_ADD                   : out std_logic;
         DRP_BKST                  : out std_logic;
         DRP_SDO                   : in std_logic
      );
   end component;
   
--   signal CalPass                      : std_logic := '0';  
   signal P_Term                       : std_logic_vector(5 downto 0) := "000000";
   signal N_Term                       : std_logic_vector(6 downto 0) := "0000000";
   signal P_Term_Prev                  : std_logic_vector(5 downto 0) := "000000";
   signal N_Term_Prev                  : std_logic_vector(6 downto 0) := "0000000";


   signal STATE                        : std_logic_vector(6 downto 0) := START;
   signal IODRPCTRLR_MEMCELL_ADDR      : std_logic_vector(7 downto 0);
   signal IODRPCTRLR_WRITE_DATA        : std_logic_vector(7 downto 0);
   signal Active_IODRP                 : std_logic_vector(1 downto 0);
   signal IODRPCTRLR_R_WB              : std_logic := '0';
   signal IODRPCTRLR_CMD_VALID         : std_logic := '0';
   signal IODRPCTRLR_USE_BKST          : std_logic := '0';
   signal MCB_CMD_VALID                : std_logic := '0';
   signal MCB_USE_BKST                 : std_logic := '0';
   signal Pre_SYSRST                   : std_logic := '1';		--internally generated reset which will OR with RST input to drive MCB's SYSRST pin (MCB_SYSRST)
   signal IODRP_SDO                    : std_logic;
   signal DQS_Delay                    : std_logic_vector(7 downto 0) := "00000000";
   signal Max_Value_Previous           : std_logic_vector(7 downto 0) := "00000000";
   signal count                        : std_logic_vector(5 downto 0) := "000000";		--counter for adding 18 extra clock cycles after setting Calibrate bit
   signal counter_en                   : std_logic := '0';		--counter enable for "count"
   signal First_Dyn_Cal_Done           : std_logic := '0';		--flag - high after the very first dynamic calibration is done
   signal START_BROADCAST              : std_logic := '1';		-- Trigger to start Broadcast to IODRP2_MCBs to set Input Impedance - state machine will wait for this to be high
   signal DQS_COUNT                    : std_logic_vector(7 downto 0);		--to track how much LDQS and UDQS have been incremented/decremented - starting position will be 7F (half of FF)
   signal DQS_COUNT_PREVIOUS           : std_logic_vector(8 downto 0) := "000000000";		--also to track how much LDQS and UDQS have been incremented/decremented - starting position will be 7F (half of FF)

   signal DQS_COUNT_INITIAL           : std_logic_vector(7 downto 0);
   signal DQS_COUNT_VIRTUAL           : std_logic_vector(8 downto 0);


   signal IODRPCTRLR_READ_DATA         : std_logic_vector(7 downto 0);
   signal IODRPCTRLR_RDY_BUSY_N        : std_logic;
   signal IODRP_CS                     : std_logic;
   signal MCB_READ_DATA                : std_logic_vector(7 downto 0);
   signal RST_reg                      : std_logic;
   signal Block_Reset                  : std_logic;
   
   signal MCB_UODATAVALID_U            : std_logic;

   signal Inc_Dec_REFRSH_Flag          : std_logic_vector(2 downto 0);		-- 3-bit flag to show:Inc is needed, Dec needed, refresh cycle taking place
   signal Max_Value_Delta_Up           : std_logic_vector(7 downto 0);		-- tracks amount latest Max Value has gone up from previous Max Value read
   signal Half_MV_DU                   : std_logic_vector(7 downto 0);		-- half of Max_Value_Delta_Up
   signal Max_Value_Delta_Dn           : std_logic_vector(7 downto 0);		-- tracks amount latest Max Value has gone down from previous Max Value read
   signal Half_MV_DD                   : std_logic_vector(7 downto 0);		-- half of Max_Value_Delta_Dn

   signal RstCounter		       : std_logic_vector(9 downto 0);
   signal rst_tmp                      : std_logic;

   signal LastPass_DynCal              : std_logic;
   signal First_In_Term_Done           : std_logic;
   signal Inc_Flag                     : std_logic;
   signal Dec_Flag                     : std_logic;

   signal CALMODE_EQ_CALIBRATION       : std_logic;
   signal DQS_COUNT_LOWER_LIMIT	       : std_logic_vector(7 downto 0);
   signal DQS_COUNT_UPPER_LIMIT	       : std_logic_vector(7 downto 0);
   signal SKIP_DYN_IN_TERMINATION      : std_logic;
   signal SKIP_DYNAMIC_DQS_CAL         : std_logic;
   signal Quarter_Max_Value	       : std_logic_vector(7 downto 0);
   signal Half_Max_Value	       : std_logic_vector(7 downto 0);



   signal MCB_RDY_BUSY_N               : std_logic;
--   signal vio_ioi_addr                 : std_logic_vector(4 downto 0);		-- IOI Addr sent to soft cal from Chipscope VIO
--   signal ioi_addr                     : std_logic_vector(4 downto 0);
--   signal Max_Value_Invert             : std_logic_vector(7 downto 0);
--   signal ChkInvert                    : std_logic := '0';
--   signal LoopCnt                      : std_logic_vector(4 downto 0);
   
   --Pre_SYSRST is internally generated reset which will OR with RST_reg input to drive MCB's SYSRST pin (MCB_SYSRST)
   
   --`ifdef STATUS_FLD
   --`else
   
   --`endif
   


   
   -- Declare intermediate signals for referenced outputs
   signal IODRP_ADD_xilinx0            : std_logic;
   signal IODRP_SDI_xilinx1            : std_logic;
   signal MCB_UIADD_xilinx2            : std_logic;
   signal MCB_UISDI_xilinx11           : std_logic;
   signal MCB_UICS_xilinx6             : std_logic;
   signal MCB_UIBROADCAST_xilinx4      : std_logic;
   signal MCB_UIADDR_xilinx3           : std_logic_vector(4 downto 0);
   signal MCB_UICMDEN_xilinx5          : std_logic;
   signal MCB_UIDONECAL_xilinx7        : std_logic;
--   signal MCB_UILDQSDEC_xilinx8        : std_logic;
--   signal MCB_UILDQSINC_xilinx9        : std_logic;
   signal MCB_UIREAD_xilinx10          : std_logic;
   signal Max_Value_Cal_Error_ref      : std_logic;
   signal Max_Value_int : std_logic_vector(7 downto 0);
   -- This function multiplies by a constant MULT and then divides by the DIV constant
   function Mult_Divide (Input : std_logic_vector(7 downto 0); MULT : integer ; DIV : integer ) return std_logic_vector is
-- No multi/divide is required when a 55 ohm resister is used on RZQ
--     variable MULT  : integer := 1;
--     variable DIV   : integer := 1;
-- use scaling factor when the 100 ohm RZQ is used
-- parameter MULT  = 7;
-- parameter DIV   = 4;
--     variable Result : std_logic_vector(9 downto 0) := "0000000000"; 
     variable Result : integer := 0;
     variable Op : std_logic_vector(9 downto 0) := "0000000000"; 
   begin
     for count in 0 to MULT - 1 loop
       Result  := Result + to_integer(unsigned(Input));
     end loop;
     Result  := Result / DIV;
     Op := std_logic_vector(to_unsigned(Result,10));
     return (Op(7 downto 0));
   end function Mult_Divide;

begin

Max_Value <= Max_Value_int;
   -- Drive referenced outputs
   IODRP_ADD <= IODRP_ADD_xilinx0;
   IODRP_SDI <= IODRP_SDI_xilinx1;
   MCB_UIADD <= MCB_UIADD_xilinx2;
   MCB_UISDI <= MCB_UISDI_xilinx11;
   MCB_UICS <= MCB_UICS_xilinx6;
   MCB_UIBROADCAST <= MCB_UIBROADCAST_xilinx4;
   MCB_UIADDR <= MCB_UIADDR_xilinx3;
   MCB_UICMDEN <= MCB_UICMDEN_xilinx5;
   MCB_UIDONECAL <= MCB_UIDONECAL_xilinx7;
--   MCB_UILDQSDEC <= MCB_UILDQSDEC;
--   MCB_UILDQSINC <= MCB_UILDQSINC_xilinx9;
   MCB_UIREAD <= MCB_UIREAD_xilinx10;

   Inc_Dec_REFRSH_Flag <= (Inc_Flag & Dec_Flag & MCB_UOREFRSHFLAG);
   Max_Value_Delta_Up <= Max_Value_int - Max_Value_Previous;
   Half_MV_DU <= ('0' & Max_Value_Delta_Up(7 downto 1));
   Max_Value_Delta_Dn <= Max_Value_Previous - Max_Value_int;
   Half_MV_DD <= ('0' & Max_Value_Delta_Dn(7 downto 1));

   MCB_SYSRST                <= '1' when ( Pre_SYSRST= '1' or RST_reg = '1') else '0';
   DONE_SOFTANDHARD_CAL      <= '1' when ((DQS_COUNT_INITIAL > "00000000") or ((STATE = DONE) and (MCB_UODONECAL = '1'))) else '0';
   CALMODE_EQ_CALIBRATION    <= '1' when (C_MC_CALIBRATION_MODE = "CALIBRATION") else '0'; 
   Half_Max_Value            <= ('0' & Max_Value_int(7 downto 1));  
   Quarter_Max_Value         <= ("00" & Max_Value_int(7 downto 2)); 
   DQS_COUNT_LOWER_LIMIT     <= Quarter_Max_Value;  
   DQS_COUNT_UPPER_LIMIT     <= Half_Max_Value;     
   SKIP_DYN_IN_TERMINATION   <= '1' when ((SKIP_DYN_IN_TERM = 1) or (SKIP_IN_TERM_CAL = 1)) else '0'; 
   SKIP_DYNAMIC_DQS_CAL      <= '1' when ((CALMODE_EQ_CALIBRATION = '0') or (SKIP_DYNAMIC_CAL = 1)) else '0'; 

   iodrp_controller_inst : iodrp_controller
      port map (
         memcell_address  => IODRPCTRLR_MEMCELL_ADDR,
         write_data       => IODRPCTRLR_WRITE_DATA,
         read_data        => IODRPCTRLR_READ_DATA,
         rd_not_write     => IODRPCTRLR_R_WB,
         cmd_valid        => IODRPCTRLR_CMD_VALID,
         rdy_busy_n       => IODRPCTRLR_RDY_BUSY_N,
         use_broadcast    => '0',
         sync_rst         => RST_reg,
         DRP_CLK          => UI_CLK,
         DRP_CS           => IODRP_CS,
         DRP_SDI          => IODRP_SDI_xilinx1,
         DRP_ADD          => IODRP_ADD_xilinx0,
         DRP_SDO          => IODRP_SDO,
         DRP_BKST         => open 
      );
   
   
   
   iodrp_mcb_controller_inst : iodrp_mcb_controller
      port map (
         memcell_address  => IODRPCTRLR_MEMCELL_ADDR,
         write_data       => IODRPCTRLR_WRITE_DATA,
         read_data        => MCB_READ_DATA,
         rd_not_write     => IODRPCTRLR_R_WB,
         cmd_valid        => MCB_CMD_VALID,
         rdy_busy_n       => MCB_RDY_BUSY_N,
         use_broadcast    => MCB_USE_BKST,
         drp_ioi_addr     => MCB_UIADDR_xilinx3,
         sync_rst         => RST_reg,
         DRP_CLK          => UI_CLK,
         DRP_CS           => MCB_UICS_xilinx6,
         DRP_SDI          => MCB_UISDI_xilinx11,
         DRP_ADD          => MCB_UIADD_xilinx2,
         DRP_BKST         => MCB_UIBROADCAST_xilinx4,
         DRP_SDO          => MCB_UOSDO,
         MCB_UIREAD       => MCB_UIREAD_xilinx10
      );
   
--********************************************
--Register pll_lock and RST signals
--********************************************


rst_tmp <= RST or not(PLL_LOCK);

process (UI_CLK, rst_tmp) begin
  if (rst_tmp = '1') then
    Block_Reset <= '0';
    RstCounter  <= (others => '0');
    RST_reg     <= '0';
  elsif (UI_CLK'event and UI_CLK = '1') then
    Block_Reset <= '0';
    if (RstCounter < RST_CNT) then
      RST_reg <= '1';
    else 
      RST_reg <= '0';
    end if;

    if (Pre_SYSRST = '1') then
      RstCounter  <= RST_CNT;
    else
      if (RstCounter < TZQINIT_MAXCNT) then
        Block_Reset <= '1';
        RstCounter  <= RstCounter + 1;
      end if;
    end if;
  end if;
end process;


   --********************************************
   --Comparitor for Dynamic Calibration circuit
   --********************************************
   
Dec_Flag <= '1' when ((DQS_COUNT_VIRTUAL < ('0' & DQS_COUNT)) or  (DQS_COUNT_VIRTUAL(8) = '1')) else '0';
Inc_Flag <= '1' when ((DQS_COUNT_VIRTUAL > ('0' & DQS_COUNT)) and (DQS_COUNT_VIRTUAL(8) = '0')) else '0';
   
   --*********************************************************************************************
   --Counter for extra clock cycles injected after setting Calibrate bit in IODRP2 for Dynamic Cal
   --*********************************************************************************************
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST_reg = '1') then
            count <= "000000";
         elsif (counter_en = '1') then
            count <= count + "000001";
         else
            count <= "000000";
         end if;
      end if;
   end process;
   
   
--*********************************************************************************************
-- Capture narrow MCB_UODATAVALID pulse - only one sysclk90 cycle wide
--*********************************************************************************************
 process (UI_CLK, MCB_UODATAVALID)
 begin
   if(MCB_UODATAVALID = '1') then
     MCB_UODATAVALID_U <= '1';
   elsif(UI_CLK'event and UI_CLK = '1') then
     MCB_UODATAVALID_U <= MCB_UODATAVALID;
   end if;
end process;


   
   --**************************************************************************************************************
   --Always block to mux SDI, SDO, CS, and ADD depending on which IODRP is active: RZQ, ZIO or MCB's UI port (to IODRP2_MCBs)
   --**************************************************************************************************************
   process (Active_IODRP,  IODRP_CS, RZQ_IODRP_SDO,  ZIO_IODRP_SDO)
   begin
      case Active_IODRP is
         when RZQ =>
            RZQ_IODRP_CS <= IODRP_CS;
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= RZQ_IODRP_SDO;
         when ZIO =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= IODRP_CS;
            IODRP_SDO <= ZIO_IODRP_SDO;
         when MCB_PORT =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= '0';
         when others =>
            RZQ_IODRP_CS <= '0';
            ZIO_IODRP_CS <= '0';
            IODRP_SDO <= '0';
      end case;
   end process;
   
   
   --************************************************************************
   --Future-hook: Always-block to register the Auxillary port ADDR address, sent to IODRP2_MCBs through MCB UI interface
   --************************************************************************
   
   --******************************************************************
   --State Machine's Always block / Case statement for Next State Logic
   --
   --The WAIT1,2,etc states were required after every state where the
   --DRP controller was used to do a write to the IODRPs - this is because
   --there's a clock cycle latency on IODRPCTRLR_RDY_BUSY_N whenever the DRP controller
   --sees IODRPCTRLR_CMD_VALID go high.  OFF_RZQ_PTERM and OFF_ZIO_NTERM were added
   --soley for the purpose of reducing power, particularly on RZQ as
   --that pin is expected to have a permanent external resistor to gnd.
   --******************************************************************
   process (UI_CLK)
   begin
      if (UI_CLK'event and UI_CLK = '1') then
         if (RST_reg = '1') then		-- Synchronous reset
            MCB_CMD_VALID <= '0';
            MCB_UIADDR_xilinx3 <= "00000";		-- take control of UI/UO port
            MCB_UICMDEN_xilinx5 <= '1';		-- tells MCB that it is in Soft Cal.
            MCB_UIDONECAL_xilinx7 <= '0';
            MCB_USE_BKST <= '0';
            MCB_UIDRPUPDATE <= '1';		
            Pre_SYSRST <= '1';       -- keeps MCB in reset
            IODRPCTRLR_CMD_VALID <= '0';
            IODRPCTRLR_MEMCELL_ADDR <= NoOp;
            IODRPCTRLR_WRITE_DATA <= "00000000";
            IODRPCTRLR_R_WB <= WRITE_MODE;
            IODRPCTRLR_USE_BKST <= '0';
            P_Term <= "000000";
            N_Term <= "0000000";
            P_Term_Prev <= "000000";
            N_Term_Prev <= "0000000";
            Active_IODRP <= RZQ;
--            First_Dyn_Cal_Done <= '0';
--            Max_Value_Previous <= "00000000";
            --no inc or dec
            MCB_UILDQSINC <= '0';		--no inc or dec
            MCB_UIUDQSINC <= '0';		--no inc or dec
            MCB_UILDQSDEC <= '0';		--no inc or dec
            MCB_UIUDQSDEC <= '0';
            counter_en <= '0';		--flag that the First Dynamic Calibration completed
            First_Dyn_Cal_Done <= '0';
            DQS_COUNT_PREVIOUS <= "000000000";
	    DQS_Delay <= "00000000";
---	        LoopCnt <= "00000";
            Max_Value_int <= "00000000";
            Max_Value_Previous <= "00000000";

            Max_Value_Cal_Error_ref <= '0';
            STATE <= START;
            DQS_COUNT               <= "00000000"; 
            DQS_COUNT_INITIAL       <= "00000000";
            DQS_COUNT_VIRTUAL       <= "000000000";
            LastPass_DynCal         <= IN_TERM_PASS;
            First_In_Term_Done      <= '0';
            MCB_UICMD               <= '0';
            MCB_UICMDIN             <= '0';
            MCB_UIDQCOUNT           <= "0000";
         else
            counter_en <= '0';
            IODRPCTRLR_CMD_VALID <= '0';
            IODRPCTRLR_MEMCELL_ADDR <= NoOp;
            IODRPCTRLR_R_WB <= READ_MODE;
            --      IODRPCTRLR_WRITE_DATA   <= 8'h00;
            IODRPCTRLR_USE_BKST <= '0';
            MCB_CMD_VALID <= '0';		--no inc or dec
            MCB_UILDQSINC <= '0';		--no inc or dec
            MCB_UIUDQSINC <= '0';		--no inc or dec
            MCB_UILDQSDEC <= '0';		--no inc or dec
            MCB_UIUDQSDEC <= '0';
            MCB_USE_BKST <= '0';
            MCB_UICMDIN  <= '0';
            DQS_COUNT          <= DQS_COUNT;
            DQS_COUNT_VIRTUAL  <= DQS_COUNT_VIRTUAL;
            case STATE is		--h00
               when START =>		--h01
                  MCB_UICMDEN_xilinx5 <= '1';
                  MCB_UIDONECAL_xilinx7 <= '0';
                  P_Term <= "000000";
                  N_Term <= "0000000";
                  Pre_SYSRST <= '1';
                  LastPass_DynCal <= IN_TERM_PASS;
                  if (SKIP_IN_TERM_CAL /= 0) then
                     STATE <= WRITE_CALIBRATE;
                  elsif (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_NTERM;
                  else
                     STATE <= START;
                  end if;

               when LOAD_RZQ_NTERM =>		--h02
                  Active_IODRP <= RZQ;
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA <= ('0' & N_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_NTERM;
                  else
                     STATE <= WAIT1;
                  end if;

               when WAIT1 =>		--h03
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT1;
                  else
                     STATE <= LOAD_RZQ_PTERM;
                  end if;

               when LOAD_RZQ_PTERM =>		--h04
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA <= ("00" & P_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_RZQ_PTERM;
                  else
                     STATE <= WAIT2;
                  end if;

               when WAIT2 =>		--h05
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT2;
                  elsif (((RZQ_IN)) = '1' or (P_Term = "111111")) then
                     P_Term  <= Mult_Divide(("00" & P_Term), MULT, DIV)(5 downto 0);
                     STATE <= LOAD_ZIO_PTERM;
                  else
                     STATE <= INC_PTERM;
                  end if;

               when INC_PTERM =>		--h06
                  P_Term <= P_Term + "000001";
                  STATE <= LOAD_RZQ_PTERM;

               when LOAD_ZIO_PTERM =>		--h07
                  Active_IODRP <= ZIO;
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA <= ("00" & P_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_ZIO_PTERM;
                  else
                     STATE <= WAIT3;
                  end if;

               when WAIT3 =>		--h08
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT3;
                  else
                     STATE <= LOAD_ZIO_NTERM;
                  end if;

               when LOAD_ZIO_NTERM =>		--h09
                  Active_IODRP <= ZIO;
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA <= ('0' & N_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= LOAD_ZIO_NTERM;
                  else
                     STATE <= WAIT4;
                  end if;

               when WAIT4 =>		--h0A
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT4;
                  elsif (((not(ZIO_IN))) = '1' or (N_Term = "1111111")) then
                     STATE <= WAIT_FOR_START_BROADCAST;
                  else
                     STATE <= INC_NTERM;
                  end if;

               when INC_NTERM =>		--h0B
                  N_Term <= N_Term + "0000001";
                  STATE <= LOAD_ZIO_NTERM;
               --release SYSRST, but keep UICMDEN=1 and UIDONECAL=0. This is needed to do Broadcast through UI interface, while keeping the MCB in calibration mode

               when WAIT_FOR_START_BROADCAST =>		--h0C
                  Pre_SYSRST <= '0';
                  Active_IODRP <= MCB_PORT;
                  if ((START_BROADCAST and IODRPCTRLR_RDY_BUSY_N) = '1') then
                    if (P_Term /= P_Term_Prev) then
                      STATE       <= BROADCAST_PTERM;
                      P_Term_Prev <= P_Term;
                    elsif (N_Term /= N_Term_Prev) then
                      N_Term_Prev <= N_Term;
                      STATE       <= BROADCAST_NTERM;
                    else
                      STATE <= OFF_RZQ_PTERM;
                    end if;
                  else
                     STATE <= WAIT_FOR_START_BROADCAST;
                  end if;

               when BROADCAST_PTERM =>		--h0D
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA <= ("00" & P_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  MCB_CMD_VALID <= '1';
                  MCB_UIDRPUPDATE <= not First_In_Term_Done; -- Set the update flag if this is the first time through
                  MCB_USE_BKST <= '1';
                  if (MCB_RDY_BUSY_N = '1') then
                     STATE <= BROADCAST_PTERM;
                  else
                     STATE <= WAIT5;
                  end if;

               when WAIT5 =>		--h0E
                  if ((not(MCB_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT5;
                  else
                     STATE <= BROADCAST_NTERM;
                  end if;

               when BROADCAST_NTERM =>
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA <= ("0" & N_Term);
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  MCB_CMD_VALID <= '1';
                  MCB_USE_BKST <= '1';
                  if (MCB_RDY_BUSY_N = '1') then
                     STATE <= BROADCAST_NTERM;
                  else
                     STATE <= WAIT6;
                  end if;

               when WAIT6 =>
                  if (MCB_RDY_BUSY_N = '0') then
                     STATE <= WAIT6;
                  elsif (First_In_Term_Done = '1') then  -- If first time through is already set, then this must be dynamic in term
                    if (MCB_UOREFRSHFLAG = '1')then
                      MCB_UIDRPUPDATE <= '1';
                      STATE           <= OFF_RZQ_PTERM;
                    else
                      STATE <= WAIT6;   -- wait for a Refresh cycle
                    end if;
                  else
                     STATE <= OFF_RZQ_PTERM;
                  end if;

               when OFF_RZQ_PTERM =>
                  MCB_UICMDEN_xilinx5  <= '0';  -- release control of UI/UO port
                  Active_IODRP <= RZQ;
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= PTerm;
                  IODRPCTRLR_WRITE_DATA <= "00000000";
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  P_Term <= "000000";
                  N_Term <= "0000000";
                  MCB_UIDRPUPDATE <= not First_In_Term_Done; -- Set the update flag if this is the first time through
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= OFF_RZQ_PTERM;
                  else
                     STATE <= WAIT7;
                  end if;

               when WAIT7 =>
                  if ((not(IODRPCTRLR_RDY_BUSY_N)) = '1') then
                     STATE <= WAIT7;
                  else
                     STATE <= OFF_ZIO_NTERM;
                  end if;

               when OFF_ZIO_NTERM =>
                  Active_IODRP <= ZIO;
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= NTerm;
                  IODRPCTRLR_WRITE_DATA <= "00000000";
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= OFF_ZIO_NTERM;
                  else
                     STATE <= WAIT8;
                  end if;

               when WAIT8 =>		-- 6'h14
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT8;
                  elsif (First_In_Term_Done = '1') then
                     STATE <= START_DYN_CAL;  -- No need to reset the MCB if we are in InTerm tuning
                  else
                     STATE <= WRITE_CALIBRATE;  -- go read the first Max_Value_int from RZQ
                  end if;

              when RST_DELAY =>      -- 7'h14
                if (Block_Reset = '1') then  -- this ensures that more than 512 clock cycles occur since the last reset after MCB_WRITE_CALIBRATE ???
                 STATE       <= RST_DELAY;
               else 
                 STATE <= START_DYN_CAL_PRE;
               end if;

--***************************
--DYNAMIC CALIBRATION PORTION
--***************************
               when START_DYN_CAL_PRE =>		-- 6'h15
                  LastPass_DynCal <= IN_TERM_PASS;
                  MCB_UICMDEN_xilinx5 <= '0';
                  MCB_UIDONECAL_xilinx7 <= '1';
                  Pre_SYSRST <= '1';
                  if (CALMODE_EQ_CALIBRATION = '0') then
                    STATE       <= START_DYN_CAL;  
                  else 
                    STATE       <= WAIT_FOR_UODONE;
                  end if;

               when WAIT_FOR_UODONE => 
	         Pre_SYSRST <= '0';
		 if (IODRPCTRLR_RDY_BUSY_N = '1' AND MCB_UODONECAL = '1')then
                   MCB_UICMDEN_xilinx5 <= '1';    -- grab UICMDEN
                   DQS_Delay   <= Mult_Divide(Max_Value_int, DQS_NUMERATOR, DQS_DENOMINATOR);
                   STATE       <= LDQS_WRITE_POS_INDELAY;
                 else
                   STATE       <= WAIT_FOR_UODONE;
                 end if;

               when LDQS_WRITE_POS_INDELAY => 
                 IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_Delay;
                 MCB_UIADDR_xilinx3              <= IOI_LDQS_CLK;
                 MCB_CMD_VALID           <= '1';
	         if (MCB_RDY_BUSY_N = '1') then 
                   STATE <= LDQS_WRITE_POS_INDELAY;
                 else
		   STATE <= LDQS_WAIT1;
                 end if;

	       when LDQS_WAIT1 => 
	         if (MCB_RDY_BUSY_N = '0')then
                   STATE <= LDQS_WAIT1;
		 else
	           STATE <= LDQS_WRITE_NEG_INDELAY;	 
                 end if;

              when LDQS_WRITE_NEG_INDELAY =>
                IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
                IODRPCTRLR_R_WB         <= WRITE_MODE;
                IODRPCTRLR_WRITE_DATA   <= DQS_Delay;
                MCB_UIADDR_xilinx3              <= IOI_LDQS_CLK;
                MCB_CMD_VALID           <= '1';
                if (MCB_RDY_BUSY_N = '1')then 
                  STATE <= LDQS_WRITE_NEG_INDELAY;
                else
                  STATE <= LDQS_WAIT2;
                end if;


               when LDQS_WAIT2 =>           -- 7'h1A
                 if(MCB_RDY_BUSY_N = '0')then
                   STATE <= LDQS_WAIT2;
                 else
                   STATE <= UDQS_WRITE_POS_INDELAY;
                 end if;


               when  UDQS_WRITE_POS_INDELAY =>  -- 7'h1B
                 IODRPCTRLR_MEMCELL_ADDR <= PosEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_Delay;
                 MCB_UIADDR_xilinx3              <= IOI_UDQS_CLK;
                 MCB_CMD_VALID           <= '1';
                 if (MCB_RDY_BUSY_N = '1')then
                   STATE <= UDQS_WRITE_POS_INDELAY;
                 else
                   STATE <= UDQS_WAIT1;
                 end if;

               when UDQS_WAIT1 =>           -- 7'h1C
                 if (MCB_RDY_BUSY_N = '0')then
                   STATE <= UDQS_WAIT1;
                 else 
                   STATE           <= UDQS_WRITE_NEG_INDELAY;
                 end if;

               when UDQS_WRITE_NEG_INDELAY => -- 7'h1D
                 IODRPCTRLR_MEMCELL_ADDR <= NegEdgeInDly;
                 IODRPCTRLR_R_WB         <= WRITE_MODE;
                 IODRPCTRLR_WRITE_DATA   <= DQS_Delay;
                 MCB_UIADDR_xilinx3              <= IOI_UDQS_CLK;
                 MCB_CMD_VALID           <= '1';
                 if (MCB_RDY_BUSY_N = '1')then
                   STATE <= UDQS_WRITE_NEG_INDELAY;
                else
                  STATE <= UDQS_WAIT2;
                end if;

               when UDQS_WAIT2 => -- 7'h1E
                 if (MCB_RDY_BUSY_N = '0')then
                   STATE <= UDQS_WAIT2;
                 else 
                   DQS_COUNT         <= DQS_Delay;
                   DQS_COUNT_VIRTUAL <= ('0' & DQS_Delay);
                   DQS_COUNT_INITIAL <= DQS_Delay;
                   STATE             <= START_DYN_CAL;
                end if;

               when START_DYN_CAL =>       -- 7'h1F
                 Pre_SYSRST <= '0';      -- SYSRST not driven
                   if (SKIP_DYNAMIC_DQS_CAL = '1' and SKIP_DYN_IN_TERMINATION = '1')then
                     STATE <= DONE;  --if we're skipping both dynamic algorythms, go directly to DONE
                   elsif (IODRPCTRLR_RDY_BUSY_N = '1' and MCB_UODONECAL = '1') then  --IODRP Controller needs to be ready, & MCB needs to be done with hard calibration
                                                                                      -- Alternate between Dynamic Input Termination and Dynamic Tuning routines
                     if (SKIP_DYN_IN_TERMINATION = '0' and (LastPass_DynCal = DYN_CAL_PASS)) then
                       LastPass_DynCal <= IN_TERM_PASS;
                       STATE           <= LOAD_RZQ_NTERM;
                     else 
                       LastPass_DynCal <= DYN_CAL_PASS;
                       STATE           <= WRITE_CALIBRATE;
                    end if;
                  else
                  STATE     <= START_DYN_CAL;
                 end if;


               when WRITE_CALIBRATE =>			-- 7'h20
                  Pre_SYSRST <= '0';
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= DelayControl;
                  IODRPCTRLR_WRITE_DATA <= "00100000";
                  IODRPCTRLR_R_WB <= WRITE_MODE;
                  Active_IODRP <= RZQ;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= WRITE_CALIBRATE;
                  else
                     STATE <= WAIT9;
                  end if;
               --this adds approximately 22 extra clock cycles after WRITE_CALIBRATE

               when WAIT9 =>				-- 7'h21
                  counter_en <= '1';
                  if (count < "100110") then
                     STATE <= WAIT9;
                  else
                     STATE <= READ_MAX_VALUE;
                  end if;

               when READ_MAX_VALUE =>			-- 7'h22
                  IODRPCTRLR_CMD_VALID <= '1';
                  IODRPCTRLR_MEMCELL_ADDR <= MaxValue;
                  IODRPCTRLR_R_WB <= READ_MODE;
                  Max_Value_Previous <= Max_Value_int;
                  if (IODRPCTRLR_RDY_BUSY_N = '1') then
                     STATE <= READ_MAX_VALUE;
                  else
                     STATE <= WAIT10;
                  end if;
               --record the Max_Value_int from the IODRP controller

               when WAIT10 =>				-- 7'h23   
                  if (IODRPCTRLR_RDY_BUSY_N = '0') then
                     STATE <= WAIT10;
                  else
                     DQS_COUNT_PREVIOUS <= ('0' & DQS_COUNT);
                     Max_Value_int <= IODRPCTRLR_READ_DATA; --record the Max_Value_int from the IODRP controller
                    if (First_In_Term_Done = '0') then
                      STATE               <= RST_DELAY;
                      First_In_Term_Done  <= '1';
                    else 
                     STATE <= ANALYZE_MAX_VALUE;
                    end if;
                  end if;

               when ANALYZE_MAX_VALUE => -- 7'h24   only do a Inc or Dec during a REFRESH cycle.
                 if (First_Dyn_Cal_Done = '0')then
                   STATE <= FIRST_DYN_CAL;
                 elsif ((Max_Value_int < Max_Value_Previous) and (Max_Value_Delta_Dn >= INCDEC_THRESHOLD)) then
                   STATE <= DECREMENT;         --May need to Decrement
                   DQS_COUNT_VIRTUAL <= (DQS_COUNT_VIRTUAL - Half_MV_DD); --DQS_COUNT_VIRTUAL updated (could be negative value)
                 elsif ((Max_Value_int > Max_Value_Previous)and(Max_Value_Delta_Up>=INCDEC_THRESHOLD)) then
                   STATE <= INCREMENT;         --May need to Increment
                   DQS_COUNT_VIRTUAL <= (DQS_COUNT_VIRTUAL + Half_MV_DU); --DQS_COUNT_VIRTUAL updated
                 else 
                   Max_Value_int <= Max_Value_Previous;
                   STATE <= START_DYN_CAL;
                 end if; 

               when FIRST_DYN_CAL =>		-- 7'h25
                  First_Dyn_Cal_Done <= '1';
                  Max_Value_Previous <= Max_Value_int;
                  STATE <= START_DYN_CAL;

               when INCREMENT =>		-- 7'h26
                  STATE <= START_DYN_CAL;
                  Max_Value_Previous <= Max_Value_int;
                  MCB_UILDQSINC <= '0';
                  MCB_UIUDQSINC <= '0';
                  MCB_UILDQSDEC <= '0';
                  MCB_UIUDQSDEC <= '0';
                  case Inc_Dec_REFRSH_Flag is
                     when "101" =>
                       if (DQS_COUNT /= DQS_COUNT_UPPER_LIMIT) then --if not at the upper limit yet, increment
                        STATE <= INCREMENT;
                        MCB_UILDQSINC <= '1';
                        MCB_UIUDQSINC <= '1';
                        MCB_UILDQSDEC <= '0';
                        MCB_UIUDQSDEC <= '0';
			DQS_COUNT     <= DQS_COUNT + '1';
			end if;
                     when "100" =>
                      if (DQS_COUNT /= DQS_COUNT_UPPER_LIMIT) then
                        STATE  <= INCREMENT; --Increment is still high, REFRESH ended - wait for next REFRESH
                      end if; 
                     when others =>
                        null;
                  end case;

               when DECREMENT =>		-- 7'h27
                  STATE <= START_DYN_CAL;
                  Max_Value_Previous <= Max_Value_int;
                  MCB_UILDQSINC <= '0';
                  MCB_UIUDQSINC <= '0';
                  MCB_UILDQSDEC <= '0';
                  MCB_UIUDQSDEC <= '0';
                  if (DQS_COUNT /= "00000000") then
                  case Inc_Dec_REFRSH_Flag is
                     when "011" =>
                       if (DQS_COUNT /= DQS_COUNT_LOWER_LIMIT) then --if not at the lower limit, decrement
                         STATE <= DECREMENT;
                        MCB_UILDQSINC <= '0';
                        MCB_UIUDQSINC <= '0';
                        MCB_UILDQSDEC <= '1';
                        MCB_UIUDQSDEC <= '1';
                        DQS_COUNT     <= DQS_COUNT - '1';
                       end if;
                     when "010" =>
                       if (DQS_COUNT /= DQS_COUNT_LOWER_LIMIT) then  --if not at the lower limit, decrement
                         STATE <= DECREMENT; --Decrement is still high, REFRESH ended - wait for next REFRESH
                       end if;
                     when others =>
                        null;
                  end case;
		  end if;

               when DONE =>
	          Pre_SYSRST <= '0';    -- SYSRST cleared
                  STATE <= DONE;


               when others =>
                  MCB_UICMDEN_xilinx5 <= '0';
                  MCB_UIDONECAL_xilinx7 <= '1';
                  Pre_SYSRST <= '0';
                  IODRPCTRLR_CMD_VALID <= '0';
                  IODRPCTRLR_MEMCELL_ADDR <= "00000000";
                  IODRPCTRLR_WRITE_DATA <= "00000000";
                  IODRPCTRLR_R_WB <= '0';
                  IODRPCTRLR_USE_BKST <= '0';
                  P_Term <= "000000";
                  N_Term <= "0000000";
                  Active_IODRP <= ZIO;
--                  First_Dyn_Cal_Done <= '0';
                  Max_Value_Previous <= "00000000";
                  MCB_UILDQSINC <= '0';
                  MCB_UIUDQSINC <= '0';
                  MCB_UILDQSDEC <= '0';
                  MCB_UIUDQSDEC <= '0';
                  counter_en <= '0';
                  First_Dyn_Cal_Done <= '0';
                  DQS_COUNT_PREVIOUS <= DQS_COUNT_PREVIOUS;
                  Max_Value_int <= Max_Value_int;
                  STATE <= START;
            end case;
         end if;
      end if;
   end process;
   
   
end architecture trans;


