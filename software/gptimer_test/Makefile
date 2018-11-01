include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/inc

timerdemo: timerdemo.c
	$(CC) $(CFLAGS) -c timerdemo.c -o timerdemo.o
	$(CC) $(CFLAGS) -S timerdemo.c -o timerdemo.s
	$(CC) timerdemo.o -o timerdemo $(LDFLAGS) 

clean:
	rm -rf $(obj) timerdemo *~ *.s *.o
