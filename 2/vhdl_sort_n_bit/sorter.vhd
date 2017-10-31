----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2017 11:45:53 AM
-- Design Name: 
-- Module Name: sorter - Behavioral
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
use ieee.numeric_std.all;
use work.constants.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sorter is
    Port (
    inputs: in array (NUM_OF_BITS) std_logic_vector(7 downto 0);
    outputs: out array (NUM_OF_BITS) std_logic_vector(7 downto 0)
    );
end sorter;

architecture structural of sorter is
    
    component comparator_8_bit is
        generic (BITS: integer := NUM_OF_BITS);
        Port (
        input1: in std_logic_vector(NUM_OF_BITS - 1 downto 0);
        input2: in std_logic_vector(NUM_OF_BITS - 1 downto 0);
        output1: out std_logic_vector(NUM_OF_BITS - 1 downto 0);
        output2: out std_logic_vector(NUM_OF_BITS - 1 downto 0)
        );
    end component;

    signal arr : array (0 to NUM_OF_BITS, 0 to NUM_OF_BITS - 1) of std_logic_vector(7 downto 0);
    

begin

    identifier : for i in 0 to NUM_OF_BITS - 1 generate
        arr(i, 0) <= inputs(i); 
    end generate ; -- identifier
    
    identifier1 : for i in 0 to NUM_OF_BITS - 1 generate
        identifier2 : for j in 0 to NUM_OF_BITS - 1 generate
            if i mod 2 = 0 generate
                if j mod 2 = 0 generate
                    comprate1and2_module1: comparator_8_bit port map (arr(i,j), arr(i, j+1), arr(i+1,j), arr(i+1, j+1));
                end generate ;
            end generate ;
            if i mod 2 = 1 generate
                if j mod 2 = 1 generate
                    comprate1and2_module1: comparator_8_bit port map (arr(i,j), arr(i, j+1), arr(i+1,j), arr(i+1, j+1));
                end generate ;
            end generate ;
        end generate ; -- identifier
    end generate ; -- identifier
    
    identifier : for i in 0 to NUM_OF_BITS - 1 generate
        outputs(i) <= arr(i, NUM_OF_BITS - 1); 
    end generate ; -- identifier

end structural;
