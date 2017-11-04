----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/04/2017 04:25:13 PM
-- Design Name: 
-- Module Name: sensor_concurrent - Behavioral
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

entity sensor_concurrent is
    port(
        sensor1, sensor2, sensor3, sensor4: in integer;
        output: out std_logic 
    );
end sensor_concurrent;

architecture Behavioral of sensor_concurrent is

    signal sumOfSensorValues: integer;
    signal averageOfSensorValues: Unsigned (15 downto 0);
begin

    sumOfSensorValues <= sensor1 + sensor2 + sensor3 + sensor4;
    averageOfSensorValues <= shift_right(to_unsigned(sumOfSensorValues,16), 2);
    output <= '0' when averageOfSensorValues > "1100100" else
              '1' when averageOfSensorValues <= "1100100";
end Behavioral;
