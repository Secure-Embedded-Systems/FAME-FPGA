library ieee; 
use ieee.std_logic_1164.all;

library grlib; 
use grlib.amba.all; 
use grlib.devices.all;
use grlib.stdlib.all;

library gaisler; 
use gaisler.misc.all;

library grlib;
use grlib.amba.all;
use grlib.devices.all;

package emsensor is

	component apb_emsensor 
	generic (
		pindex : integer := 0;
		paddr : integer := 0;
		pmask : integer := 16#fff#
		--pirq     : integer := 0
		-- Add core-specific generics here
	);
		
	port (
		rst : in std_ulogic;
		clk : in std_ulogic;
		apbi : in apb_slv_in_type;
		apbo : out apb_slv_out_type;
		alarm_emsensor : out std_ulogic
		-- Add core-specific ports here		
		);
	end component;
	
	-- Add other component definitions
end;
