--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:41:18 11/03/2013
-- Design Name:   
-- Module Name:   C:/Users/Juan/Desktop/Jota/Jota/tb_modulador_ASF.vhd
-- Project Name:  Jota
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Modulador_ASF
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
 
ENTITY tb_modulador_ASF IS
END tb_modulador_ASF;
 
ARCHITECTURE behavior OF tb_modulador_ASF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Modulador_ASF
    PORT(
         portadora : IN  std_logic;
         moduladora : IN  std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal portadora : std_logic := '0';
   signal moduladora : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Modulador_ASF PORT MAP (
          portadora => portadora,
          moduladora => moduladora,
          reset => reset,
          output => output
        );

   -- Clock process definitions
   <clock>_process :process
   begin
		<clock> <= '0';
		wait for <clock>_period/2;
		<clock> <= '1';
		wait for <clock>_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
