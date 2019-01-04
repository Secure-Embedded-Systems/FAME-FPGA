include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include -mcpu=leon3

sharing: sharing.c
	$(CC) $(CFLAGS) -c sharing.c -o sharing.o
	$(CC) $(CFLAGS) -S sharing.c -o sharing.s
	$(CC) sharing.o -o sharing $(LDFLAGS) 

clean:
	rm -rf $(obj) sharing *~ *.s *.o
