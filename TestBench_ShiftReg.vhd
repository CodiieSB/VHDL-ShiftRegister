library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_shift_reg is 
end;

architecture test of test_shift_reg is

component Shift_Reg
port(
	    A, B, C, D : out std_logic;
	    Data_in    : in std_logic;
	    RST        : in std_logic;
	    CLK        : in std_logic
);

end component;

signal data_in    : std_logic := '0';
signal rst        : std_logic := '0';
signal clk		  : std_logic := '1';
signal A, B, C, D : std_logic;

begin 

    dev_to_test: Shift_Reg
    port map
    (
        A       => A, 
        B       => B, 
        C       => C, 
        D       => D, 
        Data_in => data_in, 
        RST     => rst, 
        CLK     => clk
    );
		
	clk_stimulus : process
	begin 
	
		 wait for 10 ns;
		 CLK <= not CLK;
		 
    end process;
	
	data_stimulus : process
	begin 
	
	    wait for 40 ns;
		data_in <= not data_in;
		wait for 150 ns;
		
	end process;
	
end test;

	 