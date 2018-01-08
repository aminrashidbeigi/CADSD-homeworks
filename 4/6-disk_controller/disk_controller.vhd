----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2017 04:12:51 PM
-- Design Name: 
-- Module Name: disk_controller - Behavioral
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

entity disk_controller is
    Port (
        clk: in std_logic;
        D1, D2, D3, D4: in integer;
        data: out std_logic_vector(31 downto 0);
        address: out std_logic_vector(7 downto 0)
        
    );
end disk_controller;

architecture Behavioral of disk_controller is
    
    type dees is array (0 to 3) of integer;
    type STATE_TYPE is (NO_SERVICE, S1, S2, S3, S4);
    type two_d_array is array (127 downto 0) of std_logic_vector(31 downto 0) ;
    signal file_array : two_d_array  := (others => (others => '0')) ;
    signal d1_ready, d2_ready, d3_ready, d4_ready: std_logic := '1'; 
    signal state: STATE_TYPE;
    signal sorted_array : dees;
    signal is_ascending, sorted, service_needed : std_logic := '0';

begin

    file_array(127) <= "00000000000000000000000000000000";
    file_array(124) <= "00000000000000000000000000000011";
    file_array(125) <= "00000000000000000000000000001010";
    file_array(126) <= "00000000000000000000000000000001";
    
    process(D1, D2, D3, D4, is_ascending)
    variable sorted_arr : dees;
    variable temp: integer := 0;
    begin
        sorted_arr := (D1 , D2 , D3 , D4);
        if (is_ascending = '1') then
            for i in 0 to 3 loop
                for j in 0 to 2 loop
                if (sorted_arr(j) > sorted_arr(j+1)) then
                    temp := sorted_arr(j);
                    sorted_arr(j) := sorted_arr(j+1);
                    sorted_arr(j+1) := temp;
                    end if;
                end loop;
            end loop;
        elsif(is_ascending = '0') then
            for i in 0 to 3 loop
                for j in 0 to 2 loop
                if (sorted_arr(j) < sorted_arr(j+1)) then
                    temp := sorted_arr(j);
                    sorted_arr(j) := sorted_arr(j+1);
                    sorted_arr(j+1) := temp;
                    end if;
                end loop;
            end loop;
        end if;
        sorted_array <= sorted_arr;
        sorted <= '1';
    end process;

    states : process( clk )
    begin
        if(rising_edge(clk)) then
            
            case( state ) is
                when NO_SERVICE =>
                
                    if service_needed = '1' then
                        state <= S1;
                    elsif service_needed = '0' then
                        state <= NO_SERVICE;        
                    end if ;

                when S1 =>
                        
                    if (sorted_array(0) = D1 and d1_ready = '1') then
                        data <= file_array(D1);
                        address <= D1;
                        d1_ready <= '0';
                    elsif (sorted_array(0) = D2 and d2_ready = '1') then
                        data <= file_array(D2);
                        address <= D2;
                        d2_ready <= '0';
                    elsif (sorted_array(0) = D3 and d3_ready = '1') then
                        data <= file_array(D3);
                        address <= D3;
                        d3_ready <= '0';
                    elsif (sorted_array(0) = D4 and d4_ready = '1') then
                        data <= file_array(D4);
                        address <= D4;
                        d4_ready <= '0';
                    end if ;
                    state <= S2;        
                    
                when S2 =>
                
                    if (sorted_array(1) = D1 and d1_ready = '1') then
                        data <= file_array(D1);
                        address <= D1;
                        d1_ready <= '0';
                    elsif (sorted_array(1) = D2 and d2_ready = '1') then
                        data <= file_array(D2);
                        address <= D2;
                        d2_ready <= '0';
                    elsif (sorted_array(1) = D3 and d3_ready = '1') then
                        data <= file_array(D3);
                        address <= D3;
                        d3_ready <= '0';
                    elsif (sorted_array(1) = D4 and d4_ready = '1') then
                        data <= file_array(D4);
                        address <= D4;
                        d4_ready <= '0';
                    end if ;
                    state <= S3;
                    
                when S3 =>
                    if (sorted_array(2) = D1 and d1_ready = '1') then
                        data <= file_array(D1);
                        address <= D1;
                        d1_ready <= '0';
                    elsif (sorted_array(2) = D2 and d2_ready = '1') then
                        data <= file_array(D2);
                        address <= D2;
                        d2_ready <= '0';
                    elsif (sorted_array(2) = D3 and d3_ready = '1') then
                        data <= file_array(D3);
                        address <= D3;
                        d3_ready <= '0';
                    elsif (sorted_array(2) = D4 and d4_ready = '1') then
                        data <= file_array(D4);
                        address <= D4;
                        d4_ready <= '0';
                    end if ;
                    state <= S4;
                
                when S4 =>
                    if (sorted_array(3) = D1 and d1_ready = '1') then
                        data <= file_array(D1);
                        address <= D1;
                        d1_ready <= '0';
                    elsif (sorted_array(3) = D2 and d2_ready = '1') then
                        data <= file_array(D2);
                        address <= D2;
                        d2_ready <= '0';
                    elsif (sorted_array(3) = D3 and d3_ready = '1') then
                        data <= file_array(D3);
                        address <= D3;
                        d3_ready <= '0';
                    elsif (sorted_array(3) = D4 and d4_ready = '1') then
                        data <= file_array(D4);
                        address <= D4;
                        d4_ready <= '0';
                    end if ;
                    state <= NO_SERVICE;
                    is_ascending <= not is_ascending;
                    
                when others =>
                    state <= NO_SERVICE;
            end case ;
        end if;
    end process ; -- states

    service_check : process( d1_ready, d2_ready, d3_ready, d4_ready, D1, D2, D3, D4 )
    begin
        if ( d1_ready = '0' and d2_ready = '0' and d3_ready = '0' and d4_ready = '0' ) then
            service_needed <= '0';
        else
            service_needed <= '1';
        end if ;
    end process ; -- service_check

end Behavioral;
