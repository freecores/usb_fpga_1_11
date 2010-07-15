library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ucecho is
   port(
      pc      : in unsigned(7 downto 0);
      pb      : out unsigned(7 downto 0);
      CLK     : in std_logic
   );
end ucecho;


--signal declaration
architecture RTL of ucecho is

begin
    dpUCECHO: process(CLK)
    begin
         if CLK' event and CLK = '1' then
	    if ( pc >= 97 ) and ( pc <= 122)
	    then
		pb <= pc - 32;
	    else
		pb <= pc;
	    end if;
	end if;
    end process dpUCECHO;
    
end RTL;
