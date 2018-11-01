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
export PATH=$PATH:/cygdrive/c/intelFPGA_lite/17.0/quartus/bin64:/cygdrive/c/Xilinx/14.7/ISE_DS/ISE/bin/nt64
2. Executing 'make' in the top level directory lists the various make targets. Choose the appropriate target and execute make again. E.g. make de2
3. Grab generated bitstream (.sof/.pof/.jic for Altera, .bit for SakuraG) created inside the designs/leon3-($platform) and program on the board using platform specific programmer.
4. Connect the board to the host machine using the APB-UART pins and a USBtoUART convertor.

Detailed Pin mapping and functions of pins provided inside the each FPGA port subdirectory.

Steps for running sample programs on FAMEv2 after programming the FPGA board:
1. Sample software programs and the API library is available in software/. Sample programs: hello_world, coprocessor_test and gptimer_irq_gpio_test.
2. Navigate to the program directory and execute make. If the compiler is not found, install GRTools from the Gaisler website which includes the cross compiler for SPARC V8.
3. The GRTools package also includes the GRMON(a debug monitor that connects to the DSU). Navigate to the GRMON directory and copy the executable of the software program to this directory
4. Connect to the FAMEv2 design using the following command on Cygwin: ./grmon.exe -u -uart //./com7. Change the COM port in the command according to COM port occupied by the USBtoUART convertor.
5. Confirm whether the design is detected by using the GRMON output on the relevant designs/leon3-($platform) README. 
6. Ensure that DSUEN pin is asserted and DSUBRE pin is deasserted on the board. Both of these pins map to switches on the FPGA board.
6. Load the executable to memory using the command "load hello" on the GRMON terminal.
7. Execute the "run" command to run the executable on GRMON.
