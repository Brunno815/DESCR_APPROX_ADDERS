library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ETAII is
	Generic(
		K: integer := 4;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end ETAII;

architecture Behavioral of ETAII is

type t_cla is array((n/K)-1 downto 0) of STD_LOGIC_VECTOR(K downto 0);
signal coutCLA: t_cla;

begin

	gen_1: for i in 0 to (n/K)-1 generate
		coutCLA(i) <= ('0' & A(i*K+K-1 downto i*K)) + ('0' & B(i*K+K-1 downto i*K));
	end generate gen_1;
	
	C(K-1 downto 0) <= A(K-1 downto 0) + B(K-1 downto 0);
	
	gen_2: for i in 1 to (n/K)-1 generate
		C(i*K+K-1 downto i*K) <= A(i*K+K-1 downto i*K) + B(i*K+K-1 downto i*K) + coutCLA(i-1)(K);
	end generate gen_2;
	
	C(n) <= coutCLA((n/K)-1)(K);
	
end Behavioral;