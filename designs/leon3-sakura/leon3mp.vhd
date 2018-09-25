------------------------------------------------------------------------------
--  LEON3 Demonstration design
--  Copyright (C) 2013 Aeroflex Gaisler
------------------------------------------------------------------------------
--  FAME v2 MAPPING TO SAKURA-G
--  by Secure Embedded Systems Virginia Tech
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library grlib;
use grlib.amba.all;
use grlib.stdlib.all;
use grlib.devices.all;
library techmap;
use techmap.gencomp.all;
use techmap.allclkgen.all;
library gaisler;
use gaisler.memctrl.all;
use gaisler.leon3.all;
use gaisler.uart.all;
use gaisler.misc.all;
use gaisler.jtag.all;
use gaisler.spi.all;
--pragma translate_off
use gaisler.sim.all;
--pragma translate_on
library esa;
use esa.memoryctrl.all;
use work.config.all;

library coprocessors; 
use coprocessors.aes.all; 
use coprocessors.keymill.all;

entity leon3mp is
  generic (
    fabtech  : integer := CFG_FABTECH;
    memtech  : integer := CFG_MEMTECH;
    padtech  : integer := CFG_PADTECH;
    clktech  : integer := CFG_CLKTECH;
    disas    : integer := CFG_DISAS;    
    dbguart  : integer := CFG_DUART;   
    pclow    : integer := CFG_PCLOW
    );
  port (
    clk             : in    std_ulogic; -- clock input
    clkout             : out    std_ulogic; -- output clock same as input clock
   
   -- Buttons & LEDs
    resetn    : in    std_ulogic; -- Reset button
    led             : out   std_logic_vector(3 downto 0);
    gpio             : inout   std_logic_vector(7 downto 0);
    switch             : in   std_logic_vector(3 downto 0);
	
    dsuen        : in std_ulogic;     
    dsubre       : in std_ulogic;    
    dsuact       : out std_ulogic;  
    errorn       : out std_ulogic;  
    
     -- RS232 APB Uart 
     PeriphUart_RX : in std_logic;
     PeriphUart_TX : out std_logic;
  
    -- USB-RS232 interface
    DebugUart_RX            : in    std_logic;
    DebugUart_TX            : out   std_logic;

    -- spi memory
    spi_miso    : in  std_ulogic;
    spi_mosi    : out std_ulogic;
    spi_sck     : out std_ulogic;
    spi_csn  : out std_ulogic;

    alarm1_emsensor: out std_ulogic;
    alarm2_aesenc: out std_ulogic;
    alarm3_aesdec: out std_ulogic;
    triggerout: out std_logic_vector(3 downto 0);
    alarmin : in std_ulogic;
	 alarmout : out std_ulogic;
	extsave : in std_ulogic;
     boot_select: in std_ulogic;
    wdogn           : out   std_logic
  );
end;

architecture rtl of leon3mp is
  signal vcc : std_logic;
  signal gnd : std_logic;

  signal alarm_combined : std_logic_vector(3 downto 0);

  -- Memory controler signals
  signal memi : memory_in_type;
  signal memo : memory_out_type;
  signal wpo  : wprot_out_type;
  
  -- AMBA bus signals
  signal apbi  : apb_slv_in_type;
  signal apbo  : apb_slv_out_vector := (others => apb_none);
  signal ahbsi : ahb_slv_in_type;
  signal ahbso : ahb_slv_out_vector := (others => ahbs_none);
  signal ahbmi : ahb_mst_in_type;
  signal ahbmo : ahb_mst_out_vector := (others => ahbm_none);

  signal cgi : clkgen_in_type;
  signal cgo : clkgen_out_type;
  
  signal gpioi : gpio_in_type;
  signal gpioo : gpio_out_type;

  signal u1i, dui : uart_in_type;
  signal u1o, duo : uart_out_type;

  signal irqi : irq_in_vector(0 to 0);
  signal irqo : irq_out_vector(0 to 0);

  signal dbgi : l3_debug_in_vector(0 to 0);
  signal dbgo : l3_debug_out_vector(0 to 0);

  signal dsui : dsu_in_type;
  signal dsuo : dsu_out_type;
  signal ndsuact : std_ulogic;

  signal gpti : gptimer_in_type;
  signal gpto : gptimer_out_type;

  signal spmi : spimctrl_in_type;
  signal spmo : spimctrl_out_type;

  signal alarm_aes_encrypt : std_ulogic;
  signal alarm_aes_decrypt : std_ulogic;
  signal alarm_emsensor : std_ulogic;

  signal clkm, rstn, clk24out_r         : std_ulogic;
  signal tck, tms, tdi, tdo : std_ulogic;
  signal rstraw             : std_logic;
  signal lock               : std_logic;

  attribute keep                     : boolean;
  attribute keep of lock             : signal is true;
  attribute keep of clkm             : signal is true;

  constant clock_mult : integer := 20;      -- Clock multiplier
  constant clock_div  : integer := 20;      -- Clock divider
  constant BOARD_FREQ : integer := 48000;  -- CLK input frequency in KHz
  constant CPU_FREQ   : integer := BOARD_FREQ * clock_mult / clock_div;  -- CPU freq in KHz
  
