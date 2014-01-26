----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:52:14 01/26/2014 
-- Design Name: 
-- Module Name:    union - Behavioral 
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

entity union is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           interruptores_moduladora : in  STD_LOGIC_VECTOR (7 downto 0);
           boton_modo : in  STD_LOGIC;
           boton_envio : in  STD_LOGIC;
			  leds : out  STD_LOGIC_VECTOR (7 downto 0);
			  segmentos : out STD_LOGIC_VECTOR (7 downto 0);
			  anodo : out STD_LOGIC_VECTOR (3 downto 0));
end union;

architecture Behavioral of union is
signal modulada_intermedia: STD_LOGIC;

begin
demodulador: entity work.demodulador
	Port Map ( 
		clk => clk,
		reset => reset,
		modulada => modulada_intermedia,
		leds => leds,
		segmentos => segmentos,
		anodo => anodo
		);
		
modulador: entity work.Modulador
	Port Map ( 
		clk => clk,
		reset => reset,
		modulada => modulada_intermedia,
		interruptores_moduladora => interruptores_moduladora,
		boton_modo => boton_modo,
		boton_envio => boton_envio
		);
		
end Behavioral;

