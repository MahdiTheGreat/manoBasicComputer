Library ieee;
Use ieee.std_logic_1164.all;

Entity buss is 
	port(

		sel : in std_logic_vector(2 downto 0);
		AR : in std_logic_vector(7 downto 0);	
		PC : in std_logic_vector(7 downto 0);	
		DR : in std_logic_vector(15 downto 0);	
		AC : in std_logic_vector(15 downto 0);	
		IR : in std_logic_vector(15 downto 0);	
		TR : in std_logic_vector(15 downto 0);	
		M  : in std_logic_vector(15 downto 0);		

		output : out std_logic_vector(15 downto 0)
	);

End entity;

Architecture behavioral of buss is

begin

	with  sel  select
		output <= 
					"00000000"&AR when "001" ,
					"00000000"&PC when "010" ,
					DR when "011" ,
					AC when "100" ,
					IR when "101" ,
					TR when "110" ,
					M  when "111" ,
					"0000000000000000" when others;

end behavioral;