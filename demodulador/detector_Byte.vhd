----------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias
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
           leds : out  STD_LOGIC_VECTOR (7 downto 0);
			  modo : out INTEGER range 3 downto 0
           );
end detector_Byte;

-- Esta arquitectura generara en la salida 'leds' el byte
-- leido de la senal 'modulada'. Esto lo consigue construyendo la portadora
-- utilizada en la moduladora que genera la senal 'modulada' y evaluando
-- el numero de lecturas de 1 y 0 de esta.
-- La senal modo tomara los siguientes valores segun el modulado del ultimo bit 0 de la senal recibida
-- 	0: Desconocido
-- 	1: ASK
-- 	2: FSK
-- 	3: PSK

architecture Behavioral of detector_Byte is

begin
process (clk, reset)
	variable modulada_nand : STD_LOGIC; -- Modulada NAND Portadora
	variable modulada_nor : STD_LOGIC; -- Modulada NOR Portadora
	variable ones_ctr_nand : INTEGER range 31 downto 0;
	variable zeros_ctr_nand : INTEGER range 31 downto 0;
	variable ones_ctr_nor : INTEGER range 31 downto 0;
	variable zeros_ctr_nor : INTEGER range 31 downto 0;
	variable bit_ctr : INTEGER range 8 downto 0; -- Lleva la cuenta de bits leidos
	variable reading_Flag : STD_LOGIC;
	-- Variable para simular la reconstruccion de la portadora
	variable portadora : STD_LOGIC := '0'; 
	variable count : INTEGER range 4 downto 0;
	-- n_lecturas_bit -> Numero de lecturas que podemos hacer por bit modulado
	-- Dependera de la frecuencia de la senal modulada y la de lectura
	constant n_lecturas_bit : INTEGER := 16; 													  
	begin
	-- 
	-- Lectura de modulada
		if reset = '1' then
			leds <= (Others => '0');
			ones_ctr_nand := 0;
			zeros_ctr_nand := 0;
			ones_ctr_nor := 0;
			zeros_ctr_nor := 0;
			bit_ctr := 0;
			reading_Flag := '0';
			portadora := '0';
			count := 0;
			modo <= 0;
		elsif clk'event and clk = '1' then
			-- Reconstruccion de portadora
			count := count + 1;
			if count = 2 then
				portadora := NOT portadora;
				count := 0;
			end if;
			-- Reconocimiento de bit
			if ((cabecera_Detectada = '1') AND (reading_Flag = '0')) then
				portadora := '0'; -- Sincronizamos portadora
				count := 0;
				reading_Flag := '1';
			end if;
			if reading_Flag = '1' then
			-- Determinamos si el bit leido es 1 o 0
				modulada_nand := modulada NAND portadora;
				if modulada_nand = '1' then
					ones_ctr_nand := ones_ctr_nand + 1;
				else
					zeros_ctr_nand := zeros_ctr_nand + 1;
				end if;
				if ((ones_ctr_nand + zeros_ctr_nand) = n_lecturas_bit) then
					-- Procesamos que tipo de bit hemos leido TODO
					-- Bit 1 50% NAND - 50% NOR
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
			-- Determinamos el modo de modulacion (solo podemos diferenciar si se envia algun bit 0)
				modulada_nor := modulada NOR portadora;
				if modulada_nor = '1' then
					ones_ctr_nor := ones_ctr_nor + 1;
				else
					zeros_ctr_nor := zeros_ctr_nor + 1;
				end if;
				if ((ones_ctr_nor + zeros_ctr_nor) = n_lecturas_bit) then
					-- Procesamos que tipo de bit hemos leido
					-- Bit 0 ASK 0% NAND - 50% NOR
					if ((6 < zeros_ctr_nor) and (zeros_ctr_nor < 10)) then
						modo <= 1;
					-- Bit 0 FSK 25% NAND - 75% NOR
					elsif ((10 < zeros_ctr_nor) and (zeros_ctr_nor < 14)) then
						modo <= 2;
					-- Bit 0 PSK 0% NAND - 100% NOR
					elsif (14 < zeros_ctr_nor) then
						modo <= 3;
					else
						modo <= 0;
					end if;
					ones_ctr_nor := 0;
					zeros_ctr_nor := 0;
				end if;
			end if;	
		end if;
	end process;
end Behavioral;