begin

----------------------------------------------------------------------
---  Reset and Clock generation  -------------------------------------
----------------------------------------------------------------------
  
  vcc <= '1';
  gnd <= '0';
  clkm <= clk24out_r;
  rstn <= not RESETN;

  cgi.pllctrl <= "00";
  cgi.pllrst <= rstraw;
  alarm_combined(0) <= alarmin;
  alarm_combined(1) <= '0';
  alarm_combined(2) <= '0';
  alarm_combined(3) <= '0';
---------------------------------------------------------------------- 
---  AHB CONTROLLER --------------------------------------------------
----------------------------------------------------------------------

  ahb0 : ahbctrl
    generic map (ioen => 1,
		 nahbm => 4,
		 nahbs => 8)
    port map (rstn, clkm, ahbmi, ahbmo, ahbsi, ahbso);

----------------------------------------------------------------------
---  LEON3 processor and DSU -----------------------------------------
----------------------------------------------------------------------

  -- LEON3 processor
  u0 : leon3s
    generic map (hindex=>0, 
		 fabtech=>fabtech, 
	         memtech=>memtech,
	         nwindows=>8, 
	         dsu=>CFG_DSU,       
	         fpu=>0,       
	         v8=>0,        
	         cp=>0,        
	         mac=>0,       
	         pclow=>CFG_PCLOW,    
	         notag=>CFG_NOTAG,    
	         nwp=>CFG_NWP,       
	         icen=>CFG_ICEN,      
	         irepl=>CFG_IREPL,     
	         isets=>CFG_ISETS,     
	         ilinesize=>CFG_ILINE,
	         isetsize=>CFG_ISETSZ,  
	         isetlock=>CFG_ILOCK,  
	         dcen=>CFG_DCEN,      
	         drepl=>CFG_DREPL,     
	         dsets=>CFG_DSETS,     
	         dlinesize=>CFG_DLINE, 
	         dsetsize=>CFG_DSETSZ,  
	         dsetlock=>CFG_DLOCK,  
	         dsnoop=>CFG_DSNOOP,    
	         ilram=>CFG_ILRAMEN,     
	         ilramsize=>CFG_ILRAMSZ, 
	         ilramstart=>CFG_ILRAMADDR,
	         dlram=>CFG_DLRAMEN, 
	         dlramsize=>CFG_DLRAMSZ,
	         dlramstart=>CFG_DLRAMADDR,
	         mmuen=>CFG_MMUEN,     
                 itlbnum=> 8,  
                 tlb_type=> 2,  
                 tlb_rep=>  0 ,
                 lddel=>CFG_LDDEL,     
                 disas=>CFG_DISAS,     
                 tbuf=> 1,     
                 pwd=>CFG_PWD,       
                 svt=>CFG_SVT,       
                 rstaddr => CFG_RSTADDR,   
                 bp=>CFG_BP)        

	port map        (clk             => clkm, 
                         rstn            => rstn, 
                         ahbi            => ahbmi, 
                         ahbo            => ahbmo(0), 
                         ahbsi           => ahbsi, 
                         ahbso           => ahbso, 
                         irqi            => irqi(0), 
                         irqo            => irqo(0), 
                         dbgi            => dbgi(0), 
                         dbgo            => dbgo(0), 
                         clkout          => clkout, 
                         alarmin         => alarm_combined, 
                         alarmout        => alarmout, 
                         alarm1_emsensor => alarm_emsensor, 
                         alarm2_aesenc   => alarm_aes_encrypt, 
                         alarm3_aesdec   => alarm_aes_decrypt, 
                         triggerout      => triggerout, 
                         extsave         => '0', 
                         boot_select     => boot_select);
   
    errorn <= dbgo(0).error ;
	 
  -- LEON3 Debug Support Unit    
  dsu0 : dsu3
    generic map (hindex => 2,
		ncpu => 1,
		tech => memtech,
		irq => 0,
		kbytes => 0)
    port map (		 rst   		=> rstn, 
    			 clk   		=> clkm,  
    			 ahbmi 		=> ahbmi,
    			 ahbsi 		=> ahbsi,
    			 ahbso 		=> ahbso(2), 
    			 dbgi  		=> dbgo,  
    			 dbgo  		=> dbgi,
    			 dsui  		=> dsui,
    			 dsuo  		=> dsuo);
  
 
  dsui.enable <= dsuen;
  dsui.break <= dsubre;
  dsuact <= dsuo.active;
  
  -- Debug UART
  dcom0 : ahbuart 
    generic map (hindex => 1,
		 pindex => 4,
		 paddr => 7)
    port map (		rst   => rstn,       
    			clk   => clkm,       
    			uarti => dui,        
    			uarto => duo,        
    			apbi  => apbi,       
    			apbo  => apbo(4),    
    			ahbi  => ahbmi,      
    			ahbo  => ahbmo(1));  	


  dsurx_pad : inpad generic map (tech  => padtech) port map (DebugUart_RX, dui.rxd);
  dsutx_pad : outpad generic map (tech => padtech) port map (DebugUart_TX, duo.txd);
  --led(0) <= not dui.rxd;
  --led(1) <= not duo.txd;

  ahbjtag0 : ahbjtag 
    generic map(tech => fabtech,
		hindex => 3)
    port map(		rst    		=>rstn,         
    			clk         	=>clkm,
    			tck         	=>tck,
    			tms         	=>tms,
    			tdi         	=>tdi,
    			tdo         	=>tdo,
    			ahbi        	=>ahbmi,
    			ahbo        	=>ahbmo(3),
    			tapo_tck    	=>open,  
    			tapo_tdi    	=>open,  
    			tapo_inst   	=>open,  
    			tapo_rst    	=>open,  
    			tapo_capt   	=>open,  
    			tapo_shft   	=>open,  
    			tapo_upd    	=>open,  
    			tapi_tdo    	=>gnd);  
 


