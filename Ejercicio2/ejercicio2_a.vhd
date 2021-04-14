library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ejercicio2_a is
    generic( N: integer := 8);
    Port ( 
    NUM1: OUT std_logic_vector(N downto 0);
    X, Y : IN std_logic_vector (N-1 downto 0);
    sel : IN std_logic_vector (1 downto 0);
    E : IN std_logic);
end ejercicio2_a;

architecture ejercicio2_a of ejercicio2_a is
    begin 
    circuito : process(X,Y,sel)
    variable aux_count: integer;     --Variable a utilizar como contador de unos
    variable aux_concat: std_logic_vector(15 downto 0);  --Variable para concatenar X e Y
    variable aux_x: std_logic_vector(N-1 downto 0); --Variable que realizará la suma de X e Y

    begin
        if (E='0') then --E=0
                NUM1 <= "000000000";
        else --E=1
            case sel is
                when "00" => --Contaremos el número de unos que hay en X e Y concatenando ambas variables. 
                    aux_concat(15 downto 8) := X;
                    aux_concat(N-1 downto 0) := Y; 
                    aux_count:=0;
                    for i in 0 to 15 loop --Creamos un bucle que recorra todos los números de la variable auxiliar
                        if (aux_concat(i) = '1') then
                            aux_count := aux_count + 1; --Si la variable tiene un uno, sumamos uno al contador.
                        end if;
                    end loop;
                    NUM1 <= std_logic_vector(to_unsigned(aux_count, 9)); --Asignamos a NUM1 el número de unos en binario.
                when "01" => --Contamos si X e Y son pares. Los valores que puede tomar NUM1 son 0 (ambos impares) 1 (uno par otro impar) o 2 (ambos pares)
                    if ((unsigned(X) mod 2) = 0) then  --> Hacemos la comprobación mediante ifs anidados.
                        if ((unsigned(Y) mod 2) = 0) then
                            NUM1 <= std_logic_vector(to_signed(2,9));
                        else 
                            NUM1 <= std_logic_vector(to_signed(1,9));
                        end if;
                    else 
                        if ((unsigned(Y) mod 2) = 0) then
                            NUM1 <= std_logic_vector(to_signed(1,9));
                        else 
                            NUM1 <= std_logic_vector(to_signed(0,9));
                        end if;
                    end if;
                when "10" => --Realizamos la operación and sobre X e Y y la almacenamos en NUM1
                    NUM1(N) <= '0';
                    NUM1(N-1 downto 0) <= std_logic_vector(signed(X) and signed(Y));
                when others => --Sumamos con signo X e Y y lo almacenamos en NUM1
                    aux_x := std_logic_vector(signed(X) + signed(Y));
                    NUM1 <= std_logic_vector(resize(signed(aux_x), N+1));
            end case;
        end if;
    end process circuito;
end architecture ejercicio2_a;