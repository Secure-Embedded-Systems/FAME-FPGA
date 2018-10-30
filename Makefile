#include bin/Makefile

all: help

help:
	@echo 
	@echo "make de2	: start Quartus compilation for DE2-115 FPGA Platform"
	@echo "make de1	: start Quartus compilation for DE1-SOC FPGA Platform"
	@echo "make sakura	: start ISE compilation for SAKURA-G FPGA Platform"
	@echo
de2:
	cd designs/leon3-terasic-de2-115 && $(MAKE) quartus
de1:
	cd designs/leon3-terasic-de1 && $(MAKE) quartus
sakura:
	cd designs/leon3-sakura && $(MAKE) ise
