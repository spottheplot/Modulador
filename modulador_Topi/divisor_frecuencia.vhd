----------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias
-- 
-- Create Date:    16:04:39 10/17/2013 
-- Design Name: 
-- Module Name:    divisor_Frecuencia - Behavioral 
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

entity divisor_Frecuencia is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  envio_cabecera : in STD_LOGIC;
           portadora : buffer  STD_LOGIC  ;
			  portadora_2 : buffer STD_LOGIC );
end divisor_Frecuencia;

-- Esta arquitectura genera las senales portadoras necesarias
-- para el funcionamiento del modulador

architecture Behavioral of divisor_Frecuencia is
	signal count: integer range 0 to 3;
	signal count_2: integer range 0 to 7;
begin
process(clk, reset)
	
begin	
	if reset = '1' then
		count <= 0;
		count_2 <= 4;
		portadora <= '1';
		portadora_2 <= '1';
	elsif clk'event and clk = '1' then
		if envio_cabecera = '1' then
			count <= count + 1;
			count_2 <= count_2 + 1;
			if count = 3 then
				portadora <= not portadora;
				count <= 0;
			end if;
			if count_2 = 7 then
				portadora_2 <= not portadora_2;
				count_2 <= 0;
			end if;
		else 
			portadora <= '1';
			count <= 0;
			portadora_2 <= '1';
			count_2 <= 4;
			
		end if;
	end if;
end process;
	
end Behavioral;

