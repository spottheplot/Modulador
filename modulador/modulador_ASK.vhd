----------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias 
-- 
-- Create Date:    00:36:48 11/03/2013 
-- Design Name: 
-- Module Name:    Modulador_ASK - Behavioral 
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

entity modulador_ASK is
    Port ( portadora : in  STD_LOGIC;
           moduladora : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC);
end modulador_ASK;

architecture Behavioral of modulador_ASK is

begin

process(portadora, reset)
begin	
	if reset = '0' then
		output <= '0';
	elsif portadora'event then
		output <= portadora and moduladora;
	end if;
end process;

end Behavioral;

