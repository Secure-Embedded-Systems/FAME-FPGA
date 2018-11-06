include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

aesdemo: aesdemo.c
	$(CC) $(CFLAGS) -c aesdemo.c -o aesdemo.o
	$(CC) aesdemo.o -o aesdemo $(LDFLAGS)

clean:
	rm -rf $(obj) aesdemo *~ *.s *.o
