----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2023 10:55:56 AM
-- Design Name: 
-- Module Name: Maxtrix - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Maxtrix is
  Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           matrix_a : in STD_LOGIC_VECTOR (7 downto 0);
           matrix_b : in STD_LOGIC_VECTOR (7 downto 0);
           matrix_result : out matrix_type2 );
end Maxtrix;

architecture Behavioral of Maxtrix is
type matrix_type is array (0 to 1, 0 to 1) of STD_LOGIC_VECTOR (1 downto 0);

    signal a_matrix, b_matrix : matrix_type;
        signal t : matrix_type2;
begin

process (clk, rst)
    begin
        if rst = '1' then
            -- Reset the result matrix
            for i in 0 to 1 loop
                for j in 0 to 1 loop
                        t(i, j) <= (others => '0');
                end loop;
            end loop;
        elsif clk = '1' then
            -- Update the A and B matrices
            for i in 0 to 1 loop
                for j in 0 to 1 loop
               
                        a_matrix(i, j) <= matrix_a( (i*2 + j)*2 + 2 - 1 downto (i*2 + j)*2);
                        b_matrix(i, j) <= matrix_B( (i*2 + j)*2 + 2 - 1 downto (i*2 + j)*2);
                    end loop;
                end loop;


        t(0,0) <= (a_matrix(0,0) * b_matrix(0,0)) + (a_matrix(0,1) * b_matrix(1,0));
        t(0,1) <= (a_matrix(0,0) * b_matrix(0,1)) + (a_matrix(0,1) * b_matrix(1,1));
        t(1,0) <= (a_matrix(1,0) * b_matrix(0,0)) + (a_matrix(1,1) * b_matrix(1,0));
        t(1,1) <= (a_matrix(1,0) * b_matrix(0,1)) + (a_matrix(1,1) * b_matrix(1,1));

        end if;
    end process;

    
    matrix_result <= t;
end Behavioral;
