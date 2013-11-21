--------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias
--
-- Create Date:   18:49:08 11/20/2013
-- Design Name:   
-- Module Name:   tb_demodulador.vhd
-- Project Name:  demodulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: demodulador
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY tb_demodulador IS
END tb_demodulador;
 
ARCHITECTURE behavior OF tb_demodulador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT demodulador
    PORT(
         modulada : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         leds : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal modulada : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal leds : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	
		-- Procedimiento enviar bit
		-- @param
		--		@bit --> 4 primeros bits que definen el byte que define el bit
		--		@modulada --> señal que toma como valor, los bits de @bit cada 2 ciclos de reloj
	procedure send_bit(
			bit :  in UNSIGNED (3 downto 0);
			signal modulada : inout std_logic) is
		variable bit_copy : UNSIGNED (3 downto 0) := bit;
		begin
			for i in 0 to 7 loop
					modulada <= bit_copy(3);
					bit_copy := rotate_left (bit_copy, 1);
					wait for clk_period*2;
			end loop;
	end procedure;
		-- Procedimiento enviar cabecera @bit a través de @modulada
	procedure send_cabecera(
			bit :  in UNSIGNED (4 downto 0);
			signal modulada : inout std_logic) is
		variable bit_copy : UNSIGNED (4 downto 0) := bit;
		begin
			for i in 0 to 4 loop
					modulada <= bit_copy(4);
					bit_copy := rotate_left (bit_copy, 1);
					wait for clk_period*4;
			end loop;
	end procedure;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: demodulador PORT MAP (
          modulada => modulada,
          clk => clk,
          reset => reset,
          leds => leds
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	constant bit_ASK_0 : UNSIGNED (3 downto 0) := "0000";
	constant bit_FSK_0 : UNSIGNED (3 downto 0) := "0011";
	constant bit_PSK_0 : UNSIGNED (3 downto 0) := "1010";
	constant bit_1		 : UNSIGNED (3 downto 0) := "0101";
	constant cabecera	 : UNSIGNED (4 downto 0) := "01110";
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';

      wait for clk_period*10;

      -- insert stimulus here 
		send_cabecera (cabecera, modulada);
		
		-- '10110100' byte sent
		send_bit(bit_PSK_0, modulada);
		send_bit(bit_ASK_0, modulada);
		send_bit(bit_1, modulada);
		send_bit(bit_FSK_0, modulada);
		send_bit(bit_1, modulada);
		send_bit(bit_1, modulada);
		send_bit(bit_FSK_0, modulada);
		send_bit(bit_1, modulada);
		
		-- New '10100101' byte sent
		send_cabecera (cabecera, modulada);
		
		send_bit(bit_1, modulada);
		send_bit(bit_FSK_0, modulada);
		send_bit(bit_1, modulada);
		send_bit(bit_PSK_0, modulada);
		send_bit(bit_ASK_0, modulada);
		send_bit(bit_1, modulada);
		send_bit(bit_FSK_0, modulada);
		send_bit(bit_1, modulada);

      wait;
   end process;

END;
