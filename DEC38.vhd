library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DEC38 is  
port(a,b,c:in std_logic;
		q:out std_logic_vector(7 downto 0));
end DEC38;



architecture behavioral of DEC38 is
begin
	process(a,b,c)
	begin
		if(a='0' and b='0' and c='0') then q<="00000001";
		elsif(a='0' and b='0' and c='1') then q<="00000010";
		elsif(a='0' and b='1' and c='0') then q<="00000100";	
		elsif(a='0' and b='1' and c='1')  then q<="00001000";
		elsif(a='1' and b='0' and c='0') then q<="00010000";
		elsif(a='1' and b='0' and c='1') then q<="00100000";
		elsif(a='1' and b='1' and c='0') then q<="01000000";
		elsif(a='1' and b='1' and c='1')  then q<="10000000";
		end if;
	end process;

end behavioral;