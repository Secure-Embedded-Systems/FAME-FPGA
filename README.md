# FAME-FPGA
Ports of FAMEv2 design on various FPGA platforms

Currently three FPGA platforms are supported: Altera DE2-115, Altera DE1 SoC and SAKURA G.

Directory structure:
1. lib/ : Contains RTL for the FAMEv2 design.
2. designs/ : Contains board specific top level RTL and synthesis scripts. Each platform has a specific subdirectory.
3. software/ : Contains leon3 specific software. An example helloworld and GPIO-LEDs test is included.

Steps to synthesize and run the famev2 design on the FPGA:
1. Navigate to relevant subdirectory in designs/.
2. For Altera designs trigger synthesis using command "make quartus".
3. For SakuraG board trigger synthesis using command "make ise".
4. Grab generated bitstream(.sof for Altera, .bit for SakuraG) and program on the board using platform specific programmer.
5. SakuraG board needs the SPI memory of the Control FPGA to be programmed (for clock generation) along with the main FPGA. The design subdirectory contains a .mcs file for this.

Precompiled bitstreams are provided in the design directories.
Detailed Pin mapping and functions of pins provided inside the each FPGA port subdirectory. 



For SAKURA-G board: Reset is mapped to SW[3] and 48MHz oscillator clock is fed to ControlFPGA which divides the clock by two. Divided clock is provided to MainFPGA using SMA connector(M_CLK_EXT0_P).



3. SAKURA-G board: AHB_UART_RXD:GPIO[2], AHB_UART_TXD:GPIO[4], APB_UART_RXD:GPIO[6], APB_UART_TXD:GPIO[8]