-----------------------------------------------------------------------
---  AHB ROM ----------------------------------------------------------
-----------------------------------------------------------------------

  ahbrom0 : entity work.ahbrom
   generic map ( hindex => 6,
		 haddr => CFG_AHBRODDR,
		 pipe => CFG_AHBROPIP)
   port map ( 		 rst			=>rstn,
			 clk			=>clkm,
			 ahbsi			=>ahbsi,
			 ahbso			=>ahbso(6));
	
-----------------------------------------------------------------------
---  AHB RAM ----------------------------------------------------------
-----------------------------------------------------------------------
  ahbram0 : ahbram 
   generic map ( hindex => 7,
		 haddr => CFG_AHBRADDR,
  		 tech => CFG_MEMTECH,
		 pipe => CFG_AHBRPIPE,
		 kbytes => CFG_AHBRSZ)
   port map ( 		rst 		=>rstn,
	 		clk 		=>clkm,
			ahbsi 		=>ahbsi,
			ahbso 		=>ahbso(7));
  
----------------------------------------------------------------------
---  APB Bridge and various periherals -------------------------------
----------------------------------------------------------------------

  apb0 : apbctrl       -- APB Bridge
    generic map ( hindex => 1,
		 haddr => CFG_APBADDR)
    port map (		 rst			=>rstn,
			 clk			=>clkm,
			 ahbi			=>ahbsi,
			 ahbo			=>ahbso(1),
			 apbi			=>apbi,
			 apbo			=>apbo);

  irqctrl0 : irqmp     -- Interrupt controller
    generic map ( pindex => 2,
		 paddr => 2,
		 ncpu => 1)
    port map (		 rst			=>rstn,
			 clk			=>clkm,
			 apbi			=>apbi,
			 apbo			=>apbo(2),
			 irqi			=>irqo,
			 irqo			=>irqi);

  uart1 : apbuart      -- UART 1
    generic map ( pindex   => 1,
		  paddr => 1,
		  pirq => 2,
		  console => 1,
		  fifosize => CFG_UART1_FIFO)
    port map (		 rst			=>rstn,
			 clk			=>clkm,
			 apbi			=>apbi,
			 apbo			=>apbo(1),
			 uarti			=>u1i,
			 uarto			=>u1o);
  u1i.rxd    <= PeriphUart_RX;
  u1i.ctsn   <= '0';
  u1i.extclk <= '0';
  PeriphUart_TX       <= u1o.txd;
  
  --gpio0 : generate -- GR GPIO unit
  grgpio0: grgpio
   generic map( 	 pindex => 5,
			 paddr => 5,
			 imask => CFG_GRGPIO_IMASK,
			 nbits => 8)
   port map( 		 rst			=>rstn,
			 clk			=>clkm,
			 apbi			=>apbi,
			 apbo			=>apbo(5),
			 gpioi			=>gpioi,
			 gpioo			=>gpioo);
   pio_pads : for i in 0 to 7 generate
   pio_pad : iopad generic map (tech => padtech)
   port map ( 		pad			=>gpio(i),
		 	i			=>gpioo.dout(i),
			en			=>gpioo.oen(i),
			o			=>gpioi.din(i));
  end generate;

