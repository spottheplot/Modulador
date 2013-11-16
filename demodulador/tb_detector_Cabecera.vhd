--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:25:53 11/16/2013
-- Design Name:   
-- Module Name:   C:/Users/Juan/Documents/GitHub/modulador/demodulador/tb_detector_Cabecera.vhd
-- Project Name:  demodulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: detector_Cabecera
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
 
ENTITY tb_detector_Cabecera IS
END tb_detector_Cabecera;
 
ARCHITECTURE behavior OF tb_detector_Cabecera IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detector_Cabecera
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         modulada : IN  std_logic;
         cabecera_Detectada : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal modulada : std_logic := '0';

 	--Outputs
   signal cabecera_Detectada : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detector_Cabecera PORT MAP (
          clk => clk,
          reset => reset,
          modulada => modulada,
          cabecera_Detectada => cabecera_Detectada
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
	variable bit_stream : UNSIGNED (9 downto 0) := "0110101110";
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*10;

      -- insert stimulus here
		for i in 0 to 100 loop
			modulada <= bit_stream(0);
			bit_stream := rotate_left (bit_stream, 1);
			wait for clk_period*4;
		end loop;

      wait;
   end process;

END;
