include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

hello: hello.c
	$(CC) $(CFLAGS) -c hello.c -o hello.o
	$(CC) $(CFLAGS) -S hello.c -o hello.s
	$(CC) hello.o -o hello $(LDFLAGS) 

clean:
	rm -rf $(obj) hello *~ *.s *.o
