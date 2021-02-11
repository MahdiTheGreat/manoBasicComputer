

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
 
  
entity BasicComputer is
	port
	(
		res 	:in std_logic;				-- reset
		clk 	:in std_logic			-- clock
		
	);
end BasicComputer;

architecture behavioral of BasicComputer is

	
	signal arOut	:std_logic_vector(7 downto 0):="00000000";	-- data register
	signal acOut	:std_logic_vector(15 downto 0):="0000000000000000";	-- accumulator
	signal irOut	:std_logic_vector(15 downto 0):="0000000000000000";
	signal drOut	:std_logic_vector(15 downto 0):="0000000000000000";
   signal trOut	:std_logic_vector(15 downto 0):="0000000000000000";		
	signal pcOut	:std_logic_vector(7 downto 0):="00000000";
   
	signal iOut	:std_logic:='0';	-- program counter
   
	signal arClr	:std_logic:='0';	
	signal acClr	:std_logic:='0';	
	signal irClr	:std_logic:='0';	
	signal drClr	:std_logic:='0';	
	signal pcClr	:std_logic:='0';
   signal trClr	:std_logic:='0';
	
	signal arClr1	:std_logic:='0';	
	signal acClr1	:std_logic:='0';	
	signal irClr1	:std_logic:='0';	
	signal drClr1	:std_logic:='0';	
	signal pcClr1	:std_logic:='0';
   signal trClr1	:std_logic:='0';

	
	
	signal arLd	:std_logic:='0';	-- data register
	signal acLd	:std_logic:='0';	-- accumulator
	signal irLd	:std_logic:='0';	
	signal drLd	:std_logic:='0';
	signal pcLd	:std_logic:='0';
	signal trLd	:std_logic:='0';

   	
	signal pcInr	:std_logic:='0';	-- program counter
	signal arInr:std_logic:='0';	-- data register
	signal acInr	:std_logic:='0';	-- accumulator
	signal irInr	:std_logic:='0';
	signal drInr	:std_logic:='0';	
	signal trInr	:std_logic:='0';	-- program counter
	
	signal dpOutput	:std_logic_vector(15 downto 0):="0000000000000000";

	signal aluOut	:std_logic_vector(15 downto 0);
   signal e		:std_logic:='0';	-- extended accumulator
   signal eOut		:std_logic:='0';		-- extended accumulator
	signal iLd		:std_logic:='0';
	
	
	signal sc	:std_logic_vector(3 downto 0);
   signal scReset		:std_logic:='0';
	signal scReset1		:std_logic:='0';
   	
	signal t		:std_logic_vector(15 downto 0);	-- timing signals and output of decoder
	

					
	signal q		:std_logic_vector(7 downto 0);	-- instruction decoder output
	
	
	
	
	signal w:std_logic;
	signal r:std_logic;
	signal ramOut:std_logic_vector(15 downto 0);
	signal ramIn:std_logic_vector(15 downto 0);

   
	signal sel:std_logic_vector(2 downto 0);
   	
	
	

	
	
component RAM is
  port(
       ram_in : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
       address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
       W : IN STD_LOGIC;
		 r : IN STD_LOGIC;
		 reset:IN STD_LOGIC;
       -- w=0 ,r=1
       ram_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
--		 clk:IN STD_LOGIC
       );
end component;

component flipFlop is

	port(
		input :in std_logic;
		clk:in std_logic;
		LoD :in std_logic;
		CLR :in std_logic;
		output :out std_logic
	);

end component ;



 component reg8 is

	port(
		input :in std_logic_vector(7 downto 0);
		clk:in std_logic;
		LoD :in std_logic;
		CLR :in std_logic;
		INR :in std_logic;
		output :out std_logic_vector(7 downto 0)
	);

end component;

component reg16 is

	port(
		input :in std_logic_vector(15 downto 0); 
		clk:in std_logic;
		LoD :in std_logic;
		CLR :in std_logic;
		INR :in std_logic;
		output :out std_logic_vector(15 downto 0)
	);

end component;



component DEC416 is
	port(I0,I1,I2,I3:in std_logic;
		 q:out std_logic_vector(15 downto 0));
end component;

component DEC38 is  
port(a,b,c:in std_logic;
		q:out std_logic_vector(7 downto 0));
end component;

component Decoder4_16 is
	port(I0,I1,I2,I3:in std_logic;
		 q:out std_logic_vector(15 downto 0));
end component;

component ALU is
port(
--    CLK       :in  std_logic;
--    stop      : in  std_logic;                       
    RES       :in  std_logic;                      
    OPCODE    :in  std_logic_vector(2 downto 0);   
    A         :in  std_logic_vector(15 downto 0);   
    B         :in  std_logic_vector(15 downto 0);   
    Q         :out std_logic_vector(15 downto 0);
    e :out std_logic);
end component;

component buss is 
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

End component;

component Counter4bit is 
   port( Clock_enable_B: in std_logic;
 	 Clock: in std_logic;
 	 Reset: in std_logic;
 	 Output: out std_logic_vector(3 downto 0));
end component;

	
	    
	
	
    


	begin
	
	acClr1<=res or acClr;
	arClr1<=res or arClr;
	irClr1<=res or irClr;
	drClr1<=res or drClr;
	pcClr1<=res or pcClr;
   trClr1<=res or trClr;
