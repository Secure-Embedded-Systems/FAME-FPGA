
src=hello.c


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

hello: $(obj)
	$(CC) -o $@ $^ $(LDFLAGS)

prog.ihex: hello
	$(XCOPY) $(XARGS) $< prog.ihex

prog.mem: prog.ihex prog.S
	$(IHEXTOMEM) prog	
	$(MEMTOMEM) prog	

prog.S: hello
	$(XDUMP) $< > prog.S

clean:
	rm -rf prog*.mem prog.exe prog.ihex prog.S $(obj) hello
