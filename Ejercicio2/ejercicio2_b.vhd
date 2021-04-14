library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ejercicio2_b is
end ejercicio2_b;

architecture ejercicio2_b of ejercicio2_b is
    signal NUM1: std_logic_vector(8 downto 0);
    signal X, Y : std_logic_vector (7 downto 0);
    signal sel : std_logic_vector (1 downto 0);
    signal E : std_logic;

    component ejercicio2_a is
        generic (N: integer := 8);
        port (
            NUM1: out std_logic_vector(N downto 0);
            X,Y: in std_logic_vector(N-1 downto 0);
            sel: in std_logic_vector(1 downto 0);
            E: in std_logic);
    end component ejercicio2_a;

    procedure check_ALU
        ( X, Y : in std_logic_vector (7 downto 0);
        sel : in std_logic_vector (1 downto 0);
        E : in std_logic;
        actual_NUM1: in std_logic_Vector (8 downto 0);
        error_count: inout integer) is
        variable expected_NUM1 : std_logic_vector(8 downto 0);
        variable aux_count : integer;
    begin
        case E is 
            when '0' =>
                expected_NUM1 := std_logic_vector(to_signed(0,9)); -- NUM1 debe valor 0 minetras E sea 0.
            when others =>
                if (sel="00") then
                    aux_count:=0;
                    for i in 0 to 7 loop --Creamos un bucle que recorra todos los números de la variable auxiliar
                        if (X(i) = '1') then
                        aux_count := aux_count + 1; --Si la variable tiene un uno, sumamos uno al contador.
                        end if;
                        if (Y(i) = '1') then
                        aux_count := aux_count + 1; --Si la variable tiene un uno, sumamos uno al contador.
                        end if;
                    end loop;
                    expected_NUM1(8 downto 5) := "0000";
                    expected_NUM1(4 downto 0) :=  std_logic_vector(to_signed(aux_count,5));
                end if;
                if (sel="01") then
                    if ((unsigned(X) mod 2) = 0) then  --> Hacemos la comprobación mediante ifs anidados.
                        if ((unsigned(Y) mod 2) = 0) then
                            expected_NUM1 := "000000010";
                        else 
                        expected_NUM1 := "000000001";
                        end if;
                    else 
                        if ((unsigned(Y) mod 2) = 0) then
                            expected_NUM1 := "000000001";
                        else 
                        expected_NUM1 := "000000000";
                        end if;
                    end if;
                end if;
                if (sel="10") then
                    expected_NUM1 :=std_logic_vector(resize((signed(X) and signed(Y)),9));
                end if;
                if (sel="11") then
                    expected_NUM1 :=std_logic_vector(resize(((signed(X)))+(signed(Y)),9));
                end if;
        end case;
        if (expected_NUM1 /= actual_NUM1) then
            report "ERROR: Valor esperado: " & integer'image(to_integer(signed(expected_NUM1))) & " en binario. Valor obtenido: " & integer'image(to_integer(signed(NUM1)));
            error_count := error_count + 1;
        end if;
    end procedure check_ALU;

    begin
        uut: component ejercicio2_a port map (NUM1,X,Y,sel,E);
        test : process is
            variable error_count: integer:=0;
        begin
            report "Comienza la simulacion";
            E <= '0';
            for g in 0 to 3 loop
                for i in 0 to 2**7-1 loop
                    for j in 0 to 2**7-1 loop
                        sel <= std_logic_vector(to_unsigned(g,2)); --Bucle sel 00|01|10|11
                        X <= std_logic_vector(to_unsigned(i,8)); --Bucle X
                        Y <= std_logic_vector(to_unsigned(j,8)); --Bucle Y
                        wait for 10 ns;
                        check_ALU(X,Y,sel,E,NUM1,error_count);
                    end loop;
                end loop;
            end loop;
            E <= '1';
            for g in 0 to 3 loop
                for i in 0 to 2**7-1 loop
                    for j in 0 to 2**7-1 loop
                        sel <= std_logic_vector(to_unsigned(g,2)); --Bucle sel 00|01|10|11
                        X <= std_logic_vector(to_unsigned(i,8)); --Bucle X
                        Y <= std_logic_vector(to_unsigned(j,8)); --Bucle Y
                        wait for 10 ns;
                        check_ALU(X,Y,sel,E,NUM1,error_count);
                    end loop;
                end loop;
            end loop;
            if (error_count=0) then --Si hay errores mostramos un mensaje con el número de errores. 
                report "Finaliza la simulacion sin errores";
            else
                report "Finaliza la simulacion: " & integer'image(error_count) & " errores";
            end if; -- Termina la simulación
            wait;
        end process test;
end architecture ejercicio2_b;
