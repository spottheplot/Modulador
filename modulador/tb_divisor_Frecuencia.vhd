--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:13:54 10/17/2013
-- Design Name:   
-- Module Name:   C:/Users/Tmicro 10/Desktop/Nueva carpeta/Jota/tb_divisor_Frecuencia.vhd
-- Project Name:  Jota
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divisor_Frecuencia
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
--USE ieee.numeric_std.ALL;
 
ENTITY tb_divisor_Frecuencia IS
END tb_divisor_Frecuencia;
 
ARCHITECTURE behavior OF tb_divisor_Frecuencia IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisor_Frecuencia
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         portadora : BUFFER  std_logic;
			portadora_2 : BUFFER std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal portadora : std_logic;
	signal portadora_2 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divisor_Frecuencia PORT MAP (
          clk => clk,
          reset => reset,
          portadora => portadora,
			 portadora_2 => portadora_2
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
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
