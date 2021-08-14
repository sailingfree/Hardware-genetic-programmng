/* Simple crossover with flat landscape using a linear representation */
/* Generates a number of histogram files hist_x.dat */
/* Pete Martin and Riccardo Poli */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>

#define popsize 1024
#define maxgens 32
#define runs 1
#define initsize 32
#define BINS  500

#if defined UNIFORM
#define INIT(i) (1+(rand()%(initsize-1)))
#elif defined ONEPOINT
#define INIT(i) (initsize-1)/2
#elif defined TWOPOINT
#define INIT(i) (initsize+((i&1)*initsize))
#else
#error Please define the population init method -DUNIFORM, -DONEPOINT -DTWOPOINT
#endif

#if defined STANDARD
#define XOVER(p1,p2,x1,x2) (x1+(p2-x2))
#elif defined TRUNCATE
#define XOVER(p1,p2,x1,x2) (min((x1+(p2-x2)),(initsize-1)))
#elif defined LIMITED
#warning Limiting crossover
#define XOVER(p1,p2,x1,x2) (x1+(p2-x2))
#else
#error Please define the crossover type -DSTANDARD -DTRUNCATE -DLIMITED
#endif

int    avgxover, totalx;

int popdata[popsize], newpopdata[popsize], *pop = popdata, *newpop = newpopdata;
int min(int a, int b)
{
  return a<b ? a : b;
}

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

#if defined LIMITED
  do {
#endif
    x1 = rand() % p1;
    x2 = rand() % p2;
    r = XOVER(p1,p2,x1,x2);
#if defined LIMITED
  }  while(r>initsize-1);
  avgxover+=x1+x2;
  totalx+=2;
#endif

  return r;
}

void initialise()
{
  int i;
  pop=popdata;
  for ( i = 0; i< popsize; i ++) {
    pop[i] = INIT(i);
  }
}

void dump_sizes(void)
{
  int i;
  for(i=0;i<popsize;i++) {
    printf("%d ", pop[i]);
  }
  printf("\n");
}

/* Main routine */
int main(int argc, char ** argv)
{
  int  i, g, r, *tmp;
  unsigned long t;
  struct timeval tv;
  struct timezone tz;
  
  gettimeofday(&tv, &tz);
  t = tv.tv_usec + tv.tv_sec;

  srand(t);
  for (r = 0; r <runs; r++ )
    {
      initialise();
      for (g=0; g < maxgens; g ++)
	{
	  if ( maxgens <= 100 || g % (maxgens / 100) == 0 ) {
	    dump_sizes();
	  }
	  avgxover=totalx=0;
#if defined HWSIM
	  for ( i = 0; i< popsize; i++) {
	    int ind1;
	    int ind2;
	    int l1, l2;
	    int r1, r2;
	    int x1, x2;


	    ind1  = rand()%popsize;
	    do {
	      ind2 = rand()%popsize;
	    } while(ind1 == ind2);
#if defined LIMITED
	    do {
#endif
	      l1 = pop[ind1];
	      l2 = pop[ind2];
	      x1 = rand() % l1;
	      x2 = rand() % l2;
	      r1 = XOVER(l1,l2,x1,x2);
	      r2 = XOVER(l2,l1,x2,x1);
#if defined LIMITED
	    } while(r1>=initsize || r2>=initsize);
#endif
	    if(r1<initsize)
	      pop[ind1]=r1;
	    if(r2<initsize)
	      pop[ind2]=r2;
	    avgxover+=x1+x2;
	    totalx+=2;
	  }
#else
	  for ( i = 0; i< popsize; i++) {
	    newpop[i]=xover(sel(), sel());
	  }
	  tmp = newpop;  newpop = pop; pop = tmp;
#endif
	}
    }
  return 0;
}
