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

output <= '0' WHEN (reset = '1') ELSE
              portadora  WHEN moduladora = '1' ELSE
              '0';
end Behavioral;

