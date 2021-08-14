# Makefile to build the PPC version of the program
hwgp-ppc : hwgp.c hwgph.h Makefile
	ppc-linux-gcc -o hwgp-ppc.o -c hwgp.c -I. -I/usr/include -DPSIM -DBOOLPARITY -DSINGLE -DLIMITED -DGENERATIONS=32 -DPOPSIZE=1024 -DMAXPROGLEN=128 -DPARITYBITS=6 -DMAXPAR=2
	ppc-linux-ld -o hwgp-ppc hwgp-ppc.o