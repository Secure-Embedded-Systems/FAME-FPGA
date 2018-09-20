Design Directory for port of FAMEv2 to SAKURA-G board

Synthesis can be triggered using command "make ise"
A precompiled bitstream(leon3mp.bit) is provided.

Pin Mapping:

| FAMEv2 pin      | Function                               | SAKURA-G pin | SAKURA-G pin function |
|-----------------|----------------------------------------|--------------|-----------------------|
| clk             | Input clock                            | J1           | M_CLK_OSC             |
| DebugUart_RX    | AHBUART receive                        | A5           | GPIO[2]               |
| DebugUart_TX    | AHBUART transmit                       | A6           | GPIO[4]               |
| PeriphUart_RX   | APBUART receive                        | B8           | GPIO[6]               |
| PeriphUart_TX   | APBUART transmit                       | A9           | GPIO[8]               |
| RESETN          | Global Reset                           | D3           | SW3                   |
| switch[0]       | Switch                                 | B2           | SW5.1                 |
| switch[1]       | Switch                                 | B1           | SW5.2                 |
| switch[2]       | Switch                                 | C1           | SW5.3                 |
| switch[3]       | Switch                                 | D2           | SW5.4                 |
| dsuen           | Enable/Disable DSU                     | E1           | SW5.6                 |
| dsubre          | External Break signal for DSU          | F2           | SW5.7                 |
| led[0]          | LED                                    | M2           | M_LED_0               |
| led[1]          | LED                                    | N1           | M_LED_1               |
| dsuact          | Check if DSU is active                 | P1           | M_LED_2               |
| error           | Error Signal from Leon3                | R1           | M_LED_4               |
| gpio[0]         | GPIO                                   | A4           | GPIO[1]               |
| gpio[1]         | GPIO                                   | B6           | GPIO[3]               |
| gpio[2]         | GPIO                                   | A7           | GPIO[5]               |
| gpio[3]         | GPIO                                   | A8           | GPIO[7]               |
| gpio[4]         | GPIO                                   | C5           | GPIO[11]              |
| gpio[5]         | GPIO                                   | C6           | GPIO[12]              |
| gpio[6]         | GPIO                                   | C7           | GPIO[13]              |
| gpio[7]         | GPIO                                   | C17          | GPIO[14]              |
| triggerout[0]   | TriggerOut from leon3                  | A11          | GPIO[15]              |
| triggerout[1]   | TriggerOut from leon3                  | A12          | GPIO[16]              |
| triggerout[2]   | TriggerOut from leon3                  | B12          | GPIO[17]              |
| triggerout[3]   | TriggerOut from leon3                  | A13          | GPIO{18]              |
| clkout          | Clock out from Leon3 for observation   | P3           | GPIO_1 [12]           |
| boot_select     | Boot from 0:AHBROM, 1:SPI              | D1           | SW5.5                 |
| alarmin         | Input Alarm for leon3                  | F1           | SW5.8                 |
| alarm3_aesdec   | Alarm Out from AES decrypt             | A15          | GPIO[23]              |
| alarm2_aesenc   | Alarm Out from AES encrypt             | B14          | GPIO[22]              |
| alarm1_emsensor | Alarm Out from emsensor                | A14          | GPIO[21]              |
| alarmout        | Alarm Out from leon3 if fault detected | P2           | M_LED_3               |

GRMON output:
$ ./grmon.exe -u -uart //./com7.

  GRMON2 LEON debug monitor v2.0.90 64-bit eval version

  Copyright (C) 2018 Cobham Gaisler - All rights reserved.
  For latest updates, go to http://www.gaisler.com/
  Comments or bug-reports to support@gaisler.com

  This eval version will expire on 22/09/2018

  GRLIB build version: 4144
  Detected frequency:  24 MHz

  Component                            Vendor
  LEON3 SPARC V8 Processor             Cobham Gaisler
  AHB Debug UART                       Cobham Gaisler
  JTAG Debug Link                      Cobham Gaisler
  AHB/APB Bridge                       Cobham Gaisler
  LEON3 Debug Support Unit             Cobham Gaisler
  SPI Memory Controller                Cobham Gaisler
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
            Baudrate 115200, AHB frequency 24.00 MHz
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
  spim0     Cobham Gaisler  SPI Memory Controller
            AHB: FFF00200 - FFF00300
            AHB: 10000000 - 11000000
            IRQ: 5
            SPI memory device read command: 0x03
  adev6     Cobham Gaisler  Generic AHB ROM
            AHB: 00000000 - 00100000
  ahbram0   Cobham Gaisler  Single-port AHB SRAM module
            AHB: 40000000 - 40100000
            Static RAM: 128 kB @ 0x40000000
  uart0     Cobham Gaisler  Generic UART
            APB: 80000100 - 80000200
            IRQ: 2
            Baudrate 38461, FIFO debug mode
  irqmp0    Cobham Gaisler  Multi-processor Interrupt Ctrl.
            APB: 80000200 - 80000300
  gpio0     Cobham Gaisler  General Purpose I/O port
            APB: 80000300 - 80000400
  gptimer0  Cobham Gaisler  Modular Timer Unit
            APB: 80000600 - 80000700
            IRQ: 8
            32-bit scalar, 5 * 32-bit timers, divisor 24
  adev12    Various contributions  Contributed core 2
            APB: 80011000 - 80012000
  adev13    Various contributions  Unknown device
            APB: 80012000 - 80013000
  adev14    Various contributions  Unknown device
            APB: 80013000 - 80014000
  adev15    Various contributions  Unknown device
            APB: 80014000 - 80015000
  adev16    Various contributions  Unknown device
            APB: 80015000 - 80016000

grmon2>
