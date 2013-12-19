----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:29:25 12/02/2013 
-- Design Name: 
-- Module Name:    envio - Behavioral 
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
--Bloque que envia la señal modulada, distinguiendo entre la cabecera y la modulada, se envia ciclicamente hasta pulsar otra vez la tecla de envio
entity envio is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  enviar : in STD_LOGIC;
			  modo : in STD_LOGIC;
			  moduladora : in STD_LOGIC_VECTOR (7 downto 0); 
           modulada : out  STD_LOGIC);
end envio;

architecture Behavioral of envio is
signal envio_cabecera : STD_LOGIC;
signal moduladora_real : STD_LOGIC;
signal modulada_sin_cabecera : STD_LOGIC;
signal delay: integer range 0 to (2**24-1);
signal flagDelay: STD_LOGIC;
signal flagEnvio : STD_LOGIC;
constant CABECERA : STD_LOGIC_VECTOR (4 downto 0 ) := "01110";
signal count: integer range 0 to 3;
signal count_2 :integer range 0 to 31;
signal i : integer range 0 to 5;
signal j : integer range 0 to 9;	
begin

generador_senal: entity work.generador_senal
	Port Map (
		reset => reset,
		clk => clk,
		envio_cabecera => envio_cabecera,
		sincro_modo => modo,
		moduladora => moduladora_real,
		output =>modulada_sin_cabecera
	);	


enviando: process (clk,reset)


begin
		if reset = '1' then
			delay <= 0;
			flagDelay <= '0';
			flagEnvio <= '0';
			count <= 0;
			count_2 <= 28;
			i <= 0;
			j <= 0;
			modulada <= '0';
			envio_cabecera <= '0';
		elsif clk'event and clk = '1' then 
			if flagDelay = '1' then 
				delay <= delay + 1;
			end if;
			if delay = 10000000 then 
				flagDelay <= '0';
			end if;
			if enviar ='1' and flagDelay = '0' then 
				flagEnvio <= not flagEnvio;
				flagDelay <= '1';
			end if;
			if flagEnvio = '1' then
				if envio_cabecera = '0' then
					count <= count + 1;
					if count = 2 and i = 4 then
						i <= 0;
						envio_cabecera <= '1';
						count_2 <= 28;
					end if;
					if count = 3 then
						count <= 0;
						i <= i +1;
						if i < 5 then		
							modulada <= CABECERA(i);		
						end if;
					end if;
				else
				count_2 <= count_2 + 1;
					if count_2 = 31 then
						count_2 <= 0;
						j <= j + 1;
						if j < 8 then
						moduladora_real <= moduladora(j);
						end if;
						if j = 8 then 
						envio_cabecera <= '0';
						moduladora_real <= '0';
						j <= 0;
						end if;
					end if;
					modulada <= modulada_sin_cabecera;
				end if;	
			end if;
		end if;
				
	end process enviando;

end Behavioral;

