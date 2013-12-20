----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:16:40 11/21/2013 
-- Design Name: 
-- Module Name:    display_Modo - Behavioral 
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

entity display_Modo is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modo : in INTEGER range 3 downto 0;
           segmentos : out  STD_LOGIC_VECTOR (7 downto 0);
           anodo : out  STD_LOGIC_VECTOR (3 downto 0));
end display_Modo;

-- Inicialmente esta arquitectura mostrara en el primer display una letra
-- correspodiente al valor de 'modo'
-- 	0: Desconocido --> -
-- 	1: ASK			--> A
-- 	2: FSK			--> F
-- 	3: PSK			--> P

architecture Behavioral of display_Modo is

begin
process (clk, reset)
	constant segmento_A: STD_LOGIC_VECTOR (7 downto 0) := "10001000"; 
	constant segmento_P: STD_LOGIC_VECTOR (7 downto 0) := "10001100";
	constant segmento_F: STD_LOGIC_VECTOR (7 downto 0) := "10001110";
	constant segmento_Nulo: STD_LOGIC_VECTOR (7 downto 0) := "10111111"; 
	begin
		if reset = '1' then
			anodo <= (OTHERS => '1');
			segmentos <= (OTHERS => '1');
		elsif clk'event and clk = '1' then
			anodo(0) <= '0';
			if modo = 0	then
				segmentos <= segmento_Nulo;
			elsif modo = 1 then
				segmentos <= segmento_A;
			elsif modo = 2 then
				segmentos<= segmento_F;
			else
				segmentos<= segmento_P;
			end if;
		end if;
	end process;
end Behavioral;

