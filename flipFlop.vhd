library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity flipFlop is

	port(
		input :in std_logic;
		clk:in std_logic;
		LoD :in std_logic;
		CLR :in std_logic;
		output :out std_logic
	);

end flipFlop ;

architecture behavioral of flipFlop  is 

--signal val : std_logic_vector(7 downto 0);

begin

process(clk)

variable outBuf : std_logic :='0';
begin


if rising_edge(clk) then


if (lod = '1') then
output<=input;
outbuf:=input;


elsif(clr = '1') then
output<='0';
outbuf:='0';

end if;
			
end if;
			
end process;
	
end behavioral;