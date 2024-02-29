library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Shift_Reg is
port(
	    A, B, C, D : out std_logic;
	    Data_in    : in std_logic;
	    RST        : in std_logic;
	    CLK        : in std_logic
);
end Shift_Reg;

architecture Behavioral of Shift_Reg is

signal A_reg, B_reg  : std_logic := '0';
signal C_reg, D_reg  : std_logic := '0';
begin

    A <= A_reg;
    B <= B_reg;
    C <= C_reg;
    D <= D_reg;
    
    reg_proc: process(CLK)
    begin 
    
        if(rising_edge(CLK)) then
        
            if(RST = '1')  then
                A_reg <= '0';
                B_reg <= '0';
                C_reg <= '0';
                D_reg <= '0';
                
            else 
                A_reg <= Data_in;
                B_reg <= A_reg;
                C_reg <= B_reg;
                D_reg <= C_reg;
                
             end if;
             
        end if;
        
    end process reg_proc; 
    
end Behavioral;
