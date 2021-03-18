-- Puerta not: 1 entrada.

library IEEE;
use IEEE.std_logic_1164.all;

entity not1 is
    port(
        x: in std_logic;
        F: out std_logic
    );
end entity not1;

architecture not1 of not1 is
begin
    F <= not x;
end architecture not1;


-- Puerta lógica and: 2 entradas.

library IEEE;
use IEEE.std_logic_1164.all;

entity and1 is
    port(
        x,y: in std_logic;
        F: out std_logic
    );
end entity and1;

architecture and1 of and1 is
begin
    F <= x and y;
end architecture and1;

-- Puerta lógica or: 2 entradas.

library IEEE;
use IEEE.std_logic_1164.all;

entity or1 is
    port(
        x,y: in std_logic;
        F: out std_logic
    );
end entity or1;

architecture or1 of or1 is
begin
    F <= x or y;
end architecture or1;