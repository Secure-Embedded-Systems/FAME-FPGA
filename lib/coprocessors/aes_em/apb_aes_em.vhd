library ieee; 
use ieee.std_logic_1164.all;

library grlib; 
use grlib.amba.all; 
use grlib.devices.all;
use grlib.stdlib.all;

library gaisler; 
use gaisler.misc.all;

entity apb_aes_em is
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
		alarm_aes_encrypt : out std_ulogic;
		alarm_aes_decrypt : out std_ulogic
		-- Add core-specific ports here		
		);
end;

architecture rtl of apb_aes_em is
	-- component to be interfaced to GRLIB
	component vlog_aes_em 
		generic (
			vpindex : integer := pindex;
			vpaddress : integer := paddr;
			vpmask : integer := pmask;
			-- some grlib-specific constants (just in case)
			vnapbslv : integer := NAPBSLV
			-- Add core-specific generics here
			);
		
		port (
			vrst : in std_ulogic;
			vclk : in std_ulogic;
			
			-- apb slave input
			vpsel        : in std_logic_vector(0 to vnapbslv-1);     -- slave select
			vpenable     : in std_ulogic;                           -- strobe
			vpaddr       : in std_logic_vector(31 downto 0);        -- address bus (byte)
			vpwrite      : in std_ulogic;                           -- write
			vpwdata      : in std_logic_vector(31 downto 0);        -- write data bus
			
			-- apb slave output
			vprdata      : out std_logic_vector(31 downto 0);        -- read data bus
			alarm_aes_encrypt : out std_ulogic;
			alarm_aes_decrypt : out std_ulogic
			
			-- Add core-specific ports
			);
	end component vlog_aes_em;
	
	-- plug&play information
	constant REVISION : integer := 0;
	constant PCONFIG : apb_config_type := (
		0 => ahb_device_reg (VENDOR_CONTRIB, CONTRIB_AES_EM , 0, REVISION, 0),
		1 => apb_iobar(paddr, pmask));
	
begin
	-- drive outputs
	apbo.pirq <= (others => '0'); -- No IRQ
	apbo.pindex <= pindex; -- VHDL generic
	apbo.pconfig <= PCONFIG; -- Config constant

	-- instantiate Verilog Component
	v0: vlog_aes_em
		port map(
			vrst          => rst,
			vclk          => clk,
			
			-- apb slave input
			vpsel        => apbi.psel,     -- slave select
			vpenable     => apbi.penable,        -- strobe
			vpaddr       => apbi.paddr,        -- address bus (byte)
			vpwrite      => apbi.pwrite,        -- write
			vpwdata      => apbi.pwdata,        -- write data bus
			
			-- apb slave output
			vprdata      => apbo.prdata,        -- read data bus
			alarm_aes_encrypt => alarm_aes_encrypt,
			alarm_aes_decrypt => alarm_aes_decrypt
			
			-- Add core-specific ports
			);
		
	-- boot message
	-- pragma translate_off
		bootmsg : report_version
			generic map ("vlog_example" & tost(pindex) &": Example core rev " & tost(REVISION));
	-- pragma translate_on
end;
