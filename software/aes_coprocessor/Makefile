
src=aes_coprocessor.c


#src+= multest.c divtest.c grfpu_test.c fpu.c
#asm+= mulasm.S

include ../make.swconfig

obj = $(src:.c=.o)

LDFLAGS=-lm
CFLAGS=-O2 -DGRLIB_REPORTDEV_BASE=0x40000000
IHEXTOMEM=perl ../../../bin/ihex2mem.pl
MEMTOMEM=perl ../../../bin/mem2mem.pl
XARGS=-O ihex
XCFLAGS=-O2 -g -msoft-float 

aes_coprocessor: $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)

prog.ihex: aes_coprocessor
	$(XCOPY) $(XARGS) $< prog.ihex

prog.mem: prog.ihex prog.S
	$(IHEXTOMEM) prog	
	$(MEMTOMEM) prog	

prog.S: aes_coprocessor
	$(XDUMP) $< > prog.S

clean:
	rm -rf prog*.mem prog.exe prog.ihex prog.S $(obj) aes_coprocessor
