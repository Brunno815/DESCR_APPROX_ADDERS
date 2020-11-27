library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity trunc0 is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end trunc0;

architecture Behavioral of trunc0 is

begin

	C(n downto K) <= ('0' & A(n-1 downto K)) + ('0' & B(n-1 downto K));
	C(K-1 downto 0) <= (OTHERS => '0');

end Behavioral;