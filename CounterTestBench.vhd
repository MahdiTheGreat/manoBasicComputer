--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:39:16 09/18/2020
-- Design Name:   
-- Module Name:   C:/LabBasicComputer/BasicComputer/CounterTestBench.vhd
-- Project Name:  BasicComputer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Counter4bit
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
 
ENTITY CounterTestBench IS
END CounterTestBench;
 
ARCHITECTURE behavior OF CounterTestBench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Counter4bit
    PORT(
         Clock_enable_B : IN  std_logic;
         Clock : IN  std_logic;
         Reset : IN  std_logic;
         Output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Clock_enable_B : std_logic := '0';
   signal Clock : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Output : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant Clock_enable_B_period : time := 10 ns;
   constant Clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Counter4bit PORT MAP (
          Clock_enable_B => Clock_enable_B,
          Clock => Clock,
          Reset => Reset,
          Output => Output
        );

   -- Clock process definitions
   Clock_enable_B_process :process
   begin
		Clock <= '0';
		wait for Clock_enable_B_period/2;
		Clock<= '1';
		wait for Clock_enable_B_period/2;
   end process;
 
   Clock_process :process
   begin
		Clock <= '0';
		wait for Clock_period/2;
		Clock <= '1';
		wait for Clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
       reset<='1';	
      -- hold reset state for 100 ns.
      wait for 50 ns;
      reset<='0';
      wait for 50 ns;		
      

      wait;
   end process;

END;
