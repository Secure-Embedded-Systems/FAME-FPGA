include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

aes: aes.c
	$(CC) $(CFLAGS) -c aes.c -o aes.o
	$(CC) $(CFLAGS) -S aes.c -o aes.s
	$(CC) aes.o -o aes $(LDFLAGS) 

clean:
	rm -rf $(obj) aes *~ *.s *.o
