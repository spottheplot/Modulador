----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:27:59 12/02/2013 
-- Design Name: 
-- Module Name:    Sincronizacion - Behavioral 
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
-- BLoque para sincronizar las entradas
entity Sincronizacion is
    Port ( interruptores_moduladora : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           boton_envio : in  STD_LOGIC;
           boton_modo : in  STD_LOGIC;
           sincro_moduladora : out  STD_LOGIC_VECTOR (7 downto 0);
           sincro_envio : out  STD_LOGIC;
           sincro_modo : out  STD_LOGIC);
end Sincronizacion;

architecture Behavioral of Sincronizacion is
signal moduladora : STD_LOGIC_VECTOR (7 downto 0);
signal modo : STD_LOGIC;
signal envio : STD_LOGIC;
begin
sincro:process (clk,reset)
	begin
		if reset = '1' then
		   moduladora <= (Others => '0');
			modo <= '0' ;
			envio <= '0';
			sincro_moduladora <= (Others => '0');
			sincro_modo <= '0' ;
			sincro_envio <= '0';
		elsif clk'event and clk = '1' then
		   moduladora <= interruptores_moduladora;
			sincro_moduladora <= moduladora ;
			modo <= boton_modo;
			sincro_modo <= modo;
			envio <= boton_envio;
			sincro_envio <= envio;
	   end if;
	end process sincro;

end Behavioral;

