#include <stdlib.h>
#include <stdio.h>
#include <math.h>
/*
----------------------------------------------------------------------
By Bob Jenkins, amateur generator of random number generators, 1994
If you find a bug, you'll have to fix it yourself.

Run chi-square tests on a random number generator rng.
  uni -- are values uniform; do they occur equally often
  gap -- are the gaps between values of the expected length
  run -- how long are strictly increasing subsequences?
  njk -- uni, but by conglomerating NJKBIT of multiple values.
  njg -- gap, but by conglomerating NJKBIT of multiple values.

Instructions: If "get" is within "expect +- 3*sqrt(expect)", then the
  tests pass.  Reduce ALPHA, OMEGA until the tests fail.  Increase
  MYRUNS until the tests fail.  Where does the bias come from?
----------------------------------------------------------------------
*/

typedef  unsigned      char u1;   /* u1 is unsigned, 1 byte  */
typedef  unsigned long int  u4;   /* u4 is unsigned, 4 bytes */
typedef  unsigned long long u8;   /* u8 is unsigned, 8 bytes */
static FILE *xx;

#define ALPHA 4                   /* arrays of size 2^alpha */
#define OMEGA 4                     /* omega bits per value */
#define OMICRON 4    /* number of bits in values tested */
#define RSIZE  ((u4)4)    /* maximum run length to look for */
#define NJKBIT 0x1 /* which bit to conglomerate for njk,njg */
#define SHIFT 2                    /* amount of barrelshift */
#define SIZE  ((u4)1<<ALPHA)
#define WSIZE ((u4)1<<OMEGA)
#define USIZE ((u4)1<<OMICRON)
#define GSIZE (SIZE<<2)
#define WMASK (WSIZE-1)
#define UMASK (USIZE-1)
#define MYRUNS (((u8)1)<<18)

static u4 cyca, cycb;
static u4 mem[SIZE];              /* m: pool of secret memory */
static u4 ss[SIZE];
static u4 tt[SIZE];
static u4 rsl[SIZE];              /* r: results given to the user */
static u4 cycm[SIZE];
static u4 iii,jjj,kkk,lll;

static u8     unidata[USIZE];
static u8     njkdata[USIZE];
static double uniprob[USIZE];

static u8     gapdata[GSIZE];
static u4     gaplast[USIZE];
static u4     gapoff;
static u8     gap2data[GSIZE];
static u4     gap2last[USIZE];
static u4     gap2off;
static double gapprob[GSIZE];

static u8     rundata[RSIZE];
static double runprob[RSIZE];
static u4     rcount, rlast;


/* 
---------------------------------------------------------------------
PRNG() is a reliable outside source of random numbers
---------------------------------------------------------------------
*/

#define NNL (8)
#define NNN ((u4)1<<NNL)
static u4 mem2[NNN];              /* m: pool of secret memory */
static u4 rsl2[NNN];              /* r: results given to the user */
static u4 prngi=(NNN-1);                /* counter */

#define rotate(a)  (((a)<<19)^((a)>>(32-19)))
#define f(mm,x)    (*(u4 *)(((u1 *)(mm))+((x)&(4*NNN-4))))

static void prng_loop(mm,rr,aa,bb)
u4 *mm;   /* secret memory             */
u4 *rr;   /* results given to the user */
u4 *aa;  /* accumulator */
u4 *bb;  /* the old m[SIZE-1] */
{
  register u4 a,b,i,x,y;
 
  a = *aa;  b = *bb;
  for (i=0; i<NNN; ++i)
  {
    x = mm[i];
    a = rotate(a) + mm[((i+(NNN/2))&(NNN-1))];
    mm[i] = y = f(mm,x) + a + b;
    rr[i] = b = f(mm,(y>>NNL)) + x;
  }
  *bb = b;  *aa = a;
}
 

