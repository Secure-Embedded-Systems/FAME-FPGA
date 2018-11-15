include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

gpio: gpio.c
	$(CC) $(CFLAGS) -c gpio.c -o gpio.o
	$(CC) gpio.o -o gpio $(LDFLAGS)

clean:
	rm -rf $(obj) gpio *~ *.s *.o
