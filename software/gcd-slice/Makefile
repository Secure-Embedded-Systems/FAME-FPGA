include ../make.swconfig

LDFLAGS=-L../API/lib -lfame
CFLAGS=-I../API/include -O2

all: gcd-slice plain

gcd-slice: main.c gcdtop_map_sorted_c.c
	$(CC) $(CFLAGS) -c gcdtop_map_sorted_c.c -o gcdtop_map_sorted_c.o
	$(CC) $(CFLAGS) -c main.c -o main.o
	$(CC) gcdtop_map_sorted_c.o main.o -o gcd-slice $(LDFLAGS)

plain: plain.c
	$(CC) $(CFLAGS) -c plain.c -o plain.o
	$(CC) plain.o -o plain $(LDFLAGS)

clean:
	rm -rf $(obj) gcd-slice plain *~ *.s *.o
