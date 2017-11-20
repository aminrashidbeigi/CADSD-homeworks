----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2017 03:56:32 PM
-- Design Name: 
-- Module Name: quest_3 - Behavioral
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

entity quest_3 is
    Port (
        rst, clk, input: in std_logic;
        output1, output2: out std_logic
    );
end quest_3;

architecture Behavioral of quest_3 is

    type STATE_TYPE is (S0, S1, S2);
    signal cstate, nstate: STATE_TYPE;

begin

    identifier : process( clk )
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                cstate <= S0;
            else
                cstate <= nstate;
            end if;
        end if;
    end process ; -- identifier

    states : process( cstate, input )
    begin
        case( cstate ) is
        
            when S0 =>
                output1 <= '0';
                output2 <= '0';
                if input = '0' then
                    nstate <= S0;
                elsif input = '1' then
                    nstate <= S1;
                end if ;
            
            when S1 =>
                output1 <= '1';
                output2 <= '0';
                if input = '0' then
                    nstate <= S0;
                elsif input = '1' then
                    nstate <= S2;
                end if ;

            when S2 =>
                output1 <= '0';
                output2 <= '1';
                if input = '0' then
                    nstate <= S0;
                elsif input = '1' then
                    nstate <= S2;
                end if ;

            when others =>
                nstate <= S0;
                output1 <= '0';
                output2 <= '0';
        end case ;
    end process ; -- states

end Behavioral;
