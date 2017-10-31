----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2017 06:48:41 PM
-- Design Name: 
-- Module Name: comparator_8_bit - Behavioral
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

entity comparator_8_bit is
    generic (BITS: integer := 8);
    Port (
    input1: in std_logic_vector(BITS downto 0);
    input2: in std_logic_vector(BITS downto 0);
    output1: out std_logic_vector(BITS downto 0);
    output2: out std_logic_vector(BITS downto 0)
    );
end comparator_8_bit;

architecture structural of comparator_8_bit is

begin
    process (input1, input2)
    begin
        for i in BITS downto 0 loop
            if(input2(i) > input1(i)) then
                output1 <= input1;
                output2 <= input2;
                exit;
            elsif (input2(i) < input1(i)) then
                output1 <= input2;
                output2 <= input1;
                exit;
            else
                output1 <= input2;
                output2 <= input1;
            end if;
        end loop;
    end process;
end structural;
