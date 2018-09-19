Design Directory for port of FAMEv2 to Altera DE2-115 board

Pin Mapping:

| FAMEv2 pin      | Function                               | DE2 pin  | DE2 pin function |
|-----------------|----------------------------------------|----------|------------------|
| clkout          | Clock out from Leon3 for observation   | PIN_AE23 | SMA_CLKOUT       |
| RESETN          | Global Reset                           | PIN_R24  | KEY[3]           |
| clk             | Input clock                            | PIN_Y2   | CLOCK_50         |
| alarmout        | Alarm Out from leon3 if fault detected | PIN_H17  | LEDR[13]         |
| led[0]          | LED mapped to debugUART activity       | PIN_G19  | LEDR[0]          |
| led[1]          | LED mapped to debugUART activity       | PIN_F19  | LEDR[1]          |
| DebugUart_RX    | AHBUART receive                        | PIN_AE15 | GPIO[9]          |
| DebugUart_TX    | AHBUART transmit                       | PIN_AE16 | GPIO[7]          |
| PeriphUart_RX   | APBUART receive                        | PIN_AE24 | GPIO[27]         |
| PeriphUart_TX   | APBUART transmit                       | PIN_AE26 | GPIO[29]         |
| switch[0]       | Switch                                 | PIN_AB28 | SW[0]            |
| switch[1]       | Switch                                 | PIN_AC28 | SW[1]            |
| switch[2]       | Switch                                 | PIN_AC27 | SW[2]            |
| switch[3]       | Switch                                 | PIN_AD27 | SW[3]            |
| switch[4]       | Switch                                 | PIN_AB27 | SW[4]            |
| switch[5]       | Switch                                 | PIN_AC26 | SW[5]            |
| switch[6]       | Switch                                 | PIN_AD26 | SW[6]            |
| switch[7]       | Switch                                 | PIN_AB26 | SW[7]            |
| led[2]          | LED                                    | PIN_E19  | LEDR[2]          |
| led[3]          | LED                                    | PIN_F21  | LEDR[3]          |
| led[4]          | LED                                    | PIN_F18  | LEDR[4]          |
| led[5]          | LED                                    | PIN_E18  | LEDR[5]          |
| led[6]          | LED                                    | PIN_J19  | LEDR[6]          |
| led[7]          | LED                                    | PIN_H19  | LEDR[7]          |
| dsuact          | Check if DSU is active                 | PIN_H15  | LEDR[17]         |
| dsubre          | External Break signal for DSU          | PIN_Y24  | SW[16]           |
| gpio[0]         | GPIO                                   | PIN_AB22 | GPIO[0]          |
| gpio[1]         | GPIO                                   | PIN_AC15 | GPIO[1]          |
| gpio[2]         | GPIO                                   | PIN_AB21 | GPIO[2]          |
| gpio[3]         | GPIO                                   | PIN_Y17  | GPIO[3]          |
| gpio[4]         | GPIO                                   | PIN_AC21 | GPIO[4]          |
| gpio[5]         | GPIO                                   | PIN_Y16  | GPIO[5]          |
| gpio[6]         | GPIO                                   | PIN_AD21 | GPIO[6]          |
| gpio[7]         | GPIO                                   | PIN_AD15 | GPIO[8]          |
| alarmin         | Input Alarm for leon3                  | PIN_AA23 | SW[14]           |
| alarm3_aesdec   | Alarm Out from AES decrypt             | PIN_AD19 | GPIO[12]         |
| alarm2_aesenc   | Alarm Out from AES encrypt             | PIN_AF15 | GPIO[13]         |
| alarm1_emsensor | Alarm Out from emsensor                | PIN_AF24 | GPIO[14]         |
| triggerout[0]   | TriggerOut from leon3                  | PIN_AE21 | GPIO[15]         |
| triggerout[1]   | TriggerOut from leon3                  | PIN_AF25 | GPIO[16]         |
| triggerout[2]   | TriggerOut from leon3                  | PIN_AC22 | GPIO[17]         |
| triggerout[3]   | TriggerOut from leon3                  | PIN_AE22 | GPIO[18]         |
| dsuen           | Enable/Disable DSU                     | PIN_Y23  | SW[17]           |
| boot_select     | Boot from 0:AHBROM, 1:SPI              | PIN_AA22 | SW[15]           |
| error           | Error Signal from Leon3                | PIN_J17  | LEDR[8]          |


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

