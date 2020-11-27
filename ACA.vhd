library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ACA is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end ACA;

architecture Behavioral of ACA is

type t_partials is array(n-K-2 downto 0) of STD_LOGIC_VECTOR(K-1 downto 0);
signal partials: t_partials;

signal last_partial: STD_LOGIC_VECTOR(K downto 0);

begin

	C(K-1 downto 0) <= A(K-1 downto 0) + B(K-1 downto 0);
	
	gen_2: for i in 0 to n-K-2 generate
		partials(i) <= A(K+i downto i+1) + B(K+i downto i+1);
		C(i+K) <= partials(i)(K-1);
	end generate gen_2;
	
	last_partial <= ('0' & A(n-1 downto n-K)) + ('0' & B(n-1 downto n-K));
	C(n) <= last_partial(K);
	C(n-1) <= last_partial(K-1);

end Behavioral;