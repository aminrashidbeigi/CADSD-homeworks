----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2017 03:56:32 PM
-- Design Name: 
-- Module Name: quest_3 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port (
        a_count, b_count, c_count, d_count: out integer
    );
end counter;

architecture Behavioral of counter is

    type memory_type is array (0 to 255) of character ;
    signal memory: memory_type;

begin
    counter_process : process( memory )
    variable a_count_var, b_count_var, c_count_var, d_count_var : integer := 0;
    begin
        identifier : for i in 0 to 255 loop
            if(memory(i) = 'A') then
                a_count_var := a_count_var + 1;
            elsif(memory(i) = 'B') then
                b_count_var := b_count_var + 1;
            elsif(memory(i) = 'C') then
                c_count_var := c_count_var + 1;
            elsif(memory(i) = 'D') then
                d_count_var := d_count_var + 1;
            end if;
        end loop ; -- identifier

        a_count <= a_count_var;
        b_count <= b_count_var;
        c_count <= c_count_var;
        d_count <= d_count_var;
    
        end process ; -- counter_process

end Behavioral;
