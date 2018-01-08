----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/11/2017 06:12:06 PM
-- Design Name: 
-- Module Name: automatic_door - Behavioral
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

entity automatic_door is
    port(
        clk, open_signal, a, b: in std_logic;
        num_of_cars: out integer;
        door_is_open: out boolean
    );
end automatic_door;

architecture Behavioral of automatic_door is

    type STATE_TYPE is (S0, SIG, A1, B1, A1B1, B1A1, CNT);
    signal state: STATE_TYPE;
    signal count, timer: integer:= 0;
    signal door_signal: boolean;
    
begin

    identifier : process( clk )
    begin
        if rising_edge(clk) then
            
            case( state ) is
            
                when S0 =>
                    door_signal <= FALSE;
                    if open_signal = '1' then
                        state <= SIG;
                    else
                        state <= S0;
                    end if ;

                when SIG =>
                    door_signal <= TRUE;
                    if a = '1' then
                        state <= A1;
                    elsif b = '1' then
                        state <= B1;
                    else
                        state <= SIG;
                    end if ;
                
                when A1 =>
                    door_signal <= TRUE;
                    if b = '1' then
                        state <= A1B1;
                    elsif a = '0' then
                        state <= CNT;
                    else
                        state <= A1;
                    end if ;
    
                when B1 =>
                    door_signal <= TRUE;
                    if a = '1' then
                        state <= B1A1;
                    elsif b = '0' then
                        state <= CNT;
                    else
                        state <= B1;
                    end if ;
        
                when A1B1 =>
                    door_signal <= TRUE;
                    timer <= 0;
                    count <= count + 1;
                    state <= CNT;

                when B1A1 =>
                    door_signal <= TRUE;
                    timer <= 0;
                    count <= count - 1;
                    state <= CNT;
                    
                when CNT =>
                    timer <= timer + 1;
                    door_signal <= TRUE;
                    if a = '1' then
                        state <= A1;
                    elsif b = '1' then
                        state <= B1;
                    elsif timer = 30 then
                        state <= S0;
                    elsif timer < 30 then
                        state <= CNT;
                    end if ;

                when others =>
                    door_signal <= FALSE;
                    state <= S0;

            end case ;
        end if ;
    end process ; -- identifier

    num_of_cars <= count;
    door_is_open <= door_signal;

end Behavioral;
