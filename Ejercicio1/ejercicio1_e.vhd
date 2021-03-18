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
            F1,F2: out std_logic
        );
    end component ejercicio1_a;
    begin
        uut: component ejercicio1_a port map (x,y,z,F1,F2);
        test : process
        begin
            x <= '0'; y <= '0'; z <= '0';
            wait for 10 ns;
            x <= '0'; y <= '0'; z <= '1';
            wait for 10 ns;
            x <= '0'; y <= '1'; z <= '0';
            wait for 10 ns;
            x <= '0'; y <= '1'; z <= '1';
            wait for 10 ns;
            x <= '1'; y <= '0'; z <= '0';
            wait for 10 ns;
            x <= '1'; y <= '0'; z <= '1';
            wait for 10 ns;
            x <= '1'; y <= '1'; z <= '0';
            wait for 10 ns;
            x <= '1'; y <= '1'; z <= '1';
            wait for 10 ns;
            report "Fin de la simulación";
            wait;
        end process test;
end architecture ejercicio1_e;
