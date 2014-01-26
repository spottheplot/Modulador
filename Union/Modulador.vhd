----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:39:07 11/15/2013 
-- Design Name: 
-- Module Name:    Modulador - modulador 
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

entity Modulador is
    Port ( interruptores_moduladora : in  STD_LOGIC_VECTOR (7 downto 0);
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           boton_modo : in  STD_LOGIC;
           boton_envio : in  STD_LOGIC;
           modulada : out  STD_LOGIC );
end Modulador;

architecture modulador of Modulador is

signal moduladora_sincronizada : STD_LOGIC_VECTOR (7 downto 0);
signal envio_sincronizada : STD_LOGIC;
signal modo_sincronizada : STD_LOGIC;
begin
sincro: entity work.Sincronizacion
	Port Map (
		reset => reset,
		clk => clk,
		interruptores_moduladora => interruptores_moduladora,
		boton_envio => boton_envio, 
		boton_modo => boton_modo,
		sincro_moduladora => moduladora_sincronizada,
		sincro_envio => envio_sincronizada,
		sincro_modo => modo_sincronizada
	
	);



envio: entity work.envio
	Port Map (
		reset => reset,
		clk => clk,
		enviar => envio_sincronizada,
		modo => modo_sincronizada,
		moduladora => moduladora_sincronizada,
		modulada => modulada
	);



	
end modulador;

