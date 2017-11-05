----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2017 11:20:21 AM
-- Design Name: 
-- Module Name: termo_sequential - Behavioral
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

entity termo_sequential is
    port(
        ideal, termo: in integer;
        output: out boolean
    );
end termo_sequential;

architecture Behavioral of termo_sequential is

begin

    identifier : process( ideal, termo )
    begin
        if termo > ideal + 5 then
            output <= false;
        elsif termo < ideal - 5 then
            output <= true;
        end if ;
    end process ; -- identifier
end Behavioral;
