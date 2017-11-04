----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 03:29:26 PM
-- Design Name: 
-- Module Name: sensor - Behavioral
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

entity sensor is
    port(
        sensor1, sensor2, sensor3, sensor4: in integer;
        output: out std_logic 
    );
end sensor;

architecture Behavioral of sensor is

    signal sumOfSensorValues: integer;
    signal averageOfSensorValues: Unsigned (15 downto 0);
begin

    sumOfSensorValues <= sensor1 + sensor2 + sensor3 + sensor4;
    averageOfSensorValues <= shift_right(to_unsigned(sumOfSensorValues,16), 2);
    identifier : process( averageOfSensorValues )
    begin
        if averageOfSensorValues > "01100100" then
            output <= '0';
        else
            output <= '1';
        end if ;
    end process ; -- identifier

end Behavioral;
