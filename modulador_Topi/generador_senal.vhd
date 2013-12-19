----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:37:52 12/09/2013 
-- Design Name: 
-- Module Name:    generador_senal - Behavioral 
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

entity generador_senal is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           envio_cabecera : in  STD_LOGIC;
           sincro_modo : in  STD_LOGIC;
           moduladora : in  STD_LOGIC;
           output : out  STD_LOGIC);
end generador_senal;

architecture Behavioral of generador_senal is
signal modo : STD_LOGIC_VECTOR (1 downto 0);
signal portadora : STD_LOGIC;
signal portadora_2 :STD_LOGIC;
begin

seleccion_modo: entity work.modo
	Port Map (
		reset => reset,
		clk => clk,
		sincro_modo => sincro_modo,
		valor_modo => modo
	);
selector: entity work.selector
	Port Map (
		reset => reset,
		portadora => portadora,
		portadora_2 => portadora_2,
		moduladora => moduladora,
		modo => modo,
		output => output
	);
div_freq: entity work.divisor_frecuencia
	Port Map (
		clk => clk,  
		reset => reset,
		envio_cabecera => envio_cabecera,
		portadora => portadora,
		portadora_2 => portadora_2 
	);
end Behavioral;

