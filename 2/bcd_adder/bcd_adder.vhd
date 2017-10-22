----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2017 11:09:52 AM
-- Design Name: 
-- Module Name: bcd_adder - Behavioral
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

entity bcd_adder is
    port(
    input1, input2: in bcd;
    cin: in std_logic;
    output: out bcd;
    cout: out std_logic
    );
end bcd_adder;

architecture structural of bcd_adder is

    component full_adder is
        port(
        input1, input2, cin: in std_logic;
        output, cout: out std_logic
        );
    end component;
    
    signal cout_signal1 , cout_signal2 , cout_signal3 , cout_signal4 , cout_signal5 , cout_signal6 : std_logic;
    signal sum_signal1 , sum_signal2 , sum_signal3 : std_logic;
    signal and_output_signal1 , and_output_signal2 : std_logic;
    signal cout_signal : std_logic;

begin

    full_adder_module1 : full_adder port map (input1(0) , input2(0) , cin , output(0) , cout_signal1 );
    full_adder_module2 : full_adder port map (input1(1) , input2(1) , cout_signal1 , sum_signal1 , cout_signal2 );
    full_adder_module3 : full_adder port map (input1(2) , input2(2) , cout_signal2 , sum_signal2 , cout_signal3 );
    full_adder_module4 : full_adder port map (input1(3) , input2(3) , cout_signal3 , sum_signal3 , cout_signal4 );
    full_adder_module5 : full_adder port map (sum_signal1 , cout_signal , '0' , output(1) , cout_signal5 );
    full_adder_module6 : full_adder port map (sum_signal2 , cout_signal , cout_signal5 , output(2) , cout_signal6 );
    
    and_output_signal1 <= sum_signal2 and sum_signal3;
    and_output_signal2 <= sum_signal1 , sum_signal3;
    cout_signal <= (cout_signal4 or and_output_signal1) or and_output_signal2;
    output(3) <= sum_signal3 xor cout_signal6;
    cout <= cout_signal;
    
end structural;
