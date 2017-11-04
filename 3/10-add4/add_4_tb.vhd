
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

 
 
ENTITY add_4_tb IS
END add_4_tb;
 
ARCHITECTURE behavior OF add_4_tb IS 
 
 
    COMPONENT add_4
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         sum : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

   signal sum : std_logic_vector(4 downto 0);

 
 
BEGIN
 
   uut: add_4 PORT MAP ( a, b, sum);

    stim_proc: process
    begin		
        identifier1 : for i in 0 to 15 loop
            identifier2 : for j in 0 to 15 loop
                a <= std_logic_vector(to_unsigned(i,4));
                b <= std_logic_vector(to_unsigned(j,4));
                wait for 10 ns;
            end loop ; -- identifier2
        end loop ; -- identifier1
   end process;

END;
