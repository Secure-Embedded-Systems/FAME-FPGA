include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include

testinstr: testinstr.c
	$(CC) $(CFLAGS) -c testinstr.c -o testinstr.o
	$(CC) $(CFLAGS) -S testinstr.c -o testinstr.s
	$(CC) testinstr.o -o testinstr $(LDFLAGS) 

clean:
	rm -rf $(obj) testinstr *~ *.s *.o
