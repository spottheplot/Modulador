----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:50:26 11/03/2013 
-- Design Name: 
-- Module Name:    modulador_PSK - Behavioral 
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

entity modulador_PSK is
    Port ( portadora : in  STD_LOGIC;
           moduladora : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC);
end modulador_PSK;

architecture Behavioral of modulador_PSK is

begin

process(portadora, reset)
begin	
	if reset = '0' then
		output <= '0';
	elsif portadora'event then
		if moduladora = '1' then
			output <= portadora;
		else
			output <= NOT portadora;
		end if;
	end if;
end process;

end Behavioral;

