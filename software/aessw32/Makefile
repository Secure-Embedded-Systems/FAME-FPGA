include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

aes32: aes_core.c aes_drive.c
	$(CC) $(CFLAGS) -c aes_core.c -o aes_core.o
	$(CC) $(CFLAGS) -c aes_drive.c -o aes_drive.o
	$(CC) aes_core.o aes_drive.o -o aes32 $(LDFLAGS) 

clean:
	rm -rf $(obj) aes32 *~ *.s *.o
