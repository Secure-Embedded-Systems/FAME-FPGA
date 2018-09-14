library ieee; 
use ieee.std_logic_1164.all;

library grlib; 
use grlib.amba.all; 
use grlib.devices.all;
use grlib.stdlib.all;

library gaisler; 
use gaisler.misc.all;

entity apb_example is
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
		apbo : out apb_slv_out_type
		-- Add core-specific ports here		
		);
end;

architecture rtl of apb_example is
	constant REVISION : integer := 0;
	constant PCONFIG : apb_config_type := (
		0 => ahb_device_reg (VENDOR_CONTRIB, CONTRIB_VHDL_EXAMPLE, 0, REVISION, 0),
		1 => apb_iobar(paddr, pmask));
	
	type registers is record
		reg : std_logic_vector(31 downto 0);
	end record;
	
	-- signal declarations
	signal r, rin : registers;
	
begin
	comb : process(rst, r, apbi)
		variable readdata : std_logic_vector(31 downto 0);
		variable v : registers;
		variable irq : std_logic_vector(NAHBIRQ-1 downto 0);
	begin
		-- default value assignment
		v := r;
		--irq := (others => '0'); irq(pirq) := r.irq;
		
		-- register-read logic
		readdata := (others => '0');
		case apbi.paddr(4 downto 2) is
			when "000" => readdata := r.reg(31 downto 0);
			when others => null;
		end case;
		
		-- register-write logic
		if (apbi.psel(pindex) and apbi.penable and apbi.pwrite) = '1' then
			case apbi.paddr(4 downto 2) is
				when "000" => v.reg := apbi.pwdata;
				when others => null;
			end case;
		end if;
		
		-- system reset
		if rst = '0' then v.reg := (others => '0'); end if;
		
		-- update register inputs
		rin <= v;
		
		-- drive outputs
		apbo.prdata <= readdata; -- drive apb read bus
	end process;

	-- drive outputs
	apbo.pirq <= (others => '0'); -- No IRQ
	apbo.pindex <= pindex; -- VHDL generic
	apbo.pconfig <= PCONFIG; -- Config constant

	-- registers
	regs : process(clk)
		begin
			if rising_edge(clk) then r <= rin; end if;
		end process;
		
	-- boot message
	-- pragma translate_off
		bootmsg : report_version
			generic map ("apb_example" & tost(pindex) &": Example core rev " & tost(REVISION));
	-- pragma translate_on
end;
