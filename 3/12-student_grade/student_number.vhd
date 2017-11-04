----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 07:26:36 PM
-- Design Name: 
-- Module Name: student_number - Behavioral
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

entity student_number is
    port(
        grade: in integer;
        a,b,c,d: out std_logic
    );
end student_number;

architecture Behavioral of student_number is

    signal grade_range: std_logic_vector(3 downto 0) ;
begin
    grade_range <= "0001" when (grade > 50 and grade <61) else
        "0010" when (grade > 60 and grade <71) else
        "0100" when (grade > 70 and grade <86) else
        "1000" when (grade > 85 and grade <101) else
        "0000";
    
    a <= grade_range(3);
    b <= grade_range(2);
    c <= grade_range(1);
    d <= grade_range(0);

end Behavioral;
