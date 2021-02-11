LIBRARY IEEE;
    USE IEEE.STD_LOGIC_1164.ALL;
    USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RAM is
  port(
       ram_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       W : IN STD_LOGIC;
		 r : IN STD_LOGIC;
		 reset:IN STD_LOGIC;
       -- w=0 ,r=1
       ram_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
       );
end entity;

ARCHITECTURE behavioral of RAM is

type mem is array (15 DOWNTO 0) OF STD_LOGIC_VECTOR(15 DOWNTO 0);
signal memory : mem;





--signal addr : INTEGER RANGE 0 TO 1023;

begin

  process(reset,w,r)
  begin
  if(reset='1')then 
  for I in 0 to 15 loop
	memory(I)<="0000000000000000";
  end loop;
  --memory(0)<="0010000000000001";
  --memory(1)<="1000000000000010";
  --memory(2)<="0011000000000111";
  --memory(3)<="0001000000000100";
  --memory(4)<="1111111111111111";
   -- memory(0)<="1010000000000001";
   -- memory(1)<="0000000000000010";
   -- memory(2)<="1011000000000011";
  --  memory(3)<="1001000000000100";
  --memory(4)<="1111111111111111";
  memory(0)<="0100000000000010";
  memory(1)<="1111111111111111";
  memory(2)<="0101000000000011";
  memory(3)<="0001000000000000";
  --memory(4)<="0110000000000101";
  --memory(5)<="1010101010101010";

  elsif(W='1')then
  memory(CONV_INTEGER(address))<=ram_in;
  elsif(R='1')then
  ram_out<=memory(CONV_INTEGER(address));
  end if;
  end process;

end behavioral;