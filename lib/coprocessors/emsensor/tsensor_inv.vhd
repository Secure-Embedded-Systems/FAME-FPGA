----------------------------------------------------------------------------------
-- Company: SES, VT
-- Engineer: Chinmay
-- 
-- Create Date:    12:09:41 10/29/2015 
-- Design Name: 
-- Module Name:    canary - Structural 
-- Project Name: Canary_sakura
-- Target Devices: Sakura
-- Tool versions: 
-- Description: 
--
-- Dependencies: ff.vhd
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tsensor_inv is
	generic (
		N : integer := 22	-- 1 to 32 (length of mux-inv chain)
	);
    Port ( 
    	clk : in  STD_LOGIC;
		rstn : in  STD_LOGIC;
		s : in std_logic_vector (31 downto 0);
        alarm : out STD_LOGIC
     );
	attribute dont_touch : string;
	attribute dont_touch of tsensor_inv: entity is "true|yes";
end tsensor_inv;

architecture Structural of tsensor_inv is
	
	-- component ff port (
		-- clk : in std_logic;
		-- d : in std_logic;
		-- q : out std_logic
	-- );
	-- end component;
	
	signal d_toggle : std_logic;
	signal q_toggle : std_logic := '0';
	signal d_main : std_logic;
	signal q_main : std_logic;
	signal d_shadow : std_logic;
	signal q_shadow : std_logic;
	type inv_array_type is array(12*N downto 0) of std_logic;
	type mux_array_type is array(N downto 0) of std_logic;
	signal N_net : inv_array_type;
	signal mux_in0 : mux_array_type;
	signal mux_in1 : mux_array_type;
	signal mux_out: mux_array_type;
	
	attribute keep : string;
	attribute keep of d_toggle : signal is "true";
	attribute keep of q_toggle : signal is "true";
	attribute keep of d_main : signal is "true";
	attribute keep of d_shadow : signal is "true";
	attribute keep of q_main : signal is "true";
	attribute keep of q_shadow : signal is "true";
	attribute keep of N_net : signal is "true";
	attribute keep of mux_in0 : signal is "true";
	attribute keep of mux_in1 : signal is "true";
	attribute keep of mux_out : signal is "true";
	
begin

	-- toggle_ff : ff port map (
		-- clk => clk,
		-- d => d_toggle,
		-- q => q_toggle
	-- );

	-- main_ff : ff port map (
		-- clk => clk,
		-- d => d_main,
		-- q => q_main
	-- );
	
	-- shadow_ff : ff port map (
		-- clk => clk,
		-- d => d_shadow,
		-- q => q_shadow
	-- );

	ffs: process (clk)
	begin 
		if rising_edge(clk) then
			if (rstn = '0') then
				q_toggle <= '1';
				q_main <= '0';
				q_shadow <= '0';
			else
				q_toggle <= d_toggle;
				q_main <= d_main;
				q_shadow <= d_shadow;
			end if;
		end if;
	end process;
	
	d_toggle <= not (q_toggle);
	d_main <= q_toggle;
	mux_out(0) <= q_toggle;
	inv : for i in 1 to N generate
		-- 4 inverters
		N_net(12*(i-1) + 1) <= not mux_out(i-1);
		N_net(12*(i-1) + 2) <= not N_net(12*(i-1) + 1);
		N_net(12*(i-1) + 3) <= not N_net(12*(i-1) + 2);
		N_net(12*(i-1) + 4) <= not N_net(12*(i-1) + 3);
		N_net(12*(i-1) + 5) <= not N_net(12*(i-1) + 4);
		N_net(12*(i-1) + 6) <= not N_net(12*(i-1) + 5);
		N_net(12*(i-1) + 7) <= not N_net(12*(i-1) + 6);
		N_net(12*(i-1) + 8) <= not N_net(12*(i-1) + 7);
		N_net(12*(i-1) + 9) <= not N_net(12*(i-1) + 8);
		N_net(12*(i-1) + 10) <= not N_net(12*(i-1) + 9);
		N_net(12*(i-1) + 11) <= not N_net(12*(i-1) + 10);
		N_net(12*(i-1) + 12) <= not N_net(12*(i-1) + 11);
		-- 1 multiplexer
		mux_in1(i) <= N_net(12*(i-1) + 12);
		mux_in0(i) <= mux_out(i-1);
		mux_out(i) <= (mux_in1(i) and s(i-1)) or (mux_in0(i) and (not s(i-1)));
	end generate inv;
	d_shadow <= mux_out(N);
	
	alarm <= q_shadow xor q_main;
end Structural;

