library IEEE;
use IEEE.std_logic_1164.all;


architecture ejercicio1_d of ejercicio1_a is

component not1 is
    port(
       x: in std_logic;
       F: out std_logic
    );
end component not1;

component and1 is
    port(
        x,y: in std_logic;
        F: out std_logic
    );
end component and1;

component or1 is
    port(
        x,y: in std_logic;
        F: out std_logic
    );
end component or1;

signal sO2_1, sA2_1, sA2_2, sO2_2, sN1_1, sA1_1, sO1_1 : std_logic;
begin
N1_1: component not1 port map (y, sN1_1);
A1_1: component and1 port map (sN1_1, z, sA1_1);
O1_1: component or1 port map (x, sA1_1, F1);
O2_1: component or1 port map (y, z, sO2_1);
A2_1: component and1 port map (x, sO2_1, sA2_1);
A2_2: component and1 port map (y, z, sA2_2);
O2_2: component or1 port map (sA2_1, sA2_2, F2);

end architecture ejercicio1_d;


