CFLAGS=-c -Wall -O2
LIBS= -lm

all: arm-to-gnu emuio.o

arm-to-gnu: main.o emuio.o
	$(CC) main.o emuio.o $(LIBS) -o arm-to-gnu

main.o: main.c
	$(CC) $(CFLAGS) main.c

emuio.o: emuio.c
	$(CC) $(CFLAGS) emuio.c

clean:
	rm -rf *.o arm-to-gnu

