library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity LOA is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end LOA;

architecture Behavioral of LOA is

signal cin_exact: STD_LOGIC;

begin

	cin_exact <= A(K-1) and B(K-1);

	C(n downto K) <= ('0' & A(n-1 downto K)) + ('0' & B(n-1 downto K)) + cin_exact;
	
	gen_1: for i in 0 to K-1 generate
		C(i) <= A(i) or B(i);
	end generate gen_1;
	
end Behavioral;