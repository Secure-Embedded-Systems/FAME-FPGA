Design Directory for port of FAMEv2 to SAKURA-G board

Synthesis can be triggered using command "make ise"
A precompiled bitstream(leon3mp.bit) is provided.

Pin Mapping:

| FAMEv2 pin      | Function                               | SAKURA-G pin function |
|-----------------|----------------------------------------|-----------------------|
| clk             | Input clock                            | M_CLK_OSC div by 2    |
| DebugUart_RX    | AHBUART receive                        | GPIO[31]              |
| DebugUart_TX    | AHBUART transmit                       | GPIO[32]              |
| PeriphUart_RX   | APBUART receive                        | GPIO[27]              |
| PeriphUart_TX   | APBUART transmit                       | GPIO[28]              |
| RESETN          | Global Reset                           | SW3                   |
| dsuen           | Enable/Disable DSU                     | SW5.8                 |
| dsubre          | External Break signal for DSU          | SW5.7                 |
| errorn          | Error Signal from Leon3                | M_LED_10              |
| gpio[0]         | GPIO                                   | GPIO[1]               |
| gpio[1]         | GPIO                                   | GPIO[2]               |
| gpio[2]         | GPIO                                   | GPIO[3]               |
| gpio[3]         | GPIO                                   | GPIO[4]               |
| gpio[4]         | GPIO                                   | GPIO[5]               |
| gpio[5]         | GPIO                                   | GPIO[6]               |
| gpio[6]         | GPIO                                   | GPIO[7]               |
| gpio[7]         | GPIO                                   | GPIO[8]               |
| triggerout[0]   | TriggerOut from leon3                  | GPIO[17]              |
| triggerout[1]   | TriggerOut from leon3                  | GPIO[15]              |
| triggerout[2]   | TriggerOut from leon3                  | GPIO[13]              |
| triggerout[3]   | TriggerOut from leon3                  | GPIO[11]              |
| boot_select     | Boot from 0:AHBROM, 1:SPI              | SW5.1                 |
| alarmout        | Alarm Out from leon3 if fault detected | GPIO[18]              |

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
