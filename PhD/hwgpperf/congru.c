#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(int argc, char ** argv)
{
  unsigned int r,r2;
  int i;
  int printValues=0;
  int printPattern=0;
  int doskip=0;
  int diehard=0;
  
  int skip;
  int n=1024;


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
  srand(time(NULL));
  for(i=0;i<n;i++) {
    if(!diehard) {
      r=rand();
      if(doskip) {
	for(skip=0;skip<32;skip++) {
	  rand();
	}
      }
      
      if(printValues) {
	r2=rand();
	printf("%lu %lu\n", r&0xff, r2&0xff);
      }
    } else {
      int j;
      unsigned long v;
      for(j=0;j<10;j++) {
	if(doskip) {
	  for(skip=0;skip<31;skip++) {
	    rand();
	  }
	}
	v=rand();
	//write(1,&v,sizeof(v));
	printf("%8.8X", v);
      }
      printf("\n");
    }
  }
  return 0;
}







