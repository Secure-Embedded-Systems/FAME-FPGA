LDFLAGS= -lm
CFLAGS= -O2 -Iinc

CC=sparc-elf-gcc
CCAR=sparc-elf-ar
XDUMP=sparc-elf-objdump -dS
XCOPY=sparc-elf-objcopy
IHEXTOMEM=perl ../../../bin/ihex2mem.pl
MEMTOMEM=perl ../../../bin/mem2mem.pl
XARGS=-O ihex
XCFLAGS=-O2 -g -msoft-float


src = src/gptimer.c src/aes_api.c src/gpio.c src/uart.c src/irqmp.c
header = inc/gptimer.h inc/aes_api.h inc/gpio.h inc/uart.h src/irqmp.h
obj = $(src:.c=.o)

src_GPTIMER = src/gptimer.c
header_GPTIMER = inc/gptimer.h
obj_GPTIMER = $(src_GPTIMER:.c=.o)

src_AES = src/aes_api.c
header_AES = inc/aes_api.h
obj_AES = $(src_AES:.c=.o)

src_GPIO = src/gpio.c
header_GPIO = inc/gpio.h
obj_GPIO = $(src_GPIO:.c=.o)

src_UART = src/uart.c
header_UART = inc/uart.h
obj_UART = $(src_UART:.c=.o)

src_IRQMP = src/irqmp.c
header_IRQMP = inc/irqmp.h
obj_IRQMP = $(src_IRQMP:.c=.o)


all:
	@echo "Targets: "
	@echo "  compile    Compile software packages"
	@echo "  clean      Remove intermediate files"

compile: libfame.a

GPTIMER: 
	 $(CC) -c -o $(obj_GPTIMER) $(CFLAGS) $(src_GPTIMER)

AES: 
	 $(CC) -c -o $(obj_AES) $(CFLAGS) $(src_AES)

KEYMILL: 
	 $(CC) -c -o $(obj_KEYMILL) $(CFLAGS) $(src_KEYMILL)

GPIO: 
	 $(CC) -c -o $(obj_GPIO) $(CFLAGS) $(src_GPIO)

UART: 
	 $(CC) -c -o $(obj_UART) $(CFLAGS) $(src_UART)

IRQMP:
	$(CC) -c -o $(obj_UART) $(CFLAGS) $(src_IRQMP)


libfame.a : $(obj)
	$(CCAR) r lib/$@ $(obj)
	
clean: 
	rm -rf src/*.o lib/*.a
