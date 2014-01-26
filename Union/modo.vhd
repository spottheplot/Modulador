----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:37:40 12/02/2013 
-- Design Name: 
-- Module Name:    modo - Behavioral 
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
-- Seleccion de modo de modulacion entre ASK, PSK, FSK
entity modo is
    Port ( sincro_modo : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           valor_modo : buffer  STD_LOGIC_VECTOR (1 downto 0));
end modo;

architecture Behavioral of modo is
signal delay: integer range 0 to (2**24-1);
signal flagDelay: STD_LOGIC;
begin

seleccion:process (clk,reset)
	begin
		if reset = '1' then
			delay <= 0;
			valor_modo <= "00";
			flagDelay <= '0';
		elsif clk'event and clk ='1' then
			if flagDelay = '1' then 
				delay <= delay + 1;
			end if;
			if delay = 10000000 then 
				flagDelay <= '0';
			end if;
			if sincro_modo ='1' and flagDelay = '0' then 
				if valor_modo = "00" then
					valor_modo <= "01";
				elsif valor_modo = "01" then
					valor_modo <= "10";
				elsif valor_modo = "10" then
					valor_modo <= "00";
				end if;
				flagDelay <= '1';
			end if;
		end if;
	end process seleccion;

end Behavioral;

