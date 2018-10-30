# FAME-FPGA
Ports of FAMEv2 design on various FPGA platforms

Currently three FPGA platforms are supported: Altera DE2-115, Altera DE1 SoC and SAKURA G.

Directory structure:
1. lib/ : Contains RTL for the FAMEv2 design.
2. designs/ : Contains board specific top level RTL and synthesis scripts. Each platform has a specific subdirectory.
3. software/ : Contains sample tests for peripherals and coprocessors and API library
4. bitstreams/ : Contains pre-compiled bitstreams for various platforms.

Steps to synthesize and run the Famev2 design on the FPGA using Linux bash/Cygwin:
1. Path of the compilation tool(Quartus/ISE) should be present in the PATH variable. If not, add it as follows by adding the following statement to .bashrc file:
export PATH=$PATH:/cygdrive/c/intelFPGA_lite/17.0/quartus/bin64
2. Executing 'make' in the top level directory lists the various make targets. Choose the appropriate target and execute make again. E.g. make de2
3. Grab generated bitstream (.sof/.pof/.jic for Altera, .bit for SakuraG) created inside the designs/leon3-($platform) and program on the board using platform specific programmer.

Detailed Pin mapping and functions of pins provided inside the each FPGA port subdirectory.
