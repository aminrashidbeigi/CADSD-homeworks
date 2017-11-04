----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 04:42:12 PM
-- Design Name: 
-- Module Name: add_4 - Behavioral
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity add_4 is
    port(
        a,b: in std_logic_vector(3 downto 0) ;
        sum: out std_logic_vector(4 downto 0)
    );
end add_4;

architecture Behavioral of add_4 is

begin
    sum <= std_logic_vector(unsigned('0'&a) + unsigned('0'&b));
    assert std_logic_vector(unsigned('0'&a) + unsigned('0'&b)) < "11111" report "overflow" severity error;

end Behavioral;
