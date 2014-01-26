----------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias
-- 
-- Create Date:    01:43:27 11/03/2013 
-- Design Name: 
-- Module Name:    modulador_FSK - Behavioral 
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

entity modulador_FSK is
    Port ( portadora : in  STD_LOGIC;
           portadora_2 : in  STD_LOGIC;
			  moduladora: in STD_LOGIC;
           reset : in  STD_LOGIC;
           output : out  STD_LOGIC);
end modulador_FSK;

architecture Behavioral of modulador_FSK is

begin

output <= '0' WHEN (reset = '1') ELSE
              portadora WHEN moduladora = '1' ELSE
              portadora_2;
end Behavioral;

