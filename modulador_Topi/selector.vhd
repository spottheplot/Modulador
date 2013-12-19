----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:23:08 11/15/2013 
-- Design Name: 
-- Module Name:    selector - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity selector is
    Port ( reset : in  STD_LOGIC;
           portadora : in  STD_LOGIC;
			  portadora_2 : in STD_LOGIC;
           moduladora : in  STD_LOGIC;
           output : out  STD_LOGIC ;
           modo : in  STD_LOGIC_VECTOR (0 to 1));
end selector;

architecture Behavioral of selector is
signal output_ASK: STD_LOGIC;
signal output_PSK: STD_LOGIC;
signal output_FSK: STD_LOGIC;

begin

mod_ASK: entity work.modulador_ASK
	Port Map (
		portadora => portadora, 
		moduladora => moduladora, 
		reset => reset, 
		output => output_ASK
	);

mod_PSK: entity work.modulador_PSK
	Port Map (
		portadora => portadora, 
		moduladora => moduladora, 
		reset => reset, 
		output => output_PSK
	);
	
mod_FSK: entity work.modulador_FSK
	Port Map (
		portadora => portadora, 
		portadora_2 => portadora_2,
		moduladora => moduladora, 
		reset => reset,
		output => output_FSK
	);

output <= output_ASK WHEN modo = "00" ELSE
              output_PSK  WHEN modo = "01" ELSE
              output_FSK WHEN modo = "10" ELSE 
				  output_ASK;

end Behavioral;

