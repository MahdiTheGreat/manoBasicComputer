--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:52:45 09/22/2020
-- Design Name:   
-- Module Name:   C:/LabBasicComputer/LabBasicComputer2/basicComputerTestBench2.vhd
-- Project Name:  LabBasicComputer2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: BasicComputer
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
 
ENTITY basicComputerTestBench2 IS
END basicComputerTestBench2;
 
ARCHITECTURE behavior OF basicComputerTestBench2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT BasicComputer
    PORT(
         res : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal res : std_logic := '0';
   signal clk : std_logic := '0';

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: BasicComputer PORT MAP (
          res => res,
          clk => clk
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
		res<='1';
      wait for 100 ns;
      res<='0';
      wait for 100 ns;			

      wait for clk_period*40;

      -- insert stimulus here 

      wait;
   end process;

END;
