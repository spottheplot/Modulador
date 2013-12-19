--------------------------------------------------------------------------------
-- Engineer: Juan Herrero Macias
--
-- Create Date:   01:46:18 11/03/2013
-- Design Name:   
-- Module Name:   tb_modulador_FSK.vhd
-- Project Name:  Jota
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modulador_FSK
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
 
ENTITY tb_modulador_FSK IS
END tb_modulador_FSK;
 
ARCHITECTURE behavior OF tb_modulador_FSK IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modulador_FSK
    PORT(
         portadora : IN  std_logic;
         portadora_2 : IN  std_logic;
			moduladora : IN std_logic;
         reset : IN  std_logic;
         output : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal portadora : std_logic := '0';
   signal portadora_2 : std_logic := '0';
	signal moduladora: std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal output : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant portadora_period : time := 10 ns;
	constant portadora_2_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: modulador_FSK PORT MAP (
          portadora => portadora,
          portadora_2 => portadora_2,
			 moduladora => moduladora,
          reset => reset,
          output => output
        );

   -- Clock process definitions
   portadora_process :process
   begin
		portadora <= '0';
		wait for portadora_period/2;
		portadora <= '1';
		wait for portadora_period/2;
   end process;
	
	
   portadora_2_process :process
   begin
		portadora_2 <= '0';
		wait for portadora_2_period/2;
		portadora_2 <= '1';
		wait for portadora_2_period/2;
   end process;

 

   -- Stimulus process
   stim_proc: process
   begin		
		reset <= '1';
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '0';
      wait for portadora_period*10;

      -- insert stimulus here 
		
				moduladora <= '1';
		wait for 100 ns;	
		moduladora <= '0';
		wait for 200 ns;	
		moduladora <= '1';
		wait for 250 ns;	
		moduladora <= '0';
		wait for 100 ns;	

      wait;
   end process;

END;
