module LEON3_SAKURA(

	//////////// CLOCK //////////
	input 		          		CLOCK_48,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// LED //////////
	output		     [9:0]		LED,

	//////////// SW //////////
	input 		     [8:1]		SW,

	inout 		    [35:0]		GPIO,
	input					spi_miso,
	output					spi_mosi,
	output					spi_sck,
	output					spi_csn
);

   wire [7:0] 				gpio;
   wire 					dsutx;
   wire 					dsurx;
   wire 					rxd1;
   wire 					txd1;
   wire [3:0] 				triggerout;
   wire 					wdogn;
   wire						led9inv;
   wire						led8inv;

	leon3mp top(.clk   (CLOCK_48),
		    .resetn(SW[3]),
		    .errorn(led10inv),
		    .DebugUart_TX (dsutx),
		    .DebugUart_RX (dsurx),
//		    .dsuact(LED[3]),
		    .dsuen(SW[8]),
		    .dsubre (SW[7]),
		    .PeriphUart_RX  (rxd1),
		    .PeriphUart_TX  (txd1),
		    .gpio  (gpio),
		    .alarmout(GPIO[18]),
		    .triggerout(triggerout),
		    .wdogn(led9inv),
		    .spi_miso(spi_miso),
		    .spi_mosi(spi_mosi),
		    .spi_sck(spi_sck),
		    .spi_csn(spi_csn),
		    .boot_select(SW[1]));

   assign LED[9]     = ~led9inv;
   
   assign GPIO[32] 	  = dsutx;
   assign LED[4]      = ~dsutx;
   
   assign dsurx        = GPIO[31];
   assign LED[5]      = ~GPIO[31];
   
   assign GPIO[28] = txd1;   
   assign LED[6]      = ~txd1;
   
   assign rxd1         = GPIO[27];
   assign LED[7]      = ~GPIO[27];  
   assign LED[8]	= ~led8inv;
//   assign LED[3:0]    = gpio[3:0];
   assign {GPIO[8],GPIO[7],GPIO[6],GPIO[5],GPIO[4],GPIO[3],GPIO[2],GPIO[1]} = gpio;

   assign {GPIO[11],GPIO[13],GPIO[15],GPIO[17]} = triggerout;

endmodule
