--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:31:03 12/02/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/modulador/modulador/tb_sincro.vhd
-- Project Name:  modulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Sincronizacion
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
 
ENTITY tb_sincro IS
END tb_sincro;
 
ARCHITECTURE behavior OF tb_sincro IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Sincronizacion
    PORT(
         interruptores_moduladora : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         boton_envio : IN  std_logic;
         boton_modo : IN  std_logic;
         sincro_moduladora : OUT  std_logic_vector(7 downto 0);
         sincro_envio : OUT  std_logic;
         sincro_modo : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal interruptores_moduladora : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal boton_envio : std_logic := '0';
   signal boton_modo : std_logic := '0';

 	--Outputs
   signal sincro_moduladora : std_logic_vector(7 downto 0);
   signal sincro_envio : std_logic;
   signal sincro_modo : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Sincronizacion PORT MAP (
          interruptores_moduladora => interruptores_moduladora,
          clk => clk,
          reset => reset,
          boton_envio => boton_envio,
          boton_modo => boton_modo,
          sincro_moduladora => sincro_moduladora,
          sincro_envio => sincro_envio,
          sincro_modo => sincro_modo
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
		wait for 32 ns;
		interruptores_moduladora <= "11010101";
		boton_envio <= '1';
		boton_modo <= '1';
		wait for 54 ns;
		interruptores_moduladora <= "10011101";
		boton_envio <= '0';
		boton_modo <= '0';
		wait for 54 ns;
		interruptores_moduladora <= "11010101";
		boton_envio <= '1';
		boton_modo <= '1';
		
      -- insert stimulus here 

      wait;
   end process;

END;
