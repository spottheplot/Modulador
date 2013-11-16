----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:40:27 11/16/2013 
-- Design Name: 
-- Module Name:    detector_Cabecera - Behavioral 
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
use IEEE.NUMERIC_STD.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detector_Cabecera is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modulada : in  STD_LOGIC;
           cabecera_Detectada : out  STD_LOGIC);
end detector_Cabecera;

-- Esta arquitectura hara un set en la senal cabecera_Detectada siempre que
-- que las ultimas 5 lecturas de la senal modulada coincidan con la cabecera definida

architecture Behavioral of detector_Cabecera is
constant cabecera : UNSIGNED (19 downto 0) := "0000" & "1111" & "1111" & "1111" & "0000"; -- Escribir aquí la cabecera de los bytes de datos
begin
	process (clk, reset)
	variable bit_array : UNSIGNED (19 downto 0);
	begin
		if reset = '0' then
			cabecera_Detectada <= '0';
		elsif clk'event and clk = '1' then
			bit_array := shift_left (bit_array, 1);
			if modulada = '1' then
				bit_array(0) := '1';
			else
				bit_array(0) := '0';
			end if;
			if bit_array = cabecera then
				cabecera_Detectada <= '1';
			else 
				cabecera_Detectada <= '0';
			end if;
		end if;
	end process;
end Behavioral;

