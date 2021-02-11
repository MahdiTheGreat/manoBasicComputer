library IEEE;
use IEEE.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

entity reg8 is

	port(
		input :in std_logic_vector(7 downto 0);
		clk:in std_logic;
		LoD :in std_logic;
		CLR :in std_logic;
		INR :in std_logic;
		output :out std_logic_vector(7 downto 0)
	);

end reg8;

architecture behavioral of reg8 is 

--signal val : std_logic_vector(7 downto 0);

begin

process(clk)

variable outBuf : std_logic_vector (7 downto 0) :="00000000";
begin


if rising_edge(clk) then


if (lod = '1') then
output<=input;
outbuf:=input;


elsif(clr = '1') then
output<="00000000";
outbuf:="00000000";

elsif(INR='1') then
			outbuf := std_logic_vector(to_unsigned(to_integer(unsigned(outbuf)) + 1,output'length));
			output<=outbuf;
end if;			
end if;
			
end process;
	
end behavioral;