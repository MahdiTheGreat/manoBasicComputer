library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ALU is
port(
    --CLK       :in  std_logic;
--    stop      : in  std_logic;    	 
    RES       :in  std_logic;                      
    OPCODE    :in  std_logic_vector(2 downto 0);   
    A         :in  std_logic_vector(15 downto 0);   
    B         :in  std_logic_vector(15 downto 0);   
    Q         :out std_logic_vector(15 downto 0);
    e:	 out std_logic );
end ALU;

architecture behavioral of ALU is
begin
    process(a,b)
	 variable sum:std_logic_vector(16 downto 0):="00000000000000000";
    begin
--       if stop ='0' then
            if RES = '1' then
                Q <= (others => '0');
            else
              case OPCODE is
                    when "000" => 
                        
                        Q <= A and B;								
                    when "001" => 
						      e<='0';
                        
								sum:=std_logic_vector(to_unsigned(to_integer(unsigned(a))+to_integer(unsigned( b)),17));
								q<=sum(15 downto 0);
								e<=sum(16);
								
						  when "010" => 
                        Q <=A; 
                     
                    when others =>
                        Q <= (others => '0');
                end case;
            end if;
 --        end if;
     end process;
 end behavioral;