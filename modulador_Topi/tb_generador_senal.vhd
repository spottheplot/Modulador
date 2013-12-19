--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:42:11 12/09/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/modulador/modulador/tb_generador_senal.vhd
-- Project Name:  modulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: generador_senal
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
 
ENTITY tb_generador_senal IS
END tb_generador_senal;
 
ARCHITECTURE behavior OF tb_generador_senal IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT generador_senal
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         envio_cabecera : IN  std_logic;
         sincro_modo : IN  std_logic;
         moduladora : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal envio_cabecera : std_logic := '0';
   signal sincro_modo : std_logic := '0';
   signal moduladora : std_logic := '0';

 	--Outputs
   signal output : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: generador_senal PORT MAP (
          clk => clk,
          reset => reset,
          envio_cabecera => envio_cabecera,
          sincro_modo => sincro_modo,
          moduladora => moduladora,
          output => output
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
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
      wait for clk_period*10;
		moduladora <= '1';
		wait for 34 ns;
		envio_cabecera <= '1';
		wait for 54 ns;
		wait for clk_period*10;
		moduladora <= '0';
		sincro_modo <= '1';
		wait for clk_period*10;
		sincro_modo <= '0';
		moduladora <= '1';
		wait for clk_period*10;
		moduladora <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
