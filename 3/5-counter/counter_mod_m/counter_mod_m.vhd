----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2017 11:38:14 AM
-- Design Name: 
-- Module Name: counter_mod_m - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_mod_m is
    generic(
    module: std_logic_vector(5 downto 0) := "000100"
    );
    port(
    clk, rst: in std_logic;
    output: out std_logic_vector(5 downto 0)
    );
end counter_mod_m;

architecture Behavioral of counter_mod_m is

    signal output_signal : std_logic_vector(5 downto 0) := "000000";
begin
    process(clk, rst)
    begin
        if rst = '1' then
            output_signal <= "000000";
        elsif rising_edge(clk) then
            output_signal <= output_signal + module;
        end if ;
    end process ; 
    
    output<= output_signal;

end Behavioral;
