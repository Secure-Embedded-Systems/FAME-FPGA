include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

keymilldemo: keymilldemo.c
	$(CC) $(CFLAGS) -c keymilldemo.c -o keymilldemo.o
	$(CC) keymilldemo.o -o keymilldemo $(LDFLAGS)

clean:
	rm -rf $(obj) keymilldemo *~ *.s *.o
