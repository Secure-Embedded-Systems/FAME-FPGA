
src=gptimer_irq_gpio_test.c


#src+= multest.c divtest.c grfpu_test.c fpu.c
#asm+= mulasm.S



obj = $(src:.c=.o)

LDFLAGS=-lm
CFLAGS=-O2 -DGRLIB_REPORTDEV_BASE=0x40000000
CC=sparc-elf-gcc
XDUMP=sparc-elf-objdump -dS
XCOPY=sparc-elf-objcopy
IHEXTOMEM=perl ../../../bin/ihex2mem.pl
MEMTOMEM=perl ../../../bin/mem2mem.pl
XARGS=-O ihex
XCFLAGS=-O2 -g -msoft-float
API_LIB=../API/lib/libfame.a 

gptimer_irq_gpio_test: $(obj)
	$(CC) -o $@ $^ $(API_LIB) $(LDFLAGS)

prog.ihex: gptimer_irq_gpio_test
	$(XCOPY) $(XARGS) $< prog.ihex

prog.mem: prog.ihex prog.S
	$(IHEXTOMEM) prog	
	$(MEMTOMEM) prog	

prog.S: gptimer_irq_gpio_test
	$(XDUMP) $< > prog.S

clean:
	rm -rf prog*.mem prog.exe prog.ihex prog.S $(obj) gptimer_irq_gpio_test
