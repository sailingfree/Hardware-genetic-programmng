#include <stdio.h>
#include <stdlib.h>

#define XOVER 1
#define MUTATE 2
#define COPY 3

int  randMethod(int v)
{
#define mask1 0x1f
#define mask2 0xfc
#define mask3 (~mask1)
#define mask4 (~mask2)

  int v1, v2, v3, v4;
  int method;

  v1 = v&mask1;
  v2 = v&mask2;
  v3 = v&mask3;
  v4 = v&mask4;
  method = XOVER;   /* Default method */
  
  if(!v3)
    method = MUTATE;
  else if(!v4)
    method =  COPY;
  return method;
}


main()
{
  int i;
  int r;
  int v;

  int m =0, x= 0, c = 0;
  printf("mask1=0x%x mask2=0x%x mask3=0x%x mask4=0x%x\n", mask1, mask2, mask3, mask4);
  for(i=0;i<255;i++) {
    v = rand() & 0xff;
    v=i;
    r = randMethod(v);
    printf("%d, R=%d\n", v, r);

    switch(r) {
    case XOVER: x++; break;
    case COPY: c++;break;
    case MUTATE: m++; break;
    }
  }
  printf("X=%d, M=%d, C=%d\n", x,m,c);
}
