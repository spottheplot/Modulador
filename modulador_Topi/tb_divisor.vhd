--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:11:06 12/02/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/modulador/modulador/tb_divisor.vhd
-- Project Name:  modulador
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
 
ENTITY tb_divisor IS
END tb_divisor;
 
ARCHITECTURE behavior OF tb_divisor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divisor_Frecuencia
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         envio_cabecera : IN  std_logic;
         portadora : BUFFER  std_logic;
         portadora_2 : BUFFER  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal envio_cabecera : std_logic := '0';

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
          envio_cabecera => envio_cabecera,
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
		reset <= '0';
		wait for 45 ns;
		envio_cabecera <='1';
      -- insert stimulus here 

      wait;
   end process;

END;
