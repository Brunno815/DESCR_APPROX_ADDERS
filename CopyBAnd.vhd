library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CopyBAnd is
	Generic(
		K: integer := 8;
		n: integer := 16
	);
	Port(
		A: in STD_LOGIC_VECTOR(n-1 downto 0);
		B: in STD_LOGIC_VECTOR(n-1 downto 0);
		C: out STD_LOGIC_VECTOR(n downto 0)
	);
end CopyBAnd;

architecture Behavioral of CopyBAnd is

signal additional_bit: STD_LOGIC;

begin

	additional_bit <= A(K-1) and B(K-1);
	C(n downto K) <= ('0' & A(n-1 downto K)) + ('0' & B(n-1 downto K)) + additional_bit;
	C(K-1 downto 0) <= B(K-1 downto 0);

end Behavioral;