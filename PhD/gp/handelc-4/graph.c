/******************************************************************************
 * Produce a graph for program lengths
 ******************************************************************************/

#include <stdio.h>
#define MAXBINS 32
#define MAXY    16


void drawGraph(int *data, int len)
{
  int  bins[MAXBINS];
  int  binscale;
  int  maxval=0;
  int  b,i;
  int  max = 0;
  int  yscale = 1;
  int  y;
  int  d;
  int  tmplen;

  /* Clear the bin counters */
  for(i=0;i<MAXBINS;i++) {
    bins[i]=0;
  }

  /* Calculate the scale factor for the bins by finding the highest value
  * int the data set */
  binscale = 1;
  for(i=0;i<len;i++) {
    if(data[i]>= maxval) {
      maxval = data[i];
    }
  }
printf("maxval = %d\n", maxval);
  tmplen   = maxval;
  while(tmplen > MAXBINS) {
    tmplen /= 2;
    binscale *= 2;
  }
  printf("binscale = %d\n", binscale);

  /* Collect the data in the bins */
  for(d=0;d<len;d++) {
    b = data[d]/binscale;
    /*    printf("d=%d data=%d, binsace=%d,bin=%d\n", d, data[d], binscale, b);*/
    bins[b]++;
    if(bins[b]>max)
      max = bins[b];
  }
 
  /* Calculate the y scale to fit into MAXY steps */
  printf("max is %d\n", max);
  yscale = (max/MAXY);
  if(yscale < 1) { 
    yscale = 1;
  } else {
    if(yscale & 0x1) 
      yscale++;
  }

  printf("yscale = %d\n", yscale);

  /* Print the graph starting at the top */
  for(y=MAXY;y>=0;y--) {
    int limit = y*yscale;
    printf("%5d |", limit);
    for(i=0;i<MAXBINS;i++) {
      if(bins[i]>=limit && bins[i]!=0) {
	printf("*");
      }else {
	printf(" ");
      }
    }
    printf("\n");
  }
  printf("      +");
  for(i=0;i<MAXBINS;i++) {
    printf("-");
  }
  fflush(stdout);
}


#if DEBUGTEST
int data[1024];

int main(int argc, char ** argv)
{
  int i;
  srand(time(NULL));
  for(i=0;i<1024;i++) {
    data[i]=rand()%76;
  }
  drawGraph(data, 100);

}
#endif