#define  prng(i,m,r,aa,bb) \
  if (1) { \
    if (++prngi>=NNN) {prng_loop((m),(r),(aa),(bb)); prngi=0;} \
    (i) = (r)[prngi]; \
  }




/*
------------------------------------------------------------------
Experimental RNG -- place your RNG here
Each call must fill rr[0..SIZE-1] with ALPHA-bit values.
------------------------------------------------------------------
*/
static void rng(mm,rr,aa,bb,cc,m2,r2,aa2,bb2,ss,tt)
u4 *mm;   /* secret memory             */
u4 *rr;   /* results given to the user */
u4 *aa;  /* accumulator */
u4 *bb;  /* the old m[SIZE-1] */
u4 *cc;  /* the old m[SIZE-2] */
u4 *m2;   /* secret memory             */
u4 *r2;   /* results given to the user */
u4 *aa2;  /* accumulator */
u4 *bb2;  /* the old m[SIZE-1] */
u4 *ss;   /* extra state */
u4 *tt;   /* more extra state */
{
  register u4 a,b,x,y,i;
  a = *aa; b = *bb;
  for (i=0; i<SIZE; ++i)
  {
    x = mm[i];
    a = (a + x)&(SIZE-1);
    y = mm[a];
    mm[a] = x;  mm[i] = y;
    rr[i] = mm[(a+i)&(SIZE-1)];
  }
  *bb = b; *aa = a;
#ifdef NEVER
     x = mm[i];
     a = ((a<<SHIFT)^(a>>(OMEGA-SHIFT))) & WMASK;
     a = (a+mm[(i+jjj)&(SIZE-1)]) & WMASK;
     mm[i] = (a+b) & WMASK;
     rr[i] = (b>>(OMEGA-OMICRON)) & UMASK;
     b = x;

     tt[i] = ss[i];
     ss[i] = (b>>(OMEGA-OMICRON)) & UMASK;
     rr[i] = (ss[i]-tt[(i+SIZE-1)&(SIZE-1)]) & UMASK;

     mm[i] = y = (b + a + mm[x&(SIZE-1)]) & WMASK;
     b = (x + mm[(y>>ALPHA)&(SIZE-1)]) & WMASK;
     x = mm[i];
     a = (a+x) & WMASK;
     y = mm[a];
     mm[i] = y; mm[a] = x;
     ss[i] = mm[(x+y)&(SIZE-1)];
  printf("%x%x%x%x%x%x%x%x %x %x %x %x %x\n",
          mm[0],mm[1],mm[2],mm[3],mm[4],mm[5],mm[6],mm[7],
          (u4)(mi-mm),a,b,*mi,*ri); 
		prng(z,m2,r2,aa2,bb2);                       /* get a random value z */
#endif
}

/*
------------------------------------------------------------------
cyc() assumes that the rng is a permutation, that is, the initial
state is guaranteed to be repeated.
cyc() relies on m, not r, so rng() needs to fill in m.
------------------------------------------------------------------
*/
static int  cyc( m, a, b )
u4 *m;  /* random numbers */
u4  a;
u4  b;
{
  int i;
  if (a != cyca) return 0;
  if (b != cycb) return 0;
  for (i=0; i<SIZE; ++i) if (m[i] != cycm[i]) return 0;
  return 1;
}

/*
------------------------------------------------------------------
This gathers statistics for njk and njg.  
Proposed by Niels Jo/rgen Kruse, hence the name.
Correlated values have OMICRON bits, just like normal values,
  except there is only one value per call to rng().  
If SIZE<OMICRON, then njk and njg results will be garbage.
------------------------------------------------------------------
*/
static void njk( r, rl, d, dl, d2, d2l)
u4 *r;  /* random numbers */
u4  rl; /* length of r */
u8 *d;  /* where to put measurements */
u4  dl; /* length of d */
u8 *d2;  /* where to put measurements */
u4  d2l; /* length of d */
{
  u4  i,j,x=0;
  for (i=0; i<OMICRON; ++i) x = (x<<1)|(!(r[i]&NJKBIT));
	x=r[iii];
	++d[x];
  j = (gap2off+i-1)-gap2last[x];
  if (j<d2l) ++d2[j];
  else ++d2[d2l-1];
  gap2last[x] = i+gap2off;
  gap2off = gap2off + 1;
}

