----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2017 07:43:10 PM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sorter is
    Port (
    a1, a2, a3, a4, a5, a6, a7, a8: in std_logic_vector(7 downto 0);
    b1, b2, b3, b4, b5, b6, b7, b8: out std_logic_vector(7 downto 0)
    );
end sorter;

architecture Behavioral of sorter is
    
    component comparator_8_bit is
        Port (
        input1: in std_logic_vector(7 downto 0);
        input2: in std_logic_vector(7 downto 0);
        output1: out std_logic_vector(7 downto 0);
        output2: out std_logic_vector(7 downto 0)
        );
    end component;

    signal signal11, signal12, signal13, signal14, signal15, signal16, signal17, signal18: std_logic_vector(7 downto 0);
    signal signal21, signal22, signal23, signal24, signal25, signal26, signal27, signal28: std_logic_vector(7 downto 0);
    signal signal31, signal32, signal33, signal34, signal35, signal36, signal37, signal38: std_logic_vector(7 downto 0);
    signal signal41, signal42, signal43, signal44, signal45, signal46, signal47, signal48: std_logic_vector(7 downto 0);
    signal signal51, signal52, signal53, signal54, signal55, signal56, signal57, signal58: std_logic_vector(7 downto 0);
    signal signal61, signal62, signal63, signal64, signal65, signal66, signal67, signal68: std_logic_vector(7 downto 0);
    signal signal71, signal72, signal73, signal74, signal75, signal76, signal77, signal78: std_logic_vector(7 downto 0);
    signal signal81, signal82, signal83, signal84, signal85, signal86, signal87, signal88: std_logic_vector(7 downto 0);
    
begin

    comprate1and2_module1: comparator_8_bit port map (a1, a2, signal11, signal12);
    comprate3and4_module1: comparator_8_bit port map (a3, a4, signal13, signal14);
    comprate5and6_module1: comparator_8_bit port map (a5, a6, signal15, signal16);
    comprate7and8_module1: comparator_8_bit port map (a7, a8, signal17, signal18);
    
    comprate2and3_module1: comparator_8_bit port map (signal12, signal13, signal22, signal23);
    comprate4and5_module1: comparator_8_bit port map (signal14, signal15, signal24, signal25);
    comprate6and7_module1: comparator_8_bit port map (signal16, signal17, signal26, signal27);


    comprate1and2_module2: comparator_8_bit port map (signal11, signal22, signal31, signal32);
    comprate3and4_module2: comparator_8_bit port map (signal23, signal24, signal33, signal34);
    comprate5and6_module2: comparator_8_bit port map (signal25, signal26, signal35, signal36);
    comprate7and8_module2: comparator_8_bit port map (signal27, signal18, signal37, signal38);
    
    comprate2and3_module2: comparator_8_bit port map (signal32, signal33, signal42, signal43);
    comprate4and5_module2: comparator_8_bit port map (signal34, signal35, signal44, signal45);
    comprate6and7_module2: comparator_8_bit port map (signal36, signal37, signal46, signal47);


    comprate1and2_module3: comparator_8_bit port map (signal31, signal42, signal51, signal52);
    comprate3and4_module3: comparator_8_bit port map (signal43, signal44, signal53, signal54);
    comprate5and6_module3: comparator_8_bit port map (signal45, signal46, signal55, signal56);
    comprate7and8_module3: comparator_8_bit port map (signal47, signal38, signal57, signal58);

    comprate2and3_module3: comparator_8_bit port map (signal52, signal53, signal62, signal63);
    comprate4and5_module3: comparator_8_bit port map (signal54, signal55, signal64, signal65);
    comprate6and7_module3: comparator_8_bit port map (signal56, signal57, signal66, signal67);
    

    comprate1and2_module4: comparator_8_bit port map (signal51, signal62, signal71, signal72);
    comprate3and4_module4: comparator_8_bit port map (signal63, signal64, signal73, signal74);
    comprate5and6_module4: comparator_8_bit port map (signal65, signal66, signal75, signal76);
    comprate7and8_module4: comparator_8_bit port map (signal67, signal58, signal77, signal78);
    
    comprate2and3_module4: comparator_8_bit port map (signal72, signal73, signal82, signal83);
    comprate4and5_module4: comparator_8_bit port map (signal74, signal75, signal84, signal85);
    comprate6and7_module4: comparator_8_bit port map (signal76, signal77, signal86, signal87);
    
    b1 <= signal71;
    b2 <= signal82;
    b3 <= signal83;
    b4 <= signal84;
    b5 <= signal85;
    b6 <= signal86;
    b7 <= signal87;
    b8 <= signal78;

end Behavioral;
