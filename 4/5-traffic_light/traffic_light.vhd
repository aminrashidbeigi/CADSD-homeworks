----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2017 05:13:36 PM
-- Design Name: 
-- Module Name: traffic_light - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity traffic_light is
    port(
    rst, clk, sensor: in std_logic
    );
end traffic_light;

architecture Behavioral of traffic_light is

    type STATE_TYPE is (GREEN, YELLOW, RED);
    signal state: STATE_TYPE;
    signal counter: integer := 0;
begin

    states : process( clk, rst )
    begin

        if(rising_edge(clk)) then
            if(rst = '1') then
                state <= GREEN;
            else
                case( state ) is
                    when GREEN =>
                        if sensor = '0' then
                            state <= GREEN;
                        elsif sensor = '1' then
                            state <= YELLOW;
                        end if ;
                    
                    when YELLOW =>
                        counter <= counter + 1;
                        if counter = 29 then
                            state <= RED;
                            counter <= 0;
                        elsif counter < 29 then
                            state <= YELLOW;
                        end if ;
        
                    when RED =>
                        counter <= counter + 1;
                        if counter = 99 then
                            state <= GREEN;
                            counter <= 0;
                        elsif counter < 99 then
                            state <= RED;
                        end if ;
                    when others =>
                        state <= GREEN;
                end case ;
            end if;
        end if;
    end process ; -- states

end Behavioral;
