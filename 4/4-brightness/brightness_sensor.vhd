----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2017 04:49:45 PM
-- Design Name: 
-- Module Name: time_sensor - Behavioral
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

entity brightness_sensor is
    Port ( 
        clock: in integer range 0 to 2359;
        brightness: in integer;
        lights: out std_logic
    );
end brightness_sensor;

architecture Behavioral of brightness_sensor is

begin
    identifier : process( clock, brightness )
    begin
        if clock <= 500 then
            lights <= '0';
        elsif clock > 500 and clock <= 800 then
            if brightness >= 100 then
                lights <= '0';
            elsif brightness < 100 then
                lights <= '1';
            end if ;
        elsif clock > 801 and clock <= 1700 then
            lights <= '0';
        else
            if brightness >= 100 then
                lights <= '0';
            elsif brightness < 100 then
                lights <= '1';
            end if ;
        end if ;
    end process ; -- identifier

end Behavioral;
