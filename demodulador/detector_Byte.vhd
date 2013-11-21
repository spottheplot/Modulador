----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:51:35 11/16/2013 
-- Design Name: 
-- Module Name:    detector_Byte - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity detector_Byte is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  modulada : in  STD_LOGIC;
           cabecera_Detectada : in  STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (7 downto 0)
           );
end detector_Byte;

architecture Behavioral of detector_Byte is

begin
process (clk, reset)
	variable modulada_nand : STD_LOGIC; -- Modulada NAND Portadora
	variable ones_ctr_nand : INTEGER range 31 downto 0;
	variable zeros_ctr_nand : INTEGER range 31 downto 0;
	variable bit_ctr : INTEGER range 8 downto 0; -- Lleva la cuenta de bits leidos
	variable reading_Flag : STD_LOGIC;
	variable bit_array : UNSIGNED (4 downto 0);
	-- Variable para simular la reconstruccion de la portadora
	variable portadora : STD_LOGIC := '0'; 
	variable count : INTEGER range 0 to 4;
	-- n_lecturas_bit -> Numero de lecturas que podemos hacer por bit modulado
	-- Dependera de la frecuencia de la senal modulada y la de lectura
	constant n_lecturas_bit : INTEGER := 16; 													  
	begin
	-- 
	-- Lectura de modulada
		if reset = '0' then
			leds <= (Others => '0');
			ones_ctr_nand := 0;
			zeros_ctr_nand := 0;
			bit_ctr := 0;
			reading_Flag := '0';
			portadora := '0';
			count := 0;
		elsif clk'event and clk = '1' then
			if ((cabecera_Detectada = '1') AND (reading_Flag = '0')) then
				portadora := '0'; -- Sincronizamos portadora
				count := 0;
				reading_Flag := '1';
			end if;
			if reading_Flag = '1' then
				modulada_nand := modulada NAND portadora;
				if modulada_nand = '1' then
					ones_ctr_nand := ones_ctr_nand + 1;
				else
					zeros_ctr_nand := zeros_ctr_nand + 1;
				end if;
				if ((ones_ctr_nand + zeros_ctr_nand) = n_lecturas_bit) then
					-- Procesamos que tipo de bit hemos leido TODO
					-- Bit 0 ASK 0% NAND - 50% NOR
					if ((6 < zeros_ctr_nand) and (zeros_ctr_nand < 10)) then
						leds(bit_ctr) <= '1';
					else 
						leds(bit_ctr) <= '0';
					end if;
					ones_ctr_nand := 0;
					zeros_ctr_nand := 0;
					bit_ctr := bit_ctr + 1;
					if bit_ctr = 8 then
						bit_ctr := 0;
						reading_Flag := '0';
					end if;
				end if;
			end if;	
		end if;
	-- Reconstruccion de portadora
		if reset = '0' then
			count := 0;
			portadora := '0';
		elsif clk'event and clk = '1' then
			count := count + 1;
			if count = 2 then
				portadora := NOT portadora;
				count := 0;
			end if;
		end if;
	end process;
end Behavioral;

