----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2023 11:00:09 AM
-- Design Name: 
-- Module Name: TestBench - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.array_pac.all;
use std.env.finish;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TestBench is
--  Port ( );
end TestBench;

architecture Behavioral of TestBench is


   
    signal clk : std_logic := '0';
    signal rst : std_logic := '1';
    signal matrix_1a : std_logic_vector(7 downto 0) ;
    signal matrix_1b : std_logic_vector(7 downto 0) ;
    signal matrix_result : matrix_type2 ;
begin
clk <= not clk after 2.5 ns;
r1: entity work.Maxtrix(Behavioral)
port map(clk => clk ,rst => rst, Matrix_a => Matrix_1a,Matrix_b => Matrix_1b, matrix_result => matrix_result); 

   dut: process
    begin
--        rst <= '1';
--        wait for 5 ns;
        rst <= '0';
   
        wait for 20 ns;
        matrix_1a <= "10000111";
        matrix_1b <= "01000010";
        wait for 50 ns;

      finish;
    end process;
end Behavioral;
