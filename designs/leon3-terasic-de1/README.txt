Design Directory for port of FAMEv2 to Altera DE1 SOC board

Synthesis can be triggered using command "make quartus"
A precompiled bitstream(leon3mp_quartus.sof) is provided.

Pin Mapping:


| FAMEv2 pin      | Function                               | DE1 pin  | DE1 pin function |
|-----------------|----------------------------------------|----------|------------------|
| clk             | Input clock                            | PIN_AF14 | CLOCK_50         |
| DebugUart_RX    | AHBUART receive                        | PIN_AJ16 | GPIO_0 [9]       |
| DebugUart_TX    | AHBUART transmit                       | PIN_AJ19 | GPIO_0 [7]       |
| PeriphUart_RX   | APBUART receive                        | PIN_AF21 | GPIO_0 [29]      |
| PeriphUart_TX   | APBUART transmit                       | PIN_AE19 | GPIO_0 [27]      |
| RESETN          | Global Reset                           | PIN_Y16  | KEY[3]           |
| switch[0]       | Switch                                 | PIN_AB12 | SW[0]            |
| switch[1]       | Switch                                 | PIN_AC12 | SW[1]            |
| switch[2]       | Switch                                 | PIN_AF9  | SW[2]            |
| switch[3]       | Switch                                 | PIN_AF10 | SW[3]            |
| dsuen           | Enable/Disable DSU                     | PIN_AE12 | SW[9]            |
| dsubre          | External Break signal for DSU          | PIN_AD10 | SW[8]            |
| led[0]          | LED                                    | PIN_V16  | LEDR[0]          |
| led[1]          | LED                                    | PIN_W16  | LEDR[1]          |
| led[2]          | LED                                    | PIN_V17  | LEDR[2]          |
| led[3]          | LED                                    | PIN_V18  | LEDR[3]          |
| dsuact          | Check if DSU is active                 | PIN_W17  | LEDR[4]          |
| error           | Error Signal from Leon3                | PIN_W19  | LEDR[5]          |
| gpio[0]         | GPIO                                   | PIN_AB17 | GPIO_1[0]        |
| gpio[1]         | GPIO                                   | PIN_AA21 | GPIO_1[1]        |
| gpio[2]         | GPIO                                   | PIN_AB21 | GPIO_1[2]        |
| gpio[3]         | GPIO                                   | PIN_AC23 | GPIO_1[3]        |
| gpio[4]         | GPIO                                   | PIN_AD24 | GPIO_1[4]        |
| gpio[5]         | GPIO                                   | PIN_AE23 | GPIO_1[5]        |
| gpio[6]         | GPIO                                   | PIN_AE24 | GPIO_1[6]        |
| gpio[7]         | GPIO                                   | PIN_AF25 | GPIO_1[7]        |
| triggerout[0]   | TriggerOut from leon3                  | PIN_AF26 | GPIO_1 [8]       |
| triggerout[1]   | TriggerOut from leon3                  | PIN_AG25 | GPIO_1 [9]       |
| triggerout[2]   | TriggerOut from leon3                  | PIN_AG26 | GPIO_1[10]       |
| triggerout[3]   | TriggerOut from leon3                  | PIN_AH24 | GPIO_1 [11]      |
| clkout          | Clock out from Leon3 for observation   | PIN_AH27 | GPIO_1 [12]      |
| boot_select     | Boot from 0:AHBROM, 1:SPI              | PIN_AC9  | SW[7]            |
| alarmin         | Input Alarm for leon3                  | PIN_AE11 | SW[6]            |
| alarm3_aesdec   | Alarm Out from AES decrypt             | PIN_AJ27 | GPIO_1 [13]      |
| alarm2_aesenc   | Alarm Out from AES encrypt             | PIN_AK29 | GPIO_1 [14]      |
| alarm1_emsensor | Alarm Out from emsensor                | PIN_AK28 | GPIO_1 [15]      |
| alarmout        | Alarm Out from leon3 if fault detected | PIN_Y19  | LEDR[6]          |


GRMON output

$ ./grmon.exe -u -uart //./com7.

  GRMON2 LEON debug monitor v2.0.90 64-bit eval version

  Copyright (C) 2018 Cobham Gaisler - All rights reserved.
  For latest updates, go to http://www.gaisler.com/
  Comments or bug-reports to support@gaisler.com

  This eval version will expire on 22/09/2018

  GRLIB build version: 4144
  Detected frequency:  50 MHz

  Component                            Vendor
  LEON3 SPARC V8 Processor             Cobham Gaisler
  AHB Debug UART                       Cobham Gaisler
  JTAG Debug Link                      Cobham Gaisler
  AHB/APB Bridge                       Cobham Gaisler
  LEON3 Debug Support Unit             Cobham Gaisler
  Generic AHB ROM                      Cobham Gaisler
  Single-port AHB SRAM module          Cobham Gaisler
  Generic UART                         Cobham Gaisler
  Multi-processor Interrupt Ctrl.      Cobham Gaisler
  General Purpose I/O port             Cobham Gaisler
  Modular Timer Unit                   Cobham Gaisler
  Contributed core 2                   Various contributions
  Unknown device                       Various contributions
  Unknown device                       Various contributions
  Unknown device                       Various contributions
  Unknown device                       Various contributions

  Use command 'info sys' to print a detailed report of attached cores

grmon2> info sys
info sys
  cpu0      Cobham Gaisler  LEON3 SPARC V8 Processor
            AHB Master 0
  ahbuart0  Cobham Gaisler  AHB Debug UART
            AHB Master 1
            APB: 80000700 - 80000800
            Baudrate 115200, AHB frequency 50.00 MHz
  ahbjtag0  Cobham Gaisler  JTAG Debug Link
            AHB Master 3
  apbmst0   Cobham Gaisler  AHB/APB Bridge
            AHB: 80000000 - 80100000
  dsu0      Cobham Gaisler  LEON3 Debug Support Unit
            AHB: 90000000 - A0000000
            CPU0:  win 8, hwbp 2, itrace 64, lddel 1
                   stack pointer 0x4001fff0
                   icache 1 * 1 kB, 16 B/line
                   dcache 1 * 1 kB, 16 B/line
  adev5     Cobham Gaisler  Generic AHB ROM
            AHB: 00000000 - 00100000
  ahbram0   Cobham Gaisler  Single-port AHB SRAM module
            AHB: 40000000 - 40100000
            Static RAM: 128 kB @ 0x40000000
  uart0     Cobham Gaisler  Generic UART
            APB: 80000100 - 80000200
            IRQ: 2
            Baudrate 38343, FIFO debug mode
  irqmp0    Cobham Gaisler  Multi-processor Interrupt Ctrl.
            APB: 80000200 - 80000300
  gpio0     Cobham Gaisler  General Purpose I/O port
            APB: 80000300 - 80000400
  gptimer0  Cobham Gaisler  Modular Timer Unit
            APB: 80000600 - 80000700
            IRQ: 8
            32-bit scalar, 5 * 32-bit timers, divisor 50
  adev11    Various contributions  Contributed core 2
            APB: 80011000 - 80012000
  adev12    Various contributions  Unknown device
            APB: 80012000 - 80013000
  adev13    Various contributions  Unknown device
            APB: 80013000 - 80014000
  adev14    Various contributions  Unknown device
            APB: 80014000 - 80015000
  adev15    Various contributions  Unknown device
            APB: 80015000 - 80016000
