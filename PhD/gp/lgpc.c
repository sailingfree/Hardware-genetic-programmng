/***************************************************************************
 * lgpc: Linear Genetic Programming in C
 *
 * Pete Martin
 * Marconi COmmunications Limited
 *
 * A very simple GP system, cut to the bone.
 * This program can be run under a 'normal' OS or by defining HANDELC
 * can be compiled using handelc. This considerably aids development and
 * testing using traditional C tools.
 * 
 * Many of the design decisions were made to enable this to be compiled 
 * and built;
 * 
 * Where possible logical operations are used.
 * eg. The termination expression in a for loop is coded as != rather than
 *     < to reduce the number of gates.
 *
 ***************************************************************************/


#ifndef HANDELC
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#else
#include <stdlib.h>
#endif

#define  INT_MAX   256
#define GENSIZE    (500)                /* Max number of generations    */
/*
 * The following values must be powers of 2 so that the 
 * logic works correctly
 */
#define POPSIZE    (4)                /* Max populations size         */
#define SUBPOPSIZE (2)                /* Number of individuals to evaluate 
					 in parallel. Must be a factor of
					 POPSIZE */
#define MAXNODES   (2)                /* Maximum nodes per individual */
#define MAXINITLEN (MAXNODES)         /* Max length for creation      */
#define MAXVALUE   (INT_MAX)
#define MAXREGS    (4)
#define MAXFUNCS   (8)
#define MAXLOOP    (8)                /* Maximum number of loops in prog */
#define MAXFITNESS (4)                /* Max fitness cases */
#define MAXMETHODS (4)
#define PERCENTAGE (1024)             /* Bits for selecting operator */

/*****************************************************************
 * Handle-c specific defines
 *****************************************************************/
