#ifndef HANDELC
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#else
#ifdef DEBUG
#include <stdlib.h>
#else
#include <stdlib.c>
#endif  /* DEBUG */
#endif  /* !HANDELC */

#include <hwgp.h>

/********************************************************************
 * Random number generator for Handelc
 *
 * Uses a shift register with taps and feedback
 ********************************************************************/
#ifdef HANDELC
#define RANDWIDTH  32  /* Number of bits in the generator 
                 			This is greater than the biggest number
                 			wanted from the generator*/ 
#endif

#define TAP1       0
#define TAP2       5
#define TAP3       9
#define TAP4       20
#define TAP5       30
#define TAP6       31

/* Define a type for the shift register */
#ifdef HANDELC
typedef unsigned int RANDWIDTH RandReg;  
#else
typedef unsigned long long     RandReg;
FILE *randlog;
#endif
 


/* Channel for getting the seed */
#ifdef HANDELC
#ifdef SIMULATE
chanin  RandReg seedIn with {infile = "c:/tmp/seed.dat"};
chanout RandReg randout with {outfile = "c:/tmp/random.dat"};
#endif
#endif

#ifdef HANDELC
/***************************************************************************
 * Name:     random
 *
 * Purpose:  Generate a pseudo-random number
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 *
 * Notes:    The number is stored in the static variable randReg
 * 
 ***************************************************************************/
RandReg randReg;    /* The register used for generating the number */
void random(void)
{
  static unsigned int BITW  oldbit0;
  unsigned int BITW bit0;
  par {
    bit0 = randReg[TAP1] ^ 
      randReg[TAP2] ^ 
      randReg[TAP3] ^ 
      randReg[TAP4] ^ 
      randReg[TAP5] ^ 
      randReg[TAP6];
    /* Shift by using all bits except top bit and adding bit 0 */
    randReg = randReg[RANDWIDTH-2:0]@oldbit0; 
    oldbit0=bit0;
  }
}

/***************************************************************************
 * Name:     randseed
 *
 * Purpose:  Seed the random number generator
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
void randseed(void)
{
#ifdef SIMULATE
  RandReg  seed;
  seedIn ? seed;
  randReg = seed;
#else
  PP1000RequestMemoryBank(1);
  PP1000ReadBank0(randReg,0);
  PP1000ReleaseMemoryBank(1);
#endif
}

/***************************************************************************
 * Name:     randXXXXX functions
 *
 * Purpose:  Generate random numbers of given widths and limits
 * 
 * Inputs:   None
 *
 * Returns:  A random number of the correct width
 *
 * Notes:    Each function requires 1 clock cycle for the random() call
 * 
 ***************************************************************************/
Index randIndex(ProgLen len)
{
  Index   v;
  PAR {
  	random();  
  	len -= 1;
  }
  return randReg[IDXW-1:0] & adju(len,IDXW);
}

/*
* Returns a program length between 1 and 
* the MAXNODES
*/
ProgLen randLen()
{
	ProgLen len;
	random();
	len = 0@randReg[IDXW-1:0];
	return len+1;
}

Percent randMethod()
{
  random();
  return randReg[PCNW-1:0];
}



PopIndex randPopIndex()
{
  random();
  return randReg[POPW-1:0];
}

Register randEa()
{
  random();
  return randReg[REGW-1:0];
}

FuncType randInstruction()
{
  random();
  return randReg[FTW-1:0];
}

Value randValue()
{
  random();
  return (Value)randReg[VW-1:0];
}



#else
/*
 * Random number routines for a regular ANSI-C system
 */
static RandReg randReg;
RandReg   s_random(void)
{
 unsigned int BITW bit0;
 RandReg  t1, t2, t3, t4, t5, t6;
 t1 = (randReg & (1LL<<TAP1)) >> TAP1;
 t2 = (randReg & (1LL<<TAP2)) >> TAP2;
 t3 = (randReg & (1LL<<TAP3)) >> TAP3;
 t4 = (randReg & (1LL<<TAP4)) >> TAP4;
 t5 = (randReg & (1LL<<TAP5)) >> TAP5;
 t6 = (randReg & (1LL<<TAP6)) >> TAP6;
 bit0 = t1^t2^t3^t4^t5^t6;
 randReg <<= 1;
 randReg |= bit0;
#ifndef PPCSIM
 if(randlog != NULL) {
   fprintf(randlog, "%llu\n", randReg);
 }
#endif
 return randReg;
}


void randseed(void)
{
#ifdef PPCSIM
  randReg = 260158;
#else
  FILE *fp;
  time_t t;

  t = time(NULL);
  if(newseed) {
    randReg = t;
    fp=fopen("c:/tmp/seed.dat", "w");
    if(fp) {
      fprintf(fp, "%lu", t);
      fclose(fp);
    }
  } else {
    fp=fopen("c:/tmp/seed.dat", "r");
    if(fp ==NULL) {
      perror("Open seed file");
      printf("Using time instead\n");
      randReg = t;
    } else {
      fscanf(fp, "%lld", &randReg); 
      fclose(fp);
    }
  }
  if(!tree) {
    printf("SEED=%lld\n", randReg);	
  }
  randlog=fopen("c:/tmp/c_randlog.dat", "w");
#endif
}

ProgLen randLen(void)
{
  return (s_random() & (MAXNODES-1)) + 1;
}


Value randIndex(Value max)
{
  return s_random() & (max);
}

Percent randMethod()
{
  return s_random()  & (PERCENTAGE-1);
}

PopIndex randPopIndex()
{
  return s_random() & (POPSIZE-1);
}

Register randEa()
{
	return s_random() & (MAXREGS-1);
}

FuncType randInstruction()
{
	return s_random() & (MAXFUNCS-1);
}

Value randValue()
{
	return (Value)s_random() % MAXVALUE;
}

#endif
