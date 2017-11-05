----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 05:27:52 PM
-- Design Name: 
-- Module Name: f_divider - Behavioral
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

entity f_divider is
    port (
        clk, enable, rst: in std_logic := '0';
        output: out std_logic
    );
end f_divider;

architecture Behavioral of f_divider is

    constant clk_period : time := 1 us;
    
    begin

    identifier : process
    begin
        if rst = '1' then
            output <= '0';
            wait for clk_period;
        else
            if enable = '1' then
                output <= '0';
                wait for (clk_period/10) * 7;
                output <= '1';
                wait for (clk_period/10) * 3;
            elsif enable = '0' then
                output <= '0';
                wait for (clk_period/10) * 4;
                output <= '1';
                wait for (clk_period/10) * 6;
            end if ;
        end if ;
    end process ; -- identifier
    
end Behavioral;