/* How many times does each value appear */
static void uniform( r, rl, d, dl )
u4 *r;  /* random numbers */
u4  rl; /* length of r */
u8 *d;  /* where to put measurements */
u4  dl; /* length of d */
{
  u4  i;
  for (i=0; i<rl; ++i) ++d[r[i]];
}

static void uprob( prob, len)
double *prob;
u4      len;
{
  u4     i;
  double p=1/(double)len;

  for (i=0; i<len; ++i) prob[i]=p;
}


/* For each value, measure gaps between occurances of that value */
static void gap( r, rl, d, dl )
u4 *r;  /* random numbers */
u4  rl; /* length of r */
u8 *d;  /* where to put measurements */
u4  dl; /* length of d */
{
  register u4 i,j,x;
  
  for (i=0; i<rl; ++i)
  {
    if (r[i] < USIZE)
    {
      x = r[i];
      j = (gapoff+i-1)-gaplast[x];
      if (j<dl) ++d[j];
      else ++d[dl-1];
      gaplast[x] = i+gapoff;
    }
  }
  gapoff = gapoff + SIZE;
}

static void gprob( prob, len)
double *prob;
u4      len;
{
  register  u4     i,j,k;
  register  double P, R;
  double           z[16];

  P = 1.0/((double)USIZE);
  z[0] = (1-P);
  for (i=1; i<16; ++i) z[i] = z[i-1]*z[i-1];
  for (i=0; i<len; ++i)
  {
    for (R=P, k=0, j=i; j; j>>=1, ++k) if (j&1) R *= z[k];
    prob[i] = R;
  }
  prob[len-1] *= (1/P);
}



/* Count runs of strictly decreasing sequences */
static void run( r, rl, d, dl )
u4 *r;  /* random numbers */
u4  rl; /* length of r */
u8 *d;  /* where to put measurements */
u4  dl; /* length of d */
{
  u4 i,c,x;
  
  x = rlast; c = rcount;
  for (i=0; i<rl; ++i)
  {
    if (c > 1000) {c=0; x=r[i];}
    else if (x == r[i]) ;
    else if (x > r[i]) {++c; x=r[i];}
    else {if (c > dl-1) c=dl-1;   ++d[c]; c=1001;}
  }
  rcount = c; rlast = x;
}

static void rprob( prob, len)
double *prob;
u4      len;
{
   u4  i,j,k;

   prob[0] = 1;
   for (i=1; i<=RSIZE; ++i)
   prob[i] = prob[i-1]*((double)USIZE-i)/((i+1)*((double)USIZE-1));
   for (i=0; i<RSIZE-1; ++i)
   prob[i] -= prob[i+1];
}



/* If data[] is random with distribution prob[], the result should be
   len +- 3sqrt(len) unless len is really small */
static double chisquare( data, prob, len)
u8     *data;
double *prob;
u4      len;
{
  register u4     i,j,k;
  register double V=0, S=0, Q, R;

  for (i=0; i<len; ++i) S += data[i];
  for (i=0; i<len; ++i)
  {
    R = S*prob[i];
    Q = ((double)data[i] - R);
    V += (Q*Q)/R;
  }
  return V;
}

