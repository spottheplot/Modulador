--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:23:54 11/22/2013
-- Design Name:   
-- Module Name:   C:/Users/Madkiche/Desktop/Modulador-master/modulador/tb_selector.vhd
-- Project Name:  modulador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: selector
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
 
ENTITY tb_selector IS
END tb_selector;
 
ARCHITECTURE behavior OF tb_selector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT selector
    PORT(
         reset : IN  std_logic;
         portadora : IN  std_logic;
         portadora_2 : IN  std_logic;
         moduladora : IN  std_logic;
         output : OUT  std_logic;
         modo : IN  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal portadora : std_logic := '0';
   signal portadora_2 : std_logic := '0';
   signal moduladora : std_logic := '0';
   signal modo : std_logic_vector(1 downto 0) := (others => '0');
	signal clk : std_logic := '0';
 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace clk below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: selector PORT MAP (
          reset => reset,
          portadora => portadora,
          portadora_2 => portadora_2,
          moduladora => moduladora,
          output => output,
          modo => modo
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <='0';
		modo <= "00";
      wait for clk_period*10;
		portadora <= '1';
		portadora_2 <= '1';
		moduladora <= '1';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		modo <= "01";
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '1';
		modo <= "10";
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '0';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '1';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '0';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '0';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '1';
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '0';
			wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
      wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		wait for clk_period*2;
		portadora <= not portadora ;
		wait for clk_period*2;
		portadora <= not portadora ;
		portadora_2 <= not portadora_2;
		moduladora <= '0';
      wait;
   end process;

END;