#ifdef HANDELC
/* Define the widths of the various values */
#define FTW       (log2ceil(MAXFUNCS))        /* Bits needed for function     */
#define NTW       (log2ceil(MAXNODETYPES))    /* Bits to represent node types */
#define VW        (log2ceil(MAXVALUE))        /* Bits in a value              */
#define IDXW      (log2ceil(MAXNODES))        /* Width of index into nodes    */
#define GENW      (log2ceil(GENSIZE))         /* Width if generation index    */
#define POPW      (log2ceil(POPSIZE))       /* Width of population index 
						                        (including staging area  */
#define SPOPW     (log2ceil(SUBPOPSIZE))						 
#define INDW      (log2ceil(MAXNODES))        /* Width of individual index    */
#define REGW      (log2ceil(MAXREGS))
#define LOOPW     (log2ceil(MAXLOOP))
#define MTHW      (log2ceil(MAXMETHODS))
#define PCNW      (log2ceil(PERCENTAGE))
#define FCASEW    (log2ceil(MAXFITNESS))
#define BITW      1 

#define BOOLW     1
#define MAINTYPE  void
#define FORPAR    par
#define PAR       par
#define INLINE	  inline

set clock = external "P35";

#else
/* Non-Handlec definitions to make this compile as normal ANSI-C */
#define FTW
#define NTW
#define AW
#define VW   
#define IDXW
#define GENW
#define POPW
#define INDW 
#define REGW
#define MDW
#define LOOPW
#define MTHW
#define PCNW
#define BITW
#define FCASEW
#define SPOPW

#define MAINTYPE  int
#define FORPAR    for
#define PAR     
#define BOOLW
#define delay     ;  
#define inline
#define adju(a,b) a
#define adjs(a,b) a
#endif

/**************************************************************************
 * Function set members
 * This must match MAXFUNCS
 ***************************************************************************/
typedef enum {
  ADD, SUB, JMPIFZ, LDIM, SHL, SHR, NOP, HALT
} FuncTypeE;

/***************************************************************************
 * Registers (terminal set) for the processor
 * Must match MAXREGS
 ***************************************************************************/
typedef enum {
  r0,r1,r2,r3,r4,r5,r6,r7
} RegisterE;


/* *************************************************************
 * Breeding ratios 
 * We have 10 bits for selecting a breeding operator
 * The value is divvied into ranges and a simple mask 
 * will give us the appropriate ratio of operators
 * Note that in order to make this fast we use an approximation
 * that gives us the nearest number as a power of 2.
 ***************************************************************/
#define  XOVERMASK  0x3f0    /* top 7 bits -> 70%    */
#define  COPYMASK   0x018    /* 2 bits ->20%         */
#define  MUTATEMASK 0x001    /* The remainder 10%    */

typedef enum {
  REPRO, XOVER, MUTATE 
} ReproMethod;

/*
 * typedef the commonly used types
 */
typedef unsigned int IDXW   PC;
typedef PC                  Index;
typedef signed   int VW     Value;
typedef unsigned int VW     UValue;
typedef unsigned int GENW   Generation;
typedef unsigned int POPW   PopIndex;
typedef unsigned int POPW   Depth;
typedef unsigned int REGW   Register;
typedef unsigned int FTW    FuncType;
typedef unsigned int LOOPW  LoopCount;
typedef unsigned int MTHW   Method;
typedef unsigned int FCASEW Fcase;
typedef unsigned int PCNW   Percent;
typedef unsigned int BOOLW  Bool;

/*
 * The layout of an 'instruction'
 */
typedef struct {
  FuncType  f;              /* Opcode                      */
  Register  ea1;            /* Effective address 1         */
  Register  ea2;            /* Effective address 2         */
} Inst;

/*
 * An individual
 */
typedef struct  indiv{
  Index    len;             /* Length of program           */
  Value    rf;              /* Raw fitness                 */
  Inst     nodes[MAXNODES]; /* The instructions for this individual */
  Value    k[MAXREGS];      /* Constant values */
}Indiv;

/* Define the population storage */
Indiv  individuals[POPSIZE];     

/* 
 * Define the fitness case values for the evaluation 
 * The first two values are the input data and the third is the expected result
 */
Value  fitnessData[MAXFITNESS][3];

Bool debug = 0;
Bool tree  = 0;

/*
 * Tags for outputting the data from handlec
 */
typedef enum {
	LEN, GEN, IND, FUNC, EA1, EA2, K, FIT
} Tag;
#define EOL "\n"
	

/* 
 * Generic GP  function prototypes 
 */
void   initPop(void);
Bool   evalGen(Generation);
void   breedNewPop(void);
void   printProg(PopIndex);

/*
 * Instruction set specific functions
 */
void   printProg(PopIndex);
Value  INLINE evalProg(PopIndex, Value , Value);
void   printInst(PopIndex, Index);
/*
 * Problem specific functions
 */
/*Value  evalRawFitness(Fcase, Value);*/
void   initFitnessData(void);

/*
 * output channel
 */
#ifdef HANDELC
/*chanout stdout;*/
chanout Value logout with {outfile = "c:/tmp/log.dat"};
#endif

/* 
   #######################################################################
   #######################################################################
   #######################################################################
   Functions for the generic GP machine
   #######################################################################
   #######################################################################
   #######################################################################
*/
/********************************************************************
* Data input/output routines
*********************************************************************/
void outstr(char *str)
{
#ifndef HANDELC
  if(!tree)
	printf("%s", str);
#else
	delay;	
#endif	
}

void outdata(Value c, Value v)
{
#if HANDELC
/*	stdout ! c;*/
	logout ! c;
/*	stdout ! v;*/
	logout ! v;
#else	
	if(tree) {
	  printf("%d %d\n", c,v);
	} else {
	  printf("%d", v);
	}
#endif	
}

/********************************************************************
 * Random number generator for Handelc
 *
 * Uses a shift register with taps and feedback
 ********************************************************************/
#ifdef HANDELC
#define RANDWIDTH  64  /* Number of bits in the generator 
                 			This is greater than the biggest number
                 			wanted from the generator*/ 
#define TAP1       0
#define TAP2       5
#define TAP3       9
#define TAP4       37
#define TAP5       61
#define TAP6       63

/* Define a type for the shift register */
typedef unsigned int RANDWIDTH RandReg;  
 
RandReg randReg;    /* The register used for generating the number */

/* Channel for getting the seed */
#ifdef HANDELC
chanin  RandReg seedIn with {infile = "c:/tmp/seed.dat"};
#endif

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
void random(void)
{
  unsigned int BITW bit0;
   {
    bit0 = randReg[TAP1] ^ 
      randReg[TAP2] ^ 
      randReg[TAP3] ^ 
      randReg[TAP4] ^ 
      randReg[TAP5] ^ 
      randReg[TAP6];
    /* Shift by using all bits except top bit and adding bit 0 */
    randReg = randReg[RANDWIDTH-2:0]@bit0;  
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
  RandReg  seed;
  seedIn ? seed;
  randReg = seed;
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
Index randIndex(Index max)
{
  random();
  return (randReg[IDXW-1:0]) & max;
}

Percent randMethod()
{
  random();
  return randReg[PCNW-1:0] % 100;
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

Index randXover(Index max)
{
  random();
  return randReg[IDXW-1:0]&max;
}

#else
/*
 * Random number routines for a regular ANSI-C system
 */

void randseed(void)
{
  unsigned int t;

  t = time(NULL);
  srand(t);
}

Index randIndex(Index max)
{
  return max > 0 ? rand() % max : 0;
}

Percent randMethod()
{
  return rand() % 100;
}

PopIndex randPopIndex()
{
	return rand() % POPSIZE;
}

Register randEa()
{
	return rand() % MAXREGS;
}

FuncType randInstruction()
{
	return rand() % MAXFUNCS;
}

Value randValue()
{
	return (Value)rand() % MAXVALUE;
}

Index randXover(Index max)
{
  return  max > 0 ? rand() % max : 0;
}

#endif

/***************************************************************************
 * Name:     findBest
 *
 * Purpose:  Find the best individual in the population
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
void findBest(void)
{
  PopIndex i;
  UValue    f;
  UValue    rf;
  PopIndex best;
  Value    x;
  
  f = MAXVALUE-1;
  best = 0;

  for(i=0;i != POPSIZE;i = i + 1 ) {
  	rf = (UValue)abs(individuals[i].rf);
    if(rf < f) {
      f = rf;
      best = i;
    } else {
      delay;
    }
  }
  x = (Value)adju(best, VW);
  outstr("Best individual");
  outdata(IND, (Value)adju(best, VW));
  outdata(FIT, (Value)rf);
  outstr("\n");
  printProg(best);
}

/***************************************************************************
 * Name:     main
 *
 * Purpose:  The main function
 * 
 * Inputs:   nothing
 *
 * Returns:  nothing
 * 
 * Note:     
 *
 ***************************************************************************/

MAINTYPE main
#ifdef HANDELC 
 (void)
#else
 (int argc, char ** argv)
#endif 
{
  Generation gen;
  Bool       stat;

#ifndef HANDELC
  if(argc >1) {
    if (strcmp(argv[1], "-d") == 0) {
      debug = 1;
    }
    if(strcmp(argv[1], "-t") == 0) {
      tree = 1;
    }
  }
#else
  tree = 1;
#endif  
  randseed();
  initPop();
  initFitnessData();
  for(gen = 0; gen != GENSIZE; gen = gen + 1 ) {
  	stat = evalGen(gen);
    if(stat) {
#ifndef HANDELC
      return 0;
#else
	  return;
#endif	  
    }
    breedNewPop();
  }
  evalGen(gen);  /* Final pass after last breeding phase */
  findBest();
#ifndef HANDELC
  return 0;
#endif
}


/***************************************************************************
 * Name:     genNode
 *
 * Purpose:  Generate an instruction node
 * 
 * Inputs:   The population index and the node index
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
void genNode(PopIndex indiv, Index node)
{
  individuals[indiv].nodes[node].f   = randInstruction();
  individuals[indiv].nodes[node].ea1 = randEa();
  individuals[indiv].nodes[node].ea2 = randEa();
}


/***************************************************************************
 * Name:     makeProg
 *
 * Purpose:  
 * 
 * Inputs:   
 *
 * Returns:  
 * 
 ***************************************************************************/
void makeProg(PopIndex indiv) 
{ 
  Index    proglen;
  Index    i;
  Register r;
  
  /* 
   * Determine initial program length. We ensure that this is greater than 0 
   */
  do {
    proglen = randIndex(MAXINITLEN-1); 
  }  while(proglen==0);
  individuals[indiv].len   = proglen;
  
  for(i=0;i != proglen-1;i = i + 1) {
    genNode(indiv, i);
  }
  /*
  * Generate constants
  */
  for(r=0;r<MAXREGS;r++)
  {
     individuals[indiv].k[r]   = randValue();
  }
  individuals[indiv].nodes[proglen-1].f = HALT;  /* Last instruction is a halt*/
}

/***************************************************************************
 * Name:     initPop
 *
 * Purpose:  Initialise the population
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 * Note:     Side effect is to construct the program
 *
 ***************************************************************************/
void initPop(void)
{
  PopIndex   i;

  for(i=0;i != POPSIZE;i = i + 1) {
    makeProg(i);
  }
  /*
   * init the staging area as well
   */
  individuals[POPSIZE].len   = MAXNODES;
}

/***************************************************************************
 * Name:     evalGen
 *
 * Purpose:  Evaluate a generation
 * 
 * Inputs:   The generation number
 *
 * Returns:  0 if no 100% correct program ,1 if there was a solution
 * 
 * Note:     Calling convention in this machine is that the input variables
 *           are stored in r0..rn.
 *           Raw fitness is the distance between the required value
 *           and the actual value. A value of zero means 100% correct.
 *           The fitness cases are executed in parallel in this function.
 *           The required number of copies of the machine are generated 
 *           (POPSIZE copies)
 *
 ***************************************************************************/
Bool evalGen(Generation gen)
{
 PopIndex ind;
 PopIndex subpop;
 Bool     stat;
 Fcase    fc;
 Fcase	  maxFc;
 PopIndex i;
 Value    v1,v2,r;

 stat = 0;
 maxFc = MAXFITNESS-1;
 /*
  * Initialise the raw fitness for all individuals
  */
 FORPAR(i=0;i != POPSIZE;i++) {
   individuals[i].rf=0;
 }

 /*
  * Perform MAXFITNESS passes over each individual
  */
 	for(fc = 0; fc < maxFc; fc++) 
 	{
 	PAR {
 		v1  = fitnessData[fc][0];
 		v2  = fitnessData[fc][1];
 		r   = fitnessData[fc][2]; 
 		ind = 0;    /* Base index into individuals */
		}
				
 	while(ind != POPSIZE) {
 	   /*
	    * Now execute the fitness evaluations of SUBPOP
	    * individuals in parallel:
	    * 1. clear the register values
	    * 2. Initialise the input data values
	    * 3. Execute the program
	    * 4. Evaluate the raw fitness
	    */
	   FORPAR(i = 0; i < SUBPOPSIZE; i++) {
	   		Value    result;
	   		PopIndex evalInd;
	   		
	   	    evalInd = ind + i;
 	        result = evalProg(evalInd,v1 ,v2 );
	        individuals[evalInd].rf += abs(result - r);
	   }		
	   ind += SUBPOPSIZE;   /* Adjust base index to next block */
   }
 }
 
  /*
  * All fitness cases for all individuals processed
  * See if there were any exact solutions
  */
 for(i=0;i < POPSIZE;i++) {
   if(individuals[i].rf == 0) {
     stat = 1;  /* Found a solution */
     outstr("Solution found in generation ");
     outdata(GEN, (Value)adju(gen, VW));
     outstr(" individual ");
     outdata(IND, (Value)adju(i, VW)); 
     outstr(EOL);
     printProg(i);
     break;
   }
 }
 return stat;
}


/***************************************************************************
 * Name:     copyInstruction
 *
 * Purpose:  Copy an instruction from one individual to another
 * 
 * Inputs:   from:  The source individual
 *           i1:    The instruction in the source
 *           to:    The destination individual
 *           i2:    The instruction in the destination
 *
 * Returns:  Nothing
 *
 * Notes:    We do not rely on structure assignment but do an explicit
 *           parallel (under HANDEL-C) memberwise copy
 * 
 ***************************************************************************/
void copyInstruction(Indiv * from, Index i1, Indiv * to, Index i2)
{
#ifndef HANDELC
  if(debug) {
	  printf("COPYING INSTRUCTION from ind %d pc %d to ind %d pc %d\n", 
		 from, i1, to, i2);
  }
#endif  
   PAR {
   to->nodes[i2].f = from->nodes[i1].f;
   to->nodes[i2].ea1 = from->nodes[i1].ea1;
   to->nodes[i2].ea2 = from->nodes[i1].ea2;
  }
}


/***************************************************************************
 * Name:     copyInd
 *
 * Purpose:  Copy one program to another.
 * 
 * Inputs:   The source and destination
 *
 * Returns:  Nothing
 *
 * Notes:    To allow Handle-c to do this as quickly as possible we
 *           copy the entire program including instructions beyond the
 *           length. This gives us a single cycle copy function.
 * 
 ***************************************************************************/
void copyInd(PopIndex from, PopIndex to)
{
  Index    i;
  Register r;
  
#ifndef HANDELC  
  if(debug) {
    printf("-- Copying %d to %d\n", from, to);
  }
#endif  
    PAR{
    	FORPAR(i=0;i != MAXNODES;i++) {
      		copyInstruction(&individuals[from], i, &individuals[to], i);
    	}
    	FORPAR(r=0;r<MAXREGS; r++ ) {
    		individuals[to].k[r] = individuals[from].k[r];
    	}
    individuals[to].len = individuals[from].len; 
  	}
}



/***************************************************************************
 * Name:     mutate
 *
 * Purpose:  Perform a mutation on an individual
 * 
 * Inputs:   The individual
 *
 * Returns:  Nothing
 *
 * Notes:    A side effect is to modify an instruction
 * 
 ***************************************************************************/
void mutate (PopIndex ind)
{
  Index  pc;
  pc = randIndex(individuals[ind].len);

#ifndef HANDELC  
  if(debug) {
    printf("Mutating individual %d at offset %d\n", ind, pc);
  }
#endif  
  genNode(ind, pc);
}

/***************************************************************************
 * Name:      selectInd
 *
 * Purpose:   Use a tournament to select an individual
 *            Returns the fitter of the two
 * 
 * Inputs:    Nothing
 *
 * Returns:   The population index of the fitter of the two programs
 *
 * Notes:     Selects two individuals. It ensures that the two are 
 *            different programs !
 * 
 ***************************************************************************/
PopIndex selectInd()
{
  PopIndex ind1, ind2;
  ind1 = randPopIndex();
  do {
    ind2 = randPopIndex();
  } while (ind1 == ind2);
  return individuals[ind1].rf <= individuals[ind2].rf ? ind1 :ind2;
}

/***************************************************************************
 * Name:      crossOver
 *
 * Purpose:   Perform a crossover between the two individuals
 *            THIS IS NOT A GOOD IMPLEMENTATION AND SHOULD BE  FIXED
 *            Uses temporary individuals to act as a staging area
 *
 * Inputs:    ind1: Index to a pogram
 *            ind2: Index to other program
 *
 * Returns:   Nothing
 * 
 ***************************************************************************/
void crossOver(PopIndex ind1, PopIndex ind2)
{
  Index		x1;		/* Xover point in ind1 */
  Index		x2;		/* Xover point in ind2 */
  Index		i;

  Index		tmplen;
  Indiv     stage;
 
  /*
  * Select two crossover points
  */
  x1 = randXover(individuals[ind1].len);   
  x2 = randXover(individuals[ind2].len);  

#ifndef HANDELC  
  if(debug) {
    printf("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$\n");
    printf("Crossing over individuals %d and %d\n", ind1, ind2);
    printf("Before (1)\n");
    printProg(ind1);
    printf("And numeber 2\n");
    printProg(ind2);
    printf("Xover 1 = %d, xover 2 = %d\n", x1, x2);
    }
#endif

    

  /* Copy the trailing part of ind1. cpl1 is less than maxsize */

  for(i=0; i != individuals[ind1].len-x1; i++ ) {
    copyInstruction(&individuals[ind1], i + x1, &stage, i);
  } 

  /* Copy trailing part of ind2 to ind1, checking for MAXNODES */
  for(i=0; i != individuals[ind2].len - x2 && i+x1 < MAXNODES; i++ ) {
    copyInstruction(&individuals[ind2], i + x2, &individuals[ind1], i + x1);
  }

  /* Copy staging area back to ind2, again checking for MAXNODES */
  for(i=0; i != individuals[ind1].len - x1  && i+x2<MAXNODES;i++) {
    copyInstruction(&stage, i, &individuals[ind2], i + x2);
  }

  /* Copy the new lengths */
  tmplen = individuals[ind1].len;
  individuals[ind1].len = x1 + individuals[ind2].len - x2;
  individuals[ind2].len = x2 + tmplen - x1;

  if(individuals[ind1].len > MAXNODES) {
    individuals[ind1].len = MAXNODES;
  } else {
    delay;
  }
  if(individuals[ind2].len > MAXNODES) {
    individuals[ind2].len = MAXNODES;
  } else {
    delay;
  }
 
#ifndef HANDELC  
  if(debug) {
    printf("After (1)\n");
    printProg(ind1);
    printf("Number 2\n");
    printProg(ind2);
    printf("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&\n");
    }
#endif    
}

/***************************************************************************
 * Name:     breedNewPop
 *
 * Purpose:  Breed a new population
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 * Note:     Uses a steady state algorithm. A generational equivalent is
 *           POPSIZE transformations.
 *           A side effect is to modify the population.
 *
 ***************************************************************************/
void breedNewPop(void)
{
  PopIndex  newind;
  Method    method;
  Percent   percent;
  PopIndex  ind1;
  PopIndex  ind2;

  for(newind = 0; newind != POPSIZE; newind++) {
    /*
    * Choose appropriate operator
    */
    percent = randMethod();
    if(percent & XOVERMASK) {
    	method = XOVER;
    } else if (percent & COPYMASK) {
    	method = REPRO;
    } else {
    	method = MUTATE;
    }
#ifndef HANDELC    
    if(debug) {
      printf("Newind %d method %d\n", newind, method);
      }
#endif      
    switch(method) {
    case REPRO:
      ind1 = randPopIndex();
      do {
	      ind2 = randPopIndex();
      } while(ind1 == ind2);
      if(individuals[ind1].rf <= individuals[ind2].rf) {
	      copyInd(ind1, ind2);
      } else {
	      copyInd(ind2, ind1);
      }
      break;
    case XOVER:
      /*
      * select two individuals from tournaments, make sure that they
      * are not the same 
      * Apply crossover
      */
      ind1 = selectInd();
      do {
	      ind2 = selectInd();
      } while(ind1 == ind2);
      crossOver(ind1, ind2);
      break;
    case MUTATE:
      /* 
       * Select an individual from a tournament and apply the
       * mutation
       */
       ind1 = selectInd();
	    mutate(ind1);
      break;
    }
  }
  
}

/***************************************************************************
 * Name:     printProg
 *
 * Purpose:  Print a program
 * 
 * Inputs:   The individual index
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
void printProg(PopIndex ind)
{
  Index pc;
  Index i;


  outstr("--------------------------------------\n");
  outstr("Individual program number ");
  outdata(IND, (Value)adju(ind,VW));
  outstr(" Len = ");
  outdata(LEN, (Value)adju(individuals[ind].len,VW));
  outstr("\n");
  outstr("Raw fitness = ");
  outdata(FIT, individuals[ind].rf);
  outstr("\n");
  pc = 0; 
  for(i=0;i != individuals[ind].len;i++) {
    printInst(ind, pc);
    pc++;
  }
  outstr("\n=======================================\n");
}

/***************************************************************************
 * Name:     printRegs
 *
 * Purpose:  Print the register values of an individual
 * 
 * Inputs:   The individual and the registers
 *
 * Returns:  
 * 
 ***************************************************************************/
void printRegs(Register *regs, Register ea1, Register ea2)
{
#ifndef HANDELC
  printf("[%d,%d] ", regs[ea1], regs[ea2]);
#else
  delay;  
#endif  
}

/* 
   #######################################################################
   #######################################################################
   #######################################################################
   * Instruction set specific functions.
   * These functions implement the debug and execution portion of the 
   * processor
   #######################################################################
   #######################################################################
   ####################################################################### 
*/

/***************************************************************************
 * Name:     printInst
 *
 * Purpose:  Print an instruction
 * 
 * Inputs:   The individual and the instruction index
 *
 * Returns:  Nothing
 *
 * Notes:    Used for debug under ANSI-C and for a HANDEL-C system 
 *           to yeild up the result.
 *           If tree is true then print out integer values suitable
 *           for the disassembler otherwise print as human readable
 * 
 ***************************************************************************/
void printInst(PopIndex indiv, Index pc)
{
#ifndef HANDELC
  if(!tree) {
    printf("{%d->}", pc);
    switch(individuals[indiv].nodes[pc].f) {
    case ADD:
      printf("ADD(r%d,r%d) ", individuals[indiv].nodes[pc].ea1, individuals[indiv].nodes[pc].ea2);
      break;
    case SUB:
      printf("SUB(r%d,r%d) ", individuals[indiv].nodes[pc].ea1, individuals[indiv].nodes[pc].ea2);
      break;
    case SHL:
      printf("SHL(r%d) ", individuals[indiv].nodes[pc].ea1);
      break;
    case SHR:
      printf("SHR(r%d) ", individuals[indiv].nodes[pc].ea1);
      break;
    case JMPIFZ:
      printf("JMPIFZ(r%d,r%d) ", individuals[indiv].nodes[pc].ea1, individuals[indiv].nodes[pc].ea2);
      break;
    case LDIM:
      printf("LDIM (r%d, %d) ", individuals[indiv].nodes[pc].ea1, individuals[indiv].k[ea1]);
      break;
    case HALT:
      printf("HALT (r%d)", individuals[indiv].nodes[pc].ea1);
      break;
    case NOP:
      printf("NOP");
      break;
    default:
      printf("Unkown Opcode");
      break;
    }
  }
#endif  
   if(tree) {
  	outdata(FUNC,  (Value)adju(individuals[indiv].nodes[pc].f,VW));
  	outdata(EA1,   (Value)adju(individuals[indiv].nodes[pc].ea1, VW));
  	outdata(EA2,   (Value)adju(individuals[indiv].nodes[pc].ea2,VW));
  }
}

/***************************************************************************
 * Name:     evalProg
 *
 * Purpose:  Runs a program for an individual
 * 
 * Inputs:   The population index (individual)
 *
 * Returns:  The result of the program. This is either the value in the 
 *           register of a HALT instruction, or the value of register 0
 *           if no halt instruction found before the end of the program
 * 
 * Notes:    For handle-c we arrange for each instruction to take 1 clock
 *           cycle by executing decode/execution/program counter management
 *           in parallel.
 *           Loops are terminated after a preset number of jumps
 *           This may be replicated a number of times and all replicates
 *           executed in parallel.
 * 
 ***************************************************************************/
Value INLINE evalProg(PopIndex ind, Value v1, Value v2)
{
  Index       pc;
  Index       limit;
  Register    ea1, ea2;
  LoopCount   loopCount;
  LoopCount   maxCount;
  Value       regs[MAXREGS]; 
  Register    i;
  
  /*
   * Initialisation.
   * All done in 1 cycle for Handelc
   * a) Zero the resgister set
   * b) copy the input parameters
   * c) Set up control variables
   */
   PAR {
      FORPAR(i=2;i != MAXREGS;i++ ) {
         regs[i] = 0;
      }
  	  regs[0] = v1;
  	  regs[1] = v2;
  	  loopCount = 0;
  	  maxCount  = MAXLOOP-1;
  	  pc        = 0;
      limit     = individuals[ind].len;
  }
  
  while(loopCount < maxCount && pc < limit) {
  PAR {
      ea1 = individuals[ind].nodes[pc].ea1;
      ea2 = individuals[ind].nodes[pc].ea2;
    }
#ifndef HANDELC    
    if(debug) {
      printInst(ind, pc);
      printRegs(regs, ea1, ea2);
    }
#endif      

    switch(individuals[ind].nodes[pc].f) {
    case ADD:
      PAR {
	regs[ea1] += regs[ea2];
	pc++;
      }
      break;
    case SUB:
      PAR {
	regs[ea1] -= regs[ea2];
	pc++;
      }
      break;
    case SHL:
      PAR {
	regs[ea1] <<= 1;
	pc++;
      }
      break;
    case SHR:
      PAR {
	regs[ea1] >>= 1;
	pc++;
      }
      break;
    case JMPIFZ:
      /* The pc is evaluated and limited to the size of the program */
      pc++;
      /*
      PAR {
		pc = REG(ind, ea1) ? pc +1 : (REG(ea2, ind) % MAXNODES);
		loopCount += 1; 
      }*/
      break;
    case HALT:
#ifndef HANDELC
      if(debug) {
	printf("<end>\n");
      }
#endif
      return regs[ea1];
      break;
    case LDIM:
      PAR {
	regs[ea1] = individuals[ind].k[ea2];
	pc++;
      }
      break;
    case NOP:
      pc++; 
      break;
    default:
#ifndef HANDELC    
      printf("Unknown Opcode <%d> in Ind %d at pc %d", 
	     individuals[ind].nodes[pc].f, ind, pc);
#endif      
      pc++;
      break;
    }
  }
#ifndef HANDELC
  if(debug) {
    printf("<end>\n");
  }
#endif  
  return regs[r0];  /* Fall out here if loop count is exceeded */
}

/* 
   #######################################################################
   #######################################################################
   #######################################################################
   Problem specific functions.
   #######################################################################
   #######################################################################
   #######################################################################
*/
/***************************************************************************
 * Name:     initFitnessData
 *
 * Purpose:  Set up the data for the fitess evaluations
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 *
 * Notes:    A side effecting function that pre-computes the fitnessData
 *           structure
 * 
 *           This is only called once so no need to burn hardware
 *           by doing things in parallel
 * 
 ***************************************************************************/
#define   PROB0(c) (fitnessData[c][0]+fitnessData[c][1])
#define   PROB1(c) (((fitnessData[c][0]+fitnessData[c][1])<<2))
#define   PROB2(c) (((fitnessData[c][0])+((fitnessData[c][1])<<1)))
void initFitnessData(void)
{
  Value    i;
  Value    v;
  Fcase    c;
  v = 0;
  c = 0;
  for(i=0;i < MAXFITNESS;i++) {
    fitnessData[c][0]  = 10+i;
    fitnessData[c][1]  = 20+i;
    fitnessData[c][2]  = PROB0(c);
    c ++;
  }
}	

