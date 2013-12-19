--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:27:26 12/02/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/modulador/modulador/tb_envio.vhd
-- Project Name:  modulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: envio
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
 
ENTITY tb_envio IS
END tb_envio;
 
ARCHITECTURE behavior OF tb_envio IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT envio
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         enviar : IN  std_logic;
         moduladora : IN  std_logic_vector(7 downto 0);
         modulada_sin_cabecera : IN  std_logic;
         moduladora_real : OUT  std_logic;
         envio_cabecera : BUFFER  std_logic;
         modulada : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal enviar : std_logic := '0';
   signal moduladora : std_logic_vector(7 downto 0) := (others => '0');
   signal modulada_sin_cabecera : std_logic := '0';

 	--Outputs
   signal moduladora_real : std_logic;
   signal envio_cabecera : std_logic;
   signal modulada : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: envio PORT MAP (
          clk => clk,
          reset => reset,
          enviar => enviar,
          moduladora => moduladora,
          modulada_sin_cabecera => modulada_sin_cabecera,
          moduladora_real => moduladora_real,
          envio_cabecera => envio_cabecera,
          modulada => modulada
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
      -- insert stimulus here 
		wait for 53 ns;
		enviar <= '1';
		wait for 28 ns;
		modulada_sin_cabecera <= '1';
		wait for 54 ns;
		modulada_sin_cabecera <= '0';
		wait for 23 ns;
		modulada_sin_cabecera <= '1';
		wait for 54 ns;
		modulada_sin_cabecera <= '0';
		wait for 28 ns;
		modulada_sin_cabecera <= '1';
		wait for 54 ns;
		modulada_sin_cabecera <= '0';

      wait;
   end process;

END;
