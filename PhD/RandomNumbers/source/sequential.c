/* Program to generate 10 MiB of data using a sequential 
   'Random' number generator */

#include <stdio.h>

main()
{
  int i,j;
  unsigned long val;

  val = 1;
  for(i =0;i<1024*1024;i++) {
    for(j=0;j<10;j++) {
      printf("%8.8x",val++);
    }
    printf("\n");
  }
}