--	scReset1<=res or scReset;


ff :flipFlop
port map(
		input=>e,
		clk=>clk,
		LoD=>iLd,
		CLR=>res,
		output=>eOut
	);
	
dr:
 reg16 port map(
		input=>dpOutput,
		clk=>clk,
		LoD =>drLd,
		CLR =>drClr1,
		INR =>drInr,
		output=>drOut
	);
	
tr:
 reg16 port map(
		input=>dpOutput,
		clk=>clk,
		LoD =>trLd,
		CLR =>trClr1,
		INR =>trInr,
		output=>trOut
	);

ac:
 reg16 port map(
		input=>aluOut,
		clk=>clk,
		LoD =>acLd,
		CLR =>acClr1,
		INR =>acInr,
		output=>acOut
	);
	
ir:
 reg16 port map(
		input=>dpOutput,
		clk=>clk,
		LoD =>irLd,
		CLR =>irClr1,
		INR =>irInr,
		output=>irOut
	);
	
ar:
 reg8 port map(
		input=>dpOutput(7 downto 0),
		clk=>clk,
		LoD =>arLd,
		CLR =>arClr1,
		INR =>arInr,
		output=>arOut
	);
--our memoery is small,so we just need a 8bit ar
pc:
 reg8 port map(
		input=>dpOutput(7 downto 0),
		clk=>clk,
		LoD =>pcLd,
		CLR =>pcClr1,
		INR =>pcInr,
		output=>pcOut
	);	

--our memoery is small,so we just need a 8bit pc

aluUnit: ALU 
port map(
--    CLK =>clk,
    
--	 stop =>acLd,                     
                     
    RES  =>res,                   
    OPCODE=>irOut(14 downto 12),
    A         =>drOut,   
    B         =>acOut,   
    Q         =>aluOut,
    e=>e);


counter: Counter4bit  
   port map( Clock_enable_B=>'0',
 	 Clock=>clk,
 	 Reset=>res,
 	 Output=>sc);

scDecoder: Decoder4_16 
	port map(I0=>sc(0),I1=>sc(1),I2=>sc(2),I3=>sc(3),
		 q=>t);
		 
 opcodeDecooder :DEC38  
port map(a=>irOut(14),b=>irOut(13),c=>irOut(12),
		q=>q);

memeory: RAM 
  port map(
       ram_in =>acOut,
       address =>arOut,
       W=>w,
		 r=>r,
		 reset=>res,
       -- w=0 ,r=1
       ram_out=>ramOut
--		 clk=>clk
       );


dataPath: buss 
	port map(

		sel=>sel,
		AR => arOut,
		PC => pcOut,	
		DR => drOut,		
		AC=> acOut,	
		IR=> irOut,	
		TR => trOut,
      m=>ramOut,		
				

		output => dpOutput
	);
	
	iOut<=irOut(15);
	
	sel<="010" when t(0)='1'
	else "010" when (t(4)='1' and q(5)='1')
	else "101" when t(2)='1'
	else "111" when t(1)='1'
	else "111" when (t(3)='1' and iOut='1')
	else "111" when (t(4)='1' and (q(0)='1' or q(1)='1' or q(2)='1' or q(6)='1'))
	else "100" when (t(4)='1' and  q(3)='1')
	else "001" when (t(4)='1' and  q(4)='1')
	else "001" when (t(5)='1' and  q(5)='1')
	else "011" when (t(6)='1' and  q(6)='1');


	
	

	arLd<='1' when ((sel="101" and t(2)='1') or (sel="010" and t(0)='1') or (iOut='1' and t(3)='1') )
	else '0';
	irLd<='1' when ((sel="111" and t(1)='1')) 
	else '0';
	drLd<='1' when (sel="111" and t(4)='1' and (q(0)='1' or q(1)='1' or q(2)='1' or q(6)='1'))
	else '0';
	
	acLd<='1' when ( t(5)='1' and (q(0)='1' or  q(1)='1' or q(2)='1') )
	else '0';
	
	iLd<='1' when ( t(5)='1'  and  q(1)='1' )
	else '0';
	

	
	w<='1' when ((t(4)='1' and q(3)='1') or (t(6)='1' and q(6)='1' and sel="011") or (t(4)='1' and q(5)='1' and sel="010"))
	else '0';
	
	r<='1' when (t(1)='1' or (t(3)='1' and iOut='1') or (t(4)='1' and (q(0)='1' or q(1)='1' or q(2)='1' or q(6)='1'))) 
	else '0';
	

	
	scReset<='1' when (( t(5)='1'  and (q(0)='1' or q(1)='1' or q(2)='1' )) or (t(4)='1'   and  q(3)='1'))
	else '0';
	
	pcInr<='1' when ((sel="111" and t(1)='1') or (sel="011" and t(6)='1' and q(6)='1'))
	else '1' when (sel="011" and t(6)='1' and q(6)='1' and drOut="0000000000000000")
	else '0';
	
	pcLd<='1' when (sel="001" and ((t(4)='1' and q(4)='1') or (t(5)='1' and q(5)='1')))
   else '0';
	
	arInr<='1' when (sel="010" and t(4)='1' and q(5)='1')
	else '0';
	
	drInr<='1' when ( t(5)='1' and q(6)='1')
	else '0';
	
	
	

	  	
			
end behavioral;