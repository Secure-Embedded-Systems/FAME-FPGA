
src= main.c gptimer.c

asm= regtest.S 

#src+= multest.c divtest.c grfpu_test.c fpu.c
#asm+= mulasm.S

include ../make.swconfig

obj = $(src:.c=.o)
obj += $(asm:.S=.o)

LDFLAGS= -lm
CFLAGS= -O2 -DGRLIB_REPORTDEV_BASE=0x80000600

IHEXTOMEM=perl ../../../bin/ihex2mem.pl
MEMTOMEM=perl ../../../bin/mem2mem.pl
XARGS=-O ihex
XCFLAGS=-O2 -g -msoft-float 

gptimertest: $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)

prog.ihex: gptimertest
	$(XCOPY) $(XARGS) $< prog.ihex

prog.mem: prog.ihex prog.S
	$(IHEXTOMEM) prog	
	$(MEMTOMEM) prog	

prog.S: gptimertest
	$(XDUMP) $< > prog.S

clean:
	rm -rf prog*.mem prog.exe prog.ihex prog.S $(obj) gptimertest
