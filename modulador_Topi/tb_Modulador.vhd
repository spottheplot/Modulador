--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:29:42 11/22/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/Modulador-master/modulador/tb_Modulador.vhd
-- Project Name:  modulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Modulador
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
 
ENTITY tb_Modulador IS
END tb_Modulador;
 
ARCHITECTURE behavior OF tb_Modulador IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Modulador
    PORT(
         interruptores_moduladora : IN  std_logic_vector(7 downto 0);
         reset : IN  std_logic;
         clk : IN  std_logic;
         boton_modo : IN  std_logic;
         boton_envio : IN  std_logic;
         modulada : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal interruptores_moduladora : std_logic_vector(7 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal boton_modo : std_logic := '0';
   signal boton_envio : std_logic := '0';

 	--Outputs
   signal modulada : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Modulador PORT MAP (
          interruptores_moduladora => interruptores_moduladora,
          reset => reset,
          clk => clk,
          boton_modo => boton_modo,
          boton_envio => boton_envio,
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
		reset <= '1';
		interruptores_moduladora <= "01000100";
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
		wait for 132 ns;
		boton_modo <= '0';
      wait for clk_period*10;
		boton_modo <= '0';
		boton_envio <= '1';
		wait for clk_period*10;
		boton_envio <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
