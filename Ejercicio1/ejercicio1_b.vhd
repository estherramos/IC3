library IEEE;
use IEEE.std_logic_1164.all;

architecture ejercicio1_b of ejercicio1_a is
    begin
        --F1: x + ((not y) + z)
        --F2: x( y + z ) + yz
        F1 <= x or ((not y) and z);
        F2 <= (x and (y or z)) or (y and z);
end architecture ejercicio1_b;