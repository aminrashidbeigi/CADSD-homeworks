----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2017 03:43:47 PM
-- Design Name: 
-- Module Name: pattern_checker - Behavioral
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
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pattern_checker is
    Port (
    clk, rst: in std_logic;
    input: in std_logic_vector(0 to NUM_OF_BITS - 1);
    output: out std_logic_vector(1 downto 0)
    );
end pattern_checker;

architecture Behavioral of pattern_checker is
 
    type STATE_TYPE is (
        START1, G, GG, GGG, GGGG, GGGGG, GGGGGA, GGGGGAC, GGGGGACT, GGGGGACTC, GGGGGACTCT, GGGGGACTCTC, GGGGGACTCTCT, GGGGGACTCTCTC, 
        START2, A, AA, AAG, AAGT, AAC
    );
    signal stateU, stateV: STATE_TYPE;
    
    signal sample: string(1 to NUM_OF_BITS/2+1);
    signal counter, counterV: integer := 1;
    signal flag :std_logic:= '0';
    signal u_founded, v_founded: std_logic := '0';
begin

    stringMaker : process( input )
    begin
        identifier : for i in 0 to input'high loop
            if (i mod 2 = 1) then
                if input(i-1) = '0' then
                    if input(i) = '0' then
                        sample(i/2 + 1) <=  'A';
                    elsif(input(i) = '1') then
                        sample(i/2 + 1) <= 'C';
                    end if;
                elsif(input(i-1) = '1') then
                    if input(i) = '0' then
                        sample(i/2 + 1) <= 'T';
                    elsif(input(i) = '1') then
                        sample(i/2 + 1) <= 'G';
                    end if;
                end if; 
            end if;
        end loop ; -- identifier
        flag <= '1';
    end process ; -- stringMaker

    stateUs : process( clk, rst )
    begin
        if(rising_edge(clk) and flag = '1') then
            if(rst = '1') then
                stateU <= START1;
            else
                case( stateU ) is
                    when START1 =>
                        if sample(counter) = 'G' then
                            stateU <= G;
                        else 
                            stateU <= START1;
                        end if ;
                        
                    when G =>
                        if sample(counter) = 'G' then
                            stateU <= GG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GG =>
                        if sample(counter) = 'G' then
                            stateU <= GGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGG =>
                        if sample(counter) = 'G' then
                            stateU <= GGGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGG =>
                        if sample(counter) = 'G' then
                            stateU <= GGGGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGG =>
                        if sample(counter) = 'A' then
                            stateU <= GGGGGA;
                        elsif sample(counter) = 'G' then
                            stateU <= GGGGG;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGA =>
                        if sample(counter) = 'A' then
                            stateU <= GGGGGA;
                        elsif sample(counter) = 'C' then
                            stateU <= GGGGGAC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGAC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACTCT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTCTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTC =>
                        if sample(counter) = 'T' then
                            stateU <= GGGGGACTCTCT;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTCT =>
                        if sample(counter) = 'C' then
                            stateU <= GGGGGACTCTCTC;
                        else 
                            stateU <= START1;
                        end if ;
                    when GGGGGACTCTCTC =>
                        stateU <= START1;
                        u_founded <= '1';
                        
                    when others =>
                        stateU <= START1;
                
                end case ;
            end if;
            counter <= counter + 1;
        end if;

    end process ; -- stateUs


    statesV : process( clk, rst )
    begin
        if(rising_edge(clk)) then
            if(rst = '1') then
                stateV <= START2;
            else
                case( stateV ) is
                    when START2 =>
                        if sample(counterV) = 'A' then
                            stateV <= A;
                        else 
                            stateV <= START2;
                        end if ;
                        
                    when A =>
                        if sample(counterV) = 'A' then
                            stateV <= AA;
                        else 
                            stateV <= START2;
                        end if ;
                    when AA =>
                        if sample(counterV) = 'C' then
                            stateV <= AAC;
                        elsif sample(counterV) = 'G' then
                            stateV <= AAG;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAG =>
                        if sample(counterV) = 'T' then
                            stateV <= AAGT;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAGT =>
                        if sample(counterV) = 'G' then
                            stateV <= AAG;
                        else 
                            stateV <= START2;
                        end if ;
                    when AAC =>
                        stateV <= START2;
                        v_founded <= '1';
                    when others =>
                        stateV <= START2;
                
                end case ;
            end if;
            
                counterV <= counterV + 1;

        end if;

    end process ; -- stateUs

    outputSetter : process( clk )
    begin
        if v_founded = '1' then
            output(1) <= '1';
        else
            output(1) <= '0';
        end if ;
        if u_founded = '1' then
            output(0) <= '1';
        else
            output(0) <= '0';
        end if ;
    end process ; -- outputSetter

end Behavioral;
