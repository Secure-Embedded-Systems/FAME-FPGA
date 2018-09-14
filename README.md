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


UART Connections:
The FPGA communicate with GRMON using the AHBUART(Debug UART). The UART connections are mapped to FPGA pins as follows:
1. DE2-115 board: AHB_UART_RXD:GPIO[7], AHB_UART_TXD:GPIO[9], APB_UART_RXD:UART_RXD (DB9 connector), APB_UART_TXD:UART_TXD (DB9 connector)
2. DE1 SoC board: AHB_UART_RXD:GPIO_0[7], AHB_UART_TXD:GPIO_0[9], APB_UART_RXD:GPIO_0[27], APB_UART_TXD:GPIO_0[29]
3. SAKURA-G board: AHB_UART_RXD:GPIO[2], AHB_UART_TXD:GPIO[4], APB_UART_RXD:GPIO[6], APB_UART_TXD:GPIO[8]
