/* Implementation of a linear cellular automata random number generator */
/* Uses rule30. and a von-Neuman neighborhood toroidal network.  */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef  unsigned long Rbits;

#define  BMAX ((sizeof(Rbits)*32)-1)
#define  BIT_P1(b) (b==BMAX?0:(b+1))
#define  BIT_M1(b) (b==0?BMAX:(b-1))
#define  BIT(v,n)  (!!(v&(1<<n)))
#define  SBIT(v,n,b) (b ? (v|=(1<<n)):(v&=(~(1<<n))))
#define CABIT(ca,bit) ((BIT(ca,BIT_P1(bit))|BIT(ca,bit))^BIT(ca,BIT_M1(bit)))

void printBin(Rbits v, int len)
{
  int i;

  for(i=0;i<=len;i++) {
    printf("%c", BIT(v,i)?'*':' ');
  }
}

int ca()
{
  static Rbits v1 = 0x8000000;
  Rbits  v2;
  Rbits  r;
  int i;


  v2 = 0;

  for(i=0;i<=BMAX;i++) {
    int m;
    int e,w,x;
    e=BIT(v1,BIT_M1(i));
    w=BIT(v1,BIT_P1(i));
    x=BIT(v1,i);
    m = CABIT(v1,i);
    SBIT(v2,i,CABIT(v1,i));
#if 0
    printf("POST SBIT: i=%d, e=%d, w=%d, x= %d, m=0x%x, v2=0x%x\n", i, e,w,x,m, v2);
    printBin(v1,8);
    printf("\n");
			
    printBin(v2,8);
    printf("\n");
#endif			
  }
  r=v1;
  v1=v2;
  return r;
}

int main(int argc, char ** argv)
{
  Rbits r,r2;
  int i;
  int printValues=0;
  int printPattern=0;
  int doskip=0;
  int diehard=0;
  int n=1024*2;
  int skip;

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
	printf("Usage: %s [-v] [-p]\n", argv[0]);
	exit(1);
      }
      arg++;
    }
  }
  for(i=0;i<n;i++) {
    if(!diehard) {
      r=ca();
      if(doskip) {
	for(skip=0;skip<32;skip++) {
	  ca();
	}
      }
      if(printPattern) {
	printBin(r,sizeof(Rbits)*8);
      }
      
      if(printValues) {
	r2=ca();
	printf("%lu %lu", r, r2);
      }
      printf("\n");
    } else {
      int j;
      unsigned long v;
      for(j=0;j<10;j++) {
	if(doskip) {
	  for(skip=0;skip<31;skip++) {
	    ca();
	  }
	}
	v=ca();
	//write(1,&v,sizeof(v));
	printf("%8.8X", v);
      }
      printf("\n");
    }
  }
  return 0;
}






