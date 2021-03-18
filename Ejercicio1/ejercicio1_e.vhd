library IEEE;
use IEEE.std_logic_1164.all;

entity ejercicio1_e is
end entity ejercicio1_e;

architecture ejercicio1_e of ejercicio1_e is
    signal x,y,z : std_logic;
    signal F1,F2: std_logic;

    component ejercicio1_a is
        port (
            x,y,z: in std_logic;
            F1,F2: out std_logic);
    end component ejercicio1_a;
    begin
        uut: component ejercicio1_a port map (x,y,z,F1,F2);
        test : process
        begin
            x <= '0', '1' after 40 ns ; 
            y <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns; 
            z <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns ; 
            wait;
        end process test;
end architecture ejercicio1_e;