-----------------------------------------------------------------------
-- TIMER ----------------------
-----------------------------------------------------------------------
  gpt : if CFG_GPT_ENABLE /= 0 generate
    gptimer0 : gptimer      -- timer unit
      generic map ( 	pindex => 6,
		 	paddr => 6,
			pirq => CFG_GPT_IRQ,
       			sepirq => CFG_GPT_SEPIRQ, 
			sbits => CFG_GPT_SW, 
			ntimers => CFG_GPT_NTIM,
       			nbits => CFG_GPT_TW, 
			wdog => CFG_GPT_WDOGEN*CFG_GPT_WDOG)
      port map (	rst 			=>rstn, 
			clk			=>clkm, 
			apbi			=>apbi, 
			apbo			=>apbo(6), 
			gpti			=>gpti, 
			gpto			=>gpto);
    gpti.dhalt 	<= dsuo.tstop; 
    gpti.extclk <= '0';
    wdogn 	<= gpto.wdogn;
  end generate;
  notim : if CFG_GPT_ENABLE = 0 generate apbo(6) <= apb_none; end generate;

-----------------------------------------------------------------------
--  COPROCESSORS ----------------------
-----------------------------------------------------------------------

  cp1 : apb_aes      -- AES
      generic map (	pindex => 12, 
			paddr => 16#130#, 
			pmask => 16#FF0#)
      port map (	rst			=>rstn, 
			clk			=>clk, 
			apbi			=>apbi, 
			apbo			=>apbo(12));
 
  cp2 : apb_keymill_vlog      -- KEYMILL
          generic map (	pindex => 13, 
			paddr => 16#140#, 
			pmask => 16#FF0#)
          port map (	rst			=>rstn, 
			clk			=>clk, 
			apbi			=>apbi, 
			apbo			=>apbo(13));



  spimc: if CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 1 generate
    spimctrl0 : spimctrl        -- SPI Memory Controller
      generic map (hindex => 5, hirq => 5, faddr => 16#100#, fmask => 16#ff0#,
                   ioaddr => 16#002#, iomask => 16#fff#,
                   spliten => CFG_SPLIT, oepol  => 0,
                   sdcard => CFG_SPIMCTRL_SDCARD,
                   readcmd => CFG_SPIMCTRL_READCMD,
                   dummybyte => CFG_SPIMCTRL_DUMMYBYTE,
                   dualoutput => CFG_SPIMCTRL_DUALOUTPUT,
                   scaler => CFG_SPIMCTRL_SCALER,
                   altscaler => CFG_SPIMCTRL_ASCALER,
                   pwrupcnt => CFG_SPIMCTRL_PWRUPCNT)
      port map (rstn, clkm, ahbsi, ahbso(5), spmi, spmo);


    -- MISO is shared with Flash data 0
    spmi.miso <= spi_miso;
    spi_mosi <= spmo.mosi;
    spi_sck <= spmo.sck;
    spi_csn <= spmo.csn;
    --clkout <= clk;
  end generate;

  nospimc: if ((CFG_SPICTRL_ENABLE = 0 and CFG_SPIMCTRL = 0) or
              (CFG_SPICTRL_ENABLE = 1 and CFG_SPIMCTRL = 1) or
              (CFG_SPICTRL_ENABLE = 1 and CFG_SPIMCTRL = 0)) generate
   --spi_mosi <= '0';
   --spi_sck <= '0';
   --spi_csn <= '1';
   spi_mosi <= alarmin;
   spi_sck <= PeriphUart_RX;
   spi_csn <= extsave;
   clkout <= spi_miso;
  end generate;

  clk24 : process (clk) 
  begin 
    if rising_edge(clk) then 
	clk24out_r <= not clk24out_r;
   end if;
  end process;
	
end rtl;
