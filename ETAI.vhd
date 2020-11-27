library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ETAI is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end ETAI;

architecture Behavioral of ETAI is

type t_sum is array (0 to K-1) of STD_LOGIC_VECTOR(1 downto 0);
type t_or is array(K-1 downto 0) of STD_LOGIC;
signal partials: t_sum;
signal ors: t_or;

begin
	
	gen_1: for i in K-1 downto 0 generate
		partials(i) <= (('0' & A(i)) + ('0' & B(i)));
	end generate gen_1;
	
	ors(K-1) <= partials(K-1)(1);
	
	gen_2: for i in K-2 downto 0 generate
		ors(i) <= ors(i+1) or partials(i)(1);
	end generate gen_2;

	gen_3: for i in K-1 downto 0 generate
		C(i) <= partials(i)(0) or ors(i);
	end generate gen_3;
			
	C(n downto K) <= ('0' & A(n-1 downto K)) + ('0' & B(n-1 downto K));

end Behavioral;