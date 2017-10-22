----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2017 11:11:30 AM
-- Design Name: 
-- Module Name: bcd_adder_3_digit - Behavioral
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
use work.bcd_type.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_adder_3_digit is
    port(
    input1, input2: in std_logic_vector(11 downto 0);
    output: out std_logic_vector(11 downto 0);
    cout: out std_logic
    );
end bcd_adder_3_digit;


architecture structural of bcd_adder_3_digit is

component bcd_adder is
    port(
    input1, input2: in bcd;
    cin: in std_logic;
    output: out bcd;
    cout: out std_logic
    );
end component;

signal a1, a2, a3, b1, b2, b3, c1, c2, c3: bcd;
signal cout_signal1, cout_signal2: std_logic;

begin

    bcd_adder_module1 : bcd_adder port map(a1 , a2 , '0' , a3 , cout_signal1);
    bcd_adder_module2 : bcd_adder port map(b1 , b2 , cout_signal1 , b3 , cout_signal2);
    bcd_adder_module3 : bcd_adder port map(c1 , c2 , cout_signal2 , c3 , cout);


    input_loop : for i in 0 to 3 generate
    
            a1(i) <= input1(i);
            b1(i) <= input1(i + 4);
            c1(i) <= input1(i + 8);
    
            a2(i) <= input2(i);
            b2(i) <= input2(i + 4);
            c2(i) <= input2(i + 8);
    
    end generate ; -- input_loop
    
    output(11) <= c3(3);
    output(10) <= c3(2);
    output(9) <= c3(1);
    output(8) <= c3(0);
    output(7) <= b3(3);
    output(6) <= b3(2);
    output(5) <= b3(1);
    output(4) <= b3(0);
    output(3) <= a3(3);
    output(2) <= a3(2);
    output(1) <= a3(1);
    output(0) <= a3(0);
            
    
end structural;

