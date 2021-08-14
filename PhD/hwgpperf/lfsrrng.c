#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TAP2       1
#define TAP3       5
#define TAP4       6
#define TAP5       31

 

typedef unsigned int RandReg;
/*
 * Random number routines for a regular ANSI-C system
 */
RandReg randReg;    /* The register used for generating the number */
RandReg   lfsr(void)
{
 unsigned int bit0;
 RandReg  t2, t3, t4, t5;
 t2 = !!(randReg & (1LL<<TAP2));
 t3 = !!(randReg & (1LL<<TAP3));
 t4 = !!(randReg & (1LL<<TAP4));
 t5 = !!(randReg & (1LL<<TAP5));

 bit0 = t2^t3^t4^t5;
 randReg <<= 1;
 randReg |= bit0;

 return randReg;
}


int main(int argc, char ** argv)
{
  RandReg r,r2;
  int i;
  int printValues=0;
  int printPattern=0;
  int doskip=0;
  int diehard=0;
  
  int skip;
  int n=1024*2;


  if(argc>1) {
    int arg = 1;

    while(arg <= argc-1) {
      if(strcmp(argv[arg],"-v")==0){
	printValues=1;
      } else if(strcmp(argv[arg],"-p")==0) {
	printPattern=1;
      } else if(strcmp(argv[arg],"-s")==0) {
	doskip=1;
      } else if(strcmp(argv[arg],"-d")==0) {
	diehard=1;
	n=800000;
      } else {
	printf("Usage: %s [-v] [-d] [-p] [-s]\n", argv[0]);
	printf("\t-d output binary file for diehard\n");
	printf("\t-p print the values as a pattern\n");
	printf("\t-s skip 32 values\n");
	printf("\t-v print value pairs\n");
	exit(1);
      }
      arg++;
    }
  }
  randReg = time(NULL);
  for(i=0;i<n;i++) {
    if(!diehard) {
      r=lfsr();
      if(doskip) {
	for(skip=0;skip<32;skip++) {
	  lfsr();
	}
      }
      
      if(printValues) {
	r2=lfsr();
	printf("%lu %lu\n", r, r2);
      }
    } else {
      int j;
      unsigned long v;
      for(j=0;j<10;j++) {
	if(doskip) {
	  for(skip=0;skip<31;skip++) {
	    lfsr();
	  }
	}
	v=lfsr();
	//write(1,&v,sizeof(v));
	printf("%8.8X", v);
      }
      printf("\n");
    }
  }
  return 0;
}







