#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define popsize 1000000
#define maxgens 50
#define runs 1
#define hole1 500
#define hole2 500
#define initsize 1000
#define BINS  500

int popdata[popsize], newpopdata[popsize], *pop = popdata, *newpop = newpopdata;
int sizes[maxgens][popsize];
int hist[maxgens][BINS];
int saves = 0;
int maxsize = 0;

/* Select a random individual and return it's length */
int sel()
{
 int i;
 i = pop[rand()%popsize];
 return(i);
}

/* Perform crossover */
int xover( int p1, int p2 )
{
  int x1, x2,r;
  x1 = rand()&p1;
  x2 = rand()&p2;
  r = (x1 + (p2-x2));
  return r;
}


double mean()
{
 int i;
 long int m = 0;
 for ( i = 0; i< popsize; i ++)
   m += pop[i];
 return( (double) m  / popsize );
}


/* Accumulate the size information for the runs 
and remember the biggest size */
void save(int g)
{
  int i;
  for(i=0;i<popsize;i++) {
    sizes[g][i]+=pop[i];
    maxsize = pop[i]>maxsize ? pop[i] : maxsize;
  }
  saves++;
}

/* Calculate the histograms and dump them to the file */
void output()
{
  FILE *fp;
  int i;
  int g;
  int b;
  int scale;
  int bin;
  int val;
  char fname[1024];
  int  tmpmax;

  printf("Calculating histograms (%d)\n", saves);
  scale = 1;
  tmpmax = maxsize;
  while(tmpmax > BINS) {
    tmpmax /=2;
    scale *= 2;
  }

  /* Make the histograms */
  for(g=0;g<saves;g++) {
    for(i=0;i<popsize;i++) {
      val = sizes[g][i];
      val /= runs;
      bin = val/scale;
      /*printf("g=%d, i=%d, val=%d, bin=%d, raw=%d\n", g,i,val,bin, sizes[g][i]);*/
      hist[g][bin]++;      
    }
  }

  for(g=0;g<saves;g++) {
    sprintf(fname, "hist_%d.dat", g);
    if((fp = fopen(fname, "w")) == NULL) {
      perror("Creating data file");
      fp = stdout;
    }
    
    for(b=0;b<BINS;b++) {
      fprintf(fp, "%d %d\n", b*scale, hist[g][b]);
    }
    if(fp != stdout) {
      fprintf(fp, "\n");
      fclose(fp);
    }
  }
}

void initialise()
{
  int i;
  pop=popdata;
  for ( i = 0; i< popsize; i ++) {
    /*pop[i] = 40 + ((i&1)*40);*/ /*two-point initial condition*/
    pop[i] = 1+(rand()&31); 
    /*    pop[i] = 1+(i%10);*/
  }
  saves = 0;
}

int main(int argc, char ** argv)
{
  int  i, g, r, *tmp;

  srand(time(NULL));
  for (r = 0; r <runs; r++ )
    {
      printf("# Run %d\n",r );
      initialise();
      for (g=0; g < maxgens; g ++)
	{
	  if ( maxgens <= 100 || g % (maxgens / 100) == 0 ) {
	    save(g);
	    printf("%d %g\n",g,mean());
	  }
	  for ( i = 0; i< popsize; i ++)
	    newpop[i] = xover(sel(),sel());
    
	  tmp = newpop;  newpop = pop; pop = tmp;
	}
    }
  output();
  return 0;
}