/*
------------------------------------------------------------------
Control -- initialize counters, run tests, and report results
------------------------------------------------------------------
*/
static void driver()
{
  u4     i,expected;
  u8     i8;
  u4     a=3,b=3,z=3,a2=3,b2=3;
  double actual;

  for (i=0; i<NNN; ++i)   mem2[i] = rsl2[i] = i;
  for (i=0; i<SIZE; ++i)  ss[i] = tt[i] = mem2[i] = mem[i];
  for (i=0; i<USIZE; ++i) unidata[i] = gaplast[i] = gap2last[i] = 0;
  for (i=0; i<USIZE; ++i) njkdata[i] = 0;
  for (i=0; i<GSIZE; ++i) gapdata[i] = gap2data[i] = 0;
  for (i=0; i<RSIZE; ++i) rundata[i] = 0;
  gapoff = gap2off = 1;
  rcount = rlast = 0;

  /* generate billions of bits */
  rng( mem, rsl, &a, &b, &z, mem2, rsl2, &a2, &b2, ss, tt);
  for (i=0; i<10; ++i) 
  {
    prng_loop(mem2,rsl2, &a2, &b2);
    rng( mem, rsl, &a, &b, &z, mem2, rsl2, &a2, &b2, ss, tt);
  }
  for (i=0; i<SIZE; ++i) cycm[i] = mem[i];
  cyca = a; cycb = b;
  for (i8=0; i8< MYRUNS; ++i8) 
  {
     rng( mem, rsl, &a, &b, &z, mem2, rsl2, &a2, &b2, ss, tt);
     gap( rsl, SIZE, gapdata, GSIZE);
     if (cyc(mem,a,b)) {printf("* "); break;}
#ifdef NEVER
     uniform( rsl, SIZE, unidata, USIZE);
     njk( rsl, SIZE, njkdata, USIZE, gap2data, GSIZE); 
     run( rsl, SIZE, rundata, RSIZE);
#endif
  }
/*  actual = chisquare( njkdata, uniprob, USIZE);
  printf("njk: expect %5ld  get %12.4f \n",USIZE-1, actual);
  for (i=0; i<USIZE; ++i) printf("%8ld ", njkdata[i]);
  printf("\n");
  actual = chisquare( unidata, uniprob, USIZE);
  printf("uni: expect %5ld  get %12.4f  chi %12.4f\n",
         USIZE-1, actual, (actual-(USIZE-1))/sqrt((float)(USIZE-1)));
  for (i=0; i<USIZE; ++i) 
  {  if (!(i&7)) printf("\n"); printf("%8ld ", unidata[i]);}
  printf("\n");
  printf("njg: expect %5ld  get %12.4f  chi %12.4f\n",
         GSIZE-1, actual, (actual-(GSIZE-1))/sqrt((float)(GSIZE-1)));
  for (i=0; i<GSIZE; ++i) printf("%d ", (u4)(gap2data[i]/gapprob[i]));
  printf("\n");
*/  actual = chisquare( gapdata, gapprob, GSIZE);
  printf("gap: expect %5ld  get %12.4f  chi %12.4f\n",
         GSIZE-1, actual, (actual-(GSIZE-1))/sqrt((float)(GSIZE-1)));
  for (i=0; i<GSIZE; ++i) 
  {if (!(i&7)) printf("\n");
   printf("%9.6f", (float)(gapdata[i]/(gapprob[i]*MYRUNS*SIZE)));}
  printf("\n");
/*  actual = chisquare( rundata, runprob, RSIZE);
  printf("run: expect %5ld  get %12.4f  chi %12.4f\n",
          RSIZE-1, actual, (actual-(RSIZE-1))/sqrt((float)(RSIZE-1)));
  printf("%ld %ld %ld %ld %ld %ld %ld %ld\n",
         rundata[0],rundata[1],rundata[2],rundata[3],rundata[4],
         rundata[5],rundata[6],rundata[7]);
*/
}

/*
------------------------------------------------------------------
Try different seeds
------------------------------------------------------------------
*/
int main()
{
  u4     i,j,k,expected;
  double actual;

  uprob( uniprob, USIZE);
  gprob( gapprob, GSIZE);
  rprob( runprob, USIZE);
  for (i=0; i<SIZE; ++i) mem[i] = SIZE-i-1;
  for (jjj=0; jjj<2; ++jjj)
    driver();
  return 1;
}
