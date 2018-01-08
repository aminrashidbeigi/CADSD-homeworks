----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/03/2018 09:24:53 PM
-- Design Name: 
-- Module Name: fsm_ram - Behavioral
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
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fsm_ram is
    Port (
    clk: in std_logic;
    enable, w: in std_logic;
    R1, R2, R3: inout std_logic_vector(31 downto 0)
    );
end fsm_ram;

architecture Behavioral of fsm_ram is

type memory is array (0 to 31) of std_logic_vector(2 downto 0);
signal fsm: memory := (others => (others => '0'));
signal state: std_logic_vector(2 downto 0) := "000";

begin
    fsm(2) <= "001";
    fsm(3) <= "001";
    fsm(6) <= "101";
    fsm(7) <= "010";
    fsm(10) <= "000";
    fsm(11) <= "011";
    fsm(14) <= "000";
    fsm(15) <= "100";
    fsm(18) <= "000";
    fsm(19) <= "000";
    --the others are 000

    identifier : process( clk )
    begin
        if rising_edge(clk) then
            case( state ) is
            
                when "000" =>

                when "001" =>
                    R3 <= "00000000000000000000000000000000";
                when "010" =>
                    R3 <= R1;
                when "011" =>
                    R1 <= R2;
                when "100" =>
                    R2 <= R3;
                when "101" =>

                when others =>
                
            end case ;
            state <= fsm(to_integer(unsigned(state & enable & w)));
        end if ;
    end process ; -- identifier
    
end Behavioral;
