----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:36:31 11/28/2013 
-- Design Name: 
-- Module Name:    sincronizador - Behavioral 
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

entity sincronizador is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modulada : in  STD_LOGIC;
           modulada_Sincronizada : out  STD_LOGIC);
end sincronizador;

architecture Behavioral of sincronizador is
	signal q1 : STD_LOGIC;
begin

	process (clk, reset)
	begin
		if reset = '1' then
			q1 <= '0';
			modulada_Sincronizada <= '0';
		elsif clk'event and clk = '1' then
		q1 <= modulada;
		modulada_Sincronizada <= q1;
		end if;
	end process;

end Behavioral;

