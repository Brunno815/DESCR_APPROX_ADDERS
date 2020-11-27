library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CopyBAAnd is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end CopyBAAnd;

architecture Behavioral of CopyBAAnd is

signal additional_bit: STD_LOGIC;

begin

	additional_bit <= A(K-1) and B(K-1);
	C(n downto K) <= ('0' & A(n-1 downto K)) + ('0' & B(n-1 downto K)) + additional_bit;
	
	gen_1: for i in 0 to K-1 generate
		gen_2: if ((i mod 2) = 0) generate
			C(i) <= B(i);
		end generate gen_2;
		gen_3: if ((i mod 2) = 1) generate
			C(i) <= A(i);
		end generate gen_3;
	end generate gen_1;
	
end Behavioral;