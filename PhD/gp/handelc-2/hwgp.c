/**************************************************************************
 * hwgp: Hardware implementation of Genetic Programming. Written in
 * Handel-C for compilation to a Xilinx FPGA
 *
 * Pete Martin 2001
 *
 ***************************************************************************
 * This file implements the following versions:
 *
 * -DHANDELC     for compling under handelc, both simulator and edif
 * -DSIMULATE    for compliling for the handelc simulator
 *               if this is not defined but HANDELC is then it will compile
 *               for EDIF
 * 
 * -DPOPSIZE     Overrides the default population size
 * -DSUBPOPSIZE  Overrides the default SUBPOPSIZE
 * -DMAXNODES    Overrides the default MAXNODES
 * -DXOR         Defines the problem type
 * -DREGRESSION  Ditto
 * -DVERBOSE     Outputs lotsof internal values. Intended for use when comparing
 *               two different implementations to check that the internal
 *               operation is identical.
 ***************************************************************************/

#define VERSION "1.0"


#ifndef HANDELC
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#else
#ifdef DEBUG
#include <stdlib.h>

static unsigned int 3 bank;
static unsigned int 21 address;
static unsigned int 32 value;

set clock = external "P35";

#else
/*
 * Include RC1000-PP support header file
 */
#define PP1000_32BIT_RAMS
#define PP1000_DIVIDE1
#define PP1000_CLOCK PP1000_MCLK with {rate=50.0}
#include <pp1000.h>

#include <stdlib.c>
#endif  /* DEBUG */
#endif  /* !HANDELC */

#include <hwgp.h>

/* Define the internal population storage
* this is a subset of the full population that is held in external
* static RAM. These are used for internal operations.
* There are 2 separate sets of individuals in ram here.
* Each one is used for a different phase of the pipeline 
* The working ram is arragned as 32 bit words. The evaluation
* function will decode this into instruction sized chunks as needed.
*/
RAM UINT32 workingPop  [MAXPHASE]   /* First index is the phase */
                       [MAXPAR]     /* second index is the individual */
                       [MAXNODES]   /* Third index is the words in the */
                                    /* individual */
                       WITHBLOCK;

/* Storage to kep track of individuals that need to have their inWork
 * indication reset */
MainPopIndex stale[MAXPAR];

#if DEBUG
/* Provide some storage for sram if we are using the simulator */
ram UINT32 sram[POPSIZE*MAXNODES] with {block = 1};
#define RAMW (log2ceil(POPSIZE*MAXNODES))

macro proc PP1000WriteBank0(addr,val)
{
    sram[adju(addr,RAMW)]=val;
}


macro proc PP1000ReadBank0(val, addr)
{
    val = sram[adju(addr,RAMW)];
}

#endif


/* Global fitness data */
Fcase    curFit;

#define DEFAULT_FITNESS 15  /* 4 bits. Each correct eval shifts this right by 1 bit
                            * a 100% correct solution will have fitness of zero */

/*
* Define some control variables
*/
#if !defined HANDELC
Bool tree   = 0;   /* If true then print program tree */
Bool newseed= 0;   /* If true then ANSI_C version will generate seed */
#endif
Bool stopon = 0;   /* If true then stop if 100% correct prog */
Bool doDump = 0;

UINT8 nbreed, nxover, ncopy, nmutate;

Phase phBreed;
Phase phEval;

/* 
 * Generic GP  function prototypes 
 */
macro proc   initPop();
macro proc writeBackInd(phase, ind);
macro proc readIn(i, ind);

void   evalGen(Generation);
void   breedNewPop(void);
PopIndex findWorst(Bool, PopIndex);
PopIndex findBest(void);
UINT32 randBit(void);
void dumpProgs(void);

/*
 * output channel
 */
#ifdef HANDELC
/*chanout stdout;*/
chanout Short logout;
macro proc dooutdata(c, v)
{
#if DEBUG
	logout ! (Short)c;
	logout ! (Short)v;
#else	
	PP1000WriteStatus(c);
    PP1000WriteStatus(v);
#endif
}
#endif

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

 


/* Channel for getting the seed */
#ifdef HANDELC
#ifdef SIMULATE
chanin  RandReg seedIn with {infile = "c:/tmp/seed.dat"};
chanout RandReg randout with {outfile = "c:/tmp/random.dat"};
#endif
#endif
#if defined HANDELC
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
  PAR {
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

/* Return a value that is between 0 and MAXPROGLEN */
Index  randPC()
{
  return 0@randReg[PROGW-1:0];
}

macro proc randMethod(method)
{
#define mask1 0x1f
#define mask2 0xfc
#define mask3 (~mask1)
#define mask4 (~mask2)
#if 0
  static const UINT8 mask1 = 0x1f;
  static const UINT8 mask2 = 0xfc;
  static const UINT8 mask3 = ~0x1f;
  static const UINT8 mask4 = ~0xfc;
#endif

  UINT8 v, v1, v2, v3, v4;
   Method  result;

  v = adju(randReg,8) & 0xff;

  PAR {
    v1 = v&mask1;
    v2 = v&mask2;
    v3 = v&mask3;
    v4 = v&mask4;
    result = XOVER;   /* Assume the most probable */
  }
  if(!v3&&v1)
    result = MUTATE;
  else
    delay;

  if(!v4&&v2)
    result =  COPY;
  else
    delay;

    method =  result;
}

PopIndex randPopIndex()
{
  return randReg[POPW-1:0];
}

Register randEa()
{
  return randReg[REGW-1:0];
}

FuncType randInstruction()
{
  return randReg[FTW-1:0];
}


UINT32 randBit(void)
{
    return  randReg;
}

#endif

macro proc mutate(ind)
{
    Index      i;
    Index      address;
    UINT32     proglen;
    UINT32     val;
    UINT32     bitno;

    /* Select an instruction to mutate */
    i = randPC();
    proglen = WorkingPop(phBreed,ind, PLEN);
    i &= adju(proglen, IDXW);

    /* choose a bit to modify */
    PAR {
      bitno = randBit();
      address = i + START;  /* Caculate the offset of the instruction */
    }

    /* Xor the bit and the instruction */

    val = WorkingPop(phBreed, ind, address);
    val ^= bitno;
    WorkingPop(phBreed, ind, address) = val;
}


/* Copy individual at work index w to work index w+1 */
macro proc copyInd(w)
{
  UINT32   val;
  Index        i;
  Index        count;
  WorkIndex w1, w2;

	PAR {
  		i = 1;  /* Start at the length parameter */
  		count = MAXNODES-1;
		w1 = w;
		w2 = w + 1;
  	}
  do {
    val = WorkingPop(phBreed,w1,i);
    	WorkingPop(phBreed,w2, i) = val;
		PAR {
    		i++;
			count--;
		}
  }while(count);
}

macro proc xover(w)
{
  UINT32  val;
  UINT32  len1;
  UINT32  len2;
  PC      x1, x2;
  PC      i1, i2;
  Index  idx1, idx2;
  Index  count1, count2;
  WorkIndex w1, w2;

  /*
   * Choose two crossover points at random and get the program lengths
   */
  PAR {
    w1 = w;
    w2 = w+1;
  }

  PAR {
    x1 = randPC();
    len1 = WorkingPop(phBreed,w1,PLEN);
  }
  PAR {
    x2 = randPC();
    len2 = WorkingPop(phBreed,w2,PLEN);
  }

	/*
	* Crudely adjust the crossover points so that they lie within the 
	* individual
	*/
  PAR {
    x1 &= adju(len1, PROGW+1);
    x2 &= adju(len2,PROGW+1);
  }

  /*
  * calculate the starting points for crossover 
  */
  	PAR {
    	i1 = x1;
    	i2 = x2;
	}

  /*
  * Calculate the count of instructions for copying
  * count1 correspnds to individual 1
  */
  PAR {
	count1 = adju(len1, IDXW) - i1;
	count2 = adju(len2, IDXW) - i2;
  }

  /*
   * Copy until both counts have been exhausted
   */
  do {
    PAR {
        idx1 = i1 + START;
        idx2 = i2 + START;
    }
    val = WorkingPop(phBreed, w1, idx1);
    WorkingPop(phBreed,w1,idx1) = WorkingPop(phBreed,w2, idx2);
    WorkingPop(phBreed, w2, idx2) = val;

	/* 
	* Calculate the counts, but don't let them go below zero 
	* and calculate the next indexes, but don't let them go beyond MAXNODES
	*/
    PAR {
		if(count1) 
			count1--;
        else
            delay;
		if(count2)
			count2--;
        else
            delay;
		if(i1 != MAXPROGLEN-1)
			i1++;
        else
            delay;
		if(i2 != MAXPROGLEN-1)
			i2++;
        else
            delay;
    }
  }while( count1|| count2);

  /*
   * Adjust the lengths
   */
   PAR {
        len1 = adju(x1 + (adju(len2,PROGW+1) - x2), BIT32);
        len2 = adju(x2 + (adju(len1,PROGW+1) - x1), BIT32);
   }
  WorkingPop(phBreed, w1, PLEN) = len1;
  WorkingPop(phBreed, w2, PLEN) =  len2;
}

/***************************************************************************
 * Name:     evalProg
 *
 * Purpose:  Runs a program for an individual
 * 
 * Inputs:   The phase index
 *           the population index (individual)
 *
 * Returns:  1 if we found 100% fit program
 *           0 otherwise
 * 
 ***************************************************************************/
macro proc evalProg(phase, indx)
{
    Index       pc;   /* Index into 32 bit words of instructions */
    Index       len;
    Register    ea1, ea2,r;
    Bool        regs[MAXREGS]; 
    Register    i;
    Opcode      opcode;
    UINT32      word;
    UINT32      val;
    Bool            bit0, bit1;


    /*
    * Initialisation.
    * All done in 1 cycle for Handelc
    * a) Zero the register set
    * b) copy the input parameters
    * c) Set up control variables
    */
    PAR {
      	i=0;
        FORPAR (r=0; r < MAXREGS; r++ ) {
            regs[r] = 0;
        }
        bit0 = curFit[0];
        bit1 = curFit[1];
        regs[0] = curFit[0];
	    regs[1] = curFit[1];
	pc      = START;
        len     = adju(WorkingPop(phEval,indx,PLEN),IDXW);
    }

	/*
	* Guard against null programs that have appeared
	*/
	if(len != 0)  {
    do {
        len--;
        /* Read the next instruction word */
        word = WorkingPop(phEval,indx,pc);

        /* Decode the instruction */
        PAR {
	  ea1 = GetEa1(word);
	  ea2 = GetEa2(word);
	  opcode = GetOpcode(word);
        }
  
        switch(opcode) {
            case AND:
                PAR {
    	            regs[ea1] &= (regs[ea2]);
	                pc++;
                }
                break;
            case OR:
                PAR {
	                regs[ea1] |= regs[ea2];
	                pc++;
                }
                break;
            case NAND:
                PAR {
	                regs[ea1]  = !(regs[ea1] & regs[ea2]);
	                pc++;
                }
                break;
            case NOR:
                PAR {
      	            regs[ea1] = !(regs[ea1] | regs[ea2]);
      	            pc++;
      	        }
      	        break;
            }  /* switch */
        } while(len != 0);
    /*
    * Calculate the new raw fitness
    */
    if(regs[r0] == bit0 ^ bit1 ) {
      val = WorkingPop(phase,indx,FITN);
      val >>= 1;
      WorkingPop(phase,indx,FITN) = val;
    } else {
        delay;
    }
    }
}


/***************************************************************************
 * Name:     selection
 *
 * Purpose:  Selects MAXPAR individuals for breeding and copies them from
 *           external SDRAM into working ram
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 *
 * Notes:    Uses the phSelect to index into the required working memory
 *           No attempt is made to see if we overselect an individual.
 *           We only allow individuals that are not in workingPop
 * 
 * 	     The selection is tournament and uses a tournament size of 2.
 * 
 ***************************************************************************/
macro proc selection()
{
  WorkIndex    w;
  PopIndex     i, i1,i2;
  UINT32 fit1,fit2,ctrl;
  MainPopIndex address;

  PAR {
    w = 0;
  }

  do {
    /* 
     * Find 2 individuals that are not the same and that are not in 
     * workingPop
     */
    do {
      i1 = randPopIndex();
      indexToAddr(i1, address);
      PP1000ReadBank0(ctrl, address|CONTRL); /* The OR acts like addition */
      PP1000ReadBank0(fit1, address|FITN);
    } while(InWork(ctrl));

    do {
      i2 = randPopIndex();
      indexToAddr(i2, address);
      PP1000ReadBank0(ctrl, address|CONTRL);
      PP1000ReadBank0(fit2, address|FITN);
    } while(InWork(ctrl) && i1 == i2);
    /*
     * Choose the one with best fitness. 0 is best!
     */
    i = UnsignedLt(fit1, fit2, 4) ? i1 : i2;

    /*
     * Read it into workingPop
     */
    readIn(i,w);
    w++;
  }while(LIMIT(w,MAXPAR));
}



/***************************************************************************
 * Name:     breed
 *
 * Purpose:  Performs the breeding operations on the working ram pointed to
 *           by phBreed
 *           Once this has finished, there will be MAXPAR new individuals
 *           to evaluate
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 * Notes:    Since crossover and copy use 2 individuals, we arrange for
 *           all breed operations to operate on 2 individuals.
 *           This means that there are MAXWORK/2 breed operations.
 *           The individuals for breeding have already been placed in pairs
 *           in working memory, at addresses i, i+1
 ***************************************************************************/
macro proc  breed()
{
  WorkIndex count1, count2;
  Method    method;
  PopIndex  worst1, worst2;
  UINT32   w1, w2;
  Bool stat;
  count1 = 0;
  count2 = 1;
  
  do {
    /* Select breed method */
    
    randMethod(method);
#if 0
    switch(method) {
    case MUTATE:
      mutate(count);
      mutate(count+1);
      nmutate++;
      break;
    case XOVER:
      xover(count);
      nxover++;
      break;
    case COPY:
      copyInd(count);
      ncopy++;
      break;
    default:
#if !defined HANDELC
      printf("BADOP\n");
#endif
      break;
    }
#endif
    if(method==MUTATE) {
      mutate(count1);
      mutate(count2);
      nmutate++;
    } else {
      delay;
    }
    if(method ==  XOVER) {
      xover(count1);
      nxover++;
    } else {
      delay;
    }
    if(method ==  COPY) {
      copyInd(count1);
      ncopy++;
    } else {
      delay;
    }

    /*
     * Find the worst and replace it, and keep track of the original
     * parents so they can be updated to show they are no longer in 
     * workingPop
     */
    worst1=findWorst(FALSE,0);
    w1 = WorkingPop(phBreed,count1,PROGN);
    stale[count1] = adju(w1, SRAMW);
    WorkingPop(phBreed,count2,PROGN) = adju(worst1,BIT32);

    /* Ditto for 2nd individual */
    worst2=findWorst(TRUE,worst1);
    w2 = WorkingPop(phBreed,count2,PROGN);
    stale[count2] =  adju(w2, SRAMW);
    WorkingPop(phBreed,count2, PROGN) = adju(worst2,BIT32);

    /* Bump the counters by 2 */
    count1++;
    count1++;
    count2++;
    count2++;
  }while(LIMIT(count1,MAXPAR));
}

/***************************************************************************
 * Name:     evaluate
 *
 * Purpose:  Evaluates the fitness of all individuals in working ram pointed 
 *           to by phEval;
 * 
 * Inputs:   Nothing
 *
 * Returns:  1 if there was a 100% fit individual, otherwise 0
 * 
 ***************************************************************************/
macro proc evaluate()
{
    WorkIndex w;
    WorkIndex i;
    Bool      stat;

    /*
     * Set the fitness of each individual to the default maximum
     * This will then get adjusted when the evaluation is done
     */
    PAR {
        i = 0;
        stat = 0;
        curFit = 0; 
    }

    do {
        WorkingPop(phEval,i, FITN) = DEFAULT_FITNESS;
        i++;
    } while(LIMIT(i,MAXPAR));

    do {
        FORPAR(w=0; w<MAXPAR;w++) {
            evalProg(phEval,w);
        }
        curFit++;
    } while(LIMIT(curFit,MAXFITNESS));
}

/***************************************************************************
 * Name:     writeBack
 *
 * Purpose:  Writes all individuals in working ram pointed to by phBreed
 *           out to external RAM, and clears the inwork bit for all
 *           individuals read in during breeding
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
macro proc writeBack()
{
    WorkIndex w;
    UINT32    val;
    MainPopIndex address;
    
    w = 0;
    do {
        writeBackInd(phBreed, w);
	indexToAddr(stale[w], address);
	address += CONTRL;
	PP1000ReadBank0(val,address);
	val &= 0xfffffffe;
	PP1000WriteBank0(address, val);
        w++;
    } while(LIMIT(w,MAXPAR));
}

/***************************************************************************
 * Name:     findBest
 *
 * Purpose:  Locates the best individual in the population
 * 
 * Inputs:   Nothing
 *
 * Returns:  The individual number
 * 
 ***************************************************************************/
PopIndex findBest(void)
{
    PopIndex i, besti;
    UINT32 fit, best;
    MainPopIndex address;

    i     = 0;
    besti = 0;
    best  = -1;

    do {
        indexToAddr(i, address);
	PP1000ReadBank0(fit, address+FITN);
        if(UnsignedLt(fit, best,4)){
	        best = fit;
	        besti = i;
        } else {
            delay;
        }
        i = i + 1;       
    } while(LIMIT(i,POPSIZE));
    return besti;
}

/***************************************************************************
 * Name:     findWorst
 *
 * Purpose:  Locates the worst individual in the population
 * 
 * Inputs:   Match. If true then don't select the individual supplied as
 *           the second parameter
 *
 * Returns:  The individual number
 *
 * Notes:    Does not choose any individuals in workingPop
 * 
 ***************************************************************************/
PopIndex findWorst(Bool match, PopIndex ind)
{
    PopIndex i, worsti;
    UINT32 fit, worst;
    MainPopIndex address;
    UINT32      ctrl;

    PAR {
      i      = 0;
      worsti = 0;
      worst  = 0;
    }

    do {
        indexToAddr(i, address);
	PP1000ReadBank0(fit, address+FITN);
	PP1000ReadBank0(ctrl,address|CONTRL);
	if(match && ind != i) {    /* Process if match is 0 or i is not ind */
	  if(!InWork(ctrl) && UnsignedGt(fit, worst, 4)) {
	    PAR {
	      worst = fit;
	      worsti = i;
	    }
	  } else {
        delay;
      }
	} else {
        delay;
    }
        i = i + 1;       
    } while(LIMIT(i,POPSIZE));
    return worsti;
}


/***************************************************************************
 * Name:     printProg
 *
 * Purpose:  Prints the given program to the output channel
 * 
 * Inputs:   Nothing
 *
 * Returns:  The individual number
 * 
 ***************************************************************************/
macro proc printProg(idx)
{
  WorkIndex w;
  Index i;
  UINT32 word;
  Index  len;

  PAR {
    w = 0;
    i = START;
  }
  readIn(idx,w);

  word = WorkingPop(phBreed,w,PROGN);
  dooutdata(IND, adju(word,8));
  word = WorkingPop(phBreed,w,FITN);
  dooutdata(FIT, adju(word,8));
  len = adju(WorkingPop(phBreed,w,PLEN), IDXW);
  dooutdata(LEN, adju(len,8));

  while(len) {  /* Guard against zero length programs */
      PAR {
	    word = WorkingPop(phBreed,w,i);
	    i = i + 1;
      }
      dooutdata(FUNC,adju(GetOpcode(word),8));
      dooutdata(EA1,adju(GetEa1(word),8));
      dooutdata(EA2,adju(GetEa2(word),8));
      len--;
    }
}

macro proc printStats()
{
  dooutdata(NMUTATE, nmutate);
  dooutdata(NXOVER, nxover);
  dooutdata(NCOPY, ncopy);
}

macro proc printGen(g)
{
#if !defined HANDELC
  printf("Generation %d\n", g);
#else
    dooutdata(99,g);
#endif
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
MAINTYPE main MAINARGS
{
  /* Control variables to drive pipeline */
  Bool        doBreed, doEval, doWriteBack, done1, done2, evalDone;
  Generation_w  generation;
  Bool        stat, stat3;
  PopIndex    best;

#ifndef HANDELC
  if(argc >1) {
    if(strcmp(argv[1], "-s") == 0) {
    	newseed = 1;
    }
  }
  stopon=1;
#endif

#if !defined DEBUG
  /* Wait for the host to tell us to start */
  PP1000SetGPI(0);    
  while(PP1000ReadGPO() == 0)
    delay;
#endif  

  /* Initialise variables etc */
  PAR {
    phBreed     = 0;
    phEval      = 0;
    doBreed     = 0;
    doEval      = 0;
    doWriteBack = 0;
    done1       = 0;
    done2       = 0;
    evalDone    = 0;
    generation  = GENSIZE;
    randseed();
  }
  
  /* Claim all banks of memory for the duration */
  PP1000RequestMemoryBank(1);
  PP1000RequestMemoryBank(2);
  PP1000RequestMemoryBank(3);
  PP1000RequestMemoryBank(4);
  
  PAR {
#if defined HANDELC
    /* Run the random number generator in parallel with everything else */
    SEQ {
      while(1) random();
    }
    
#endif
    SEQ {
      /* Build the initial population */
      initPop();
      
      /* 
       * Run the main pipeline. This will process MAXPAR individuals per pass
       * A generation is done when POPSIZE/MAXPAR individuals have been done
       * so the total number of passes is GENSIZE * (POPSIZE/MAXPAR) 
       */
      do {
	PAR {
 		        	/* The selection phase */
	  SEQ {
	    if(doWriteBack) {
	      WAIT(evalDone);   /* Wait until the evaulate is done */
	      writeBack();      /* Then write it back */

	      /*
	       * If the eval phase has found a termination condition
	       * then flush the last breed individuals to SRAM
	       * and then indicate that the main loop should
	       * terminate
	       */
	      if(done1) { 
		    TOGGLE(phBreed);
		     writeBack();
		     done2 = 1;      /* And signal that we can finish */
	      } else {
            delay;
          }
	    } else {
            delay;
        }
	    selection();        
	    breed();
	    doEval=1;
	    TOGGLE(phBreed);
	  }
	  /* The eval phase (only starts when we have done the 1st breed) */
	  SEQ {
	    if(doEval && !done1) {
	      evaluate();
	      if(stat3 && stopon) {
		    /* indicate that we have a 100% correct solution */
		    done1 = 1;  /* Used to stop the eval phase next time  and
			     * to tell the breed phase to flush both
			     * phases in Working Pop to SRAM
			     */
	      } else {
            delay;
          }
	      doWriteBack = 1;  /* Allow writeback to operate */
	      evalDone = 1;     /* Tell write back to start copying */
	      TOGGLE(phEval);
	    } else {
	      delay;
	    }
	  } /* SEQ */
	} /* PAR */
	
	/* Calculate fraction of generation done and maintain 
	   generation counter*/
	generation--;
      } while(!done2 && generation);
      
      /* Indicate that we have finished */
      PP1000SetGPI(1);
      
      /* Find the best individual and emit the details */
      best = findBest();
      printProg(best);
      printStats();
      
      /* Release all banks */
      
      PP1000ReleaseMemoryBank(4);
      PP1000ReleaseMemoryBank(3);
      PP1000ReleaseMemoryBank(2);
      PP1000ReleaseMemoryBank(1);
      
      /*
       * This marks the end of the GP algorithm.
       * The machine will still be running the random number
       * generator however until the machine is reset
       */        
    } /* SEQ */
    
  } /* par */
#if !defined HANDELC
  if(doDump)
    dumpProgs();
#endif
  MAINRET;
}




/***************************************************************************
 * Name:     genNode
 *
 * Purpose:  Generate an instruction node
 * 
 * Inputs:   Nothing
 *
 * Returns:  A word containing the bit pattern for the node
 *
 * Note:     Assumes an 8bit instruction format
 * 
 ***************************************************************************/
macro proc genNode(instruction)
{
  FuncType f;
  Register r1,r2;

  f = randInstruction();
  r1 = randEa();
  r2 = randEa();
  instruction = MakeInstruction(f,r1,r2);
}


/***************************************************************************
 * Name:     makeProg
 *
 * Purpose:  Make an individual program.
 * 
 * Inputs:   The phase to write to (1st index into block select ram )
 *           The individual number within the phase (2nd index into ram )
 *
 * Returns:  Nothing
 *
 * Notes:    We generate the maximal number of instructions regardless
 *           of the actual length to simplify the logic. It is not an expensive
 *           operation in the general scheme of things.
 * 
 ***************************************************************************/
macro proc makeProg(phase) 
{ 
    PC        proglen;
	PC        icount;
    Index     i;
    static    ProgNum progNum = 0;  
    UINT8 n1, n2, n3, n4;  
    UINT32  val;

    /* 
    * Determine initial program length. We ensure that this is greater than 0 
    */
    do {
      proglen = randPC();
    } while(!proglen);
	/*
	* Initialise the program in block select memory 
	*/
    WorkingPop(phase,0,PLEN)    = adju(proglen,32);
    WorkingPop(phase,0,PROGN)   = adju(progNum,32);
    WorkingPop(phase,0,FITN)    = DEFAULT_FITNESS;
	PAR {
    	progNum++;
    	i = START;
		icount = 0;
	}
    do {
        genNode(n1);
        genNode(n2);
        genNode(n3);
        genNode(n4);
		val = MakeCombined(n4,n3,n2,n1);
        WorkingPop(phase,0,i) = val;
		PAR {
        	i++;
			icount++;
		}
    } while(LIMIT(icount,MAXPROGLEN));
}



/***************************************************************************
 * Name:     writeBackInd
 *
 * Purpose:  Writes an individual back to external SRAM from on-chip
 *           block select ram.
 * 
 * Inputs:   The phase to use (1st index into ram arrays)
 *           The individual number (2nd index into ram arrays )
 *
 * Returns:  Nothing
 * 
 * Note:     The address to write to is calculated by taking the 
 *           individual number and multiplying by the program size.
 *           The instructions are packed into 32 bit words to make memory
 *           access more efficient.
 ***************************************************************************/
macro proc writeBackInd(phase, ind)
{
  MainPopIndex address;
  UINT32 val;
  Index   j;
  Index   count;
  PopIndex num;

  num = WorkingPop(phase,ind,PROGN);
	
  PAR {
    indexToAddr(num, address);
    j = 0;
	count = 0;
  }

  /* Clear the inworking bit */
  val = WorkingPop(phase,ind,CONTRL);
  WorkingPop(phase,ind,CONTRL) = 0;
	
	
  do {
    val = WorkingPop(phase,ind,j);
    PP1000WriteBank0(address,val);
	PAR {
    	address++;
		j++;
  		count++;
	}
  } while(count != MAXNODES);
}

/***************************************************************************
 * Name:     readIn
 *
 * Purpose:  Reads an individual from external SRAM
 * 
 * Inputs:   i   = The individual number in the main population
 *           ind = The individual in working ram
 *
 * Returns:  Nothing
 * 
 * Note:     The address to write to is calculated by taking the 
 *           individual number and multiplying by the program size
 *           The individual is marked as being in workingPop
 ***************************************************************************/
macro proc readIn(i, ind)
{
  MainPopIndex address;
  UINT32 val;
  Index   j;
  Index   count;

  PAR {
    indexToAddr(i, address);
    j = 0;
	count = MAXNODES;
  }

  /*
   * Mark this individual as being in workingPop
   */
  PP1000ReadBank0(val, address|CONTRL);
  val |= 1;
  PP1000WriteBank0(address|CONTRL,val);
  do {
    PP1000ReadBank0(val, address);
    PAR {
        WorkingPop(phBreed,ind,j)  = val;
        j++;
        address++;
	    count--;
    }
  } while(count);
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
 * Note:     Side effect is to construct the programs in external SRAM
 *           The programs are built in the block ram first then copied to the
 *           external SRAM.
 *           The fitness of the built programs is evaluated as part of this
 *           before they are written back so that we start with a full set
 *           of fitness cases
 *           Two of the block select rams are used for the different phases
 *           which ensures that we don't break the rule about reading/writing
 *           to a block select ram more than once per clock cycle.
 ***************************************************************************/
macro proc initPop()
{
  Phase create, evaluate;
  Bool  doeval, stat1, stat3, done;
  PopIndex idx;
  WorkIndex  w;
  Fcase  curFit;
    
  PAR {
    create   = 0;
    evaluate = 0;
    doeval   = 0;
    idx      = 0;
    done     = 0;
    w 	     = 0;
    curFit = 0;
  }
  
  /* This pipeline is controlled by the doxxxx flags.
   * they are arranged so that they sequence the stages correctly */
  do {
    PAR {
		SEQ {       /* 1st par sequence */
	      	PAR {
				makeProg(create);
				doeval = 1;
				TOGGLE(create);
	      	}
		} /* SEQ */
    
		SEQ {    /* 2nd par sequence */
	  		if(doeval) {
				curFit = 0;   /* Index into fitness cases */
				do {
	  				evalProg(evaluate, w);
			  		curFit++;
				} while(LIMIT(curFit,MAXFITNESS));
	
				/* 
			 	* Now write the program to main memory 
	 			*/
				writeBackInd(evaluate, w);
				PAR {
					TOGGLE(evaluate);
					idx++;     /* The loop index is incremented here
		    					* because this is the last phase in the 
							    * pipeline and the pipeline should
							    * only terminate when the last phase has done
							    * sufficient passes
							    */
				}
				if(!LIMIT(idx,POPSIZE))
				  		done = 1;  /* Signal that we have done */
				else
	  					delay;
     		} else {
				delay;
     		}
    	}  /* SEQ */
	}  /* PAR */
  } while(!done);
}


#if !defined HANDELC
/*************************************************************************** 
 * iso-c stubs for PP1000 and macro expression/procs
 **************************************************************************/
char * stoi(int v)
{
  static char b[10];
  sprintf(b, "%d", v);
  return b;
}

unsigned long sram[POPSIZE*MAXNODES];
UINT32 READRAM(unsigned long addr)
{
  return sram[addr];
}

void WRITERAM(unsigned addr, unsigned val)
{
  sram[addr] = val;
}

UINT32 MakeCombined(unsigned long a,unsigned long b,unsigned long c,unsigned long d)
{
  unsigned result = 0;

  result = a<<24|b<<16|c<<8|d;
  return result;
}

UINT8 MakeInstruction(unsigned long a,unsigned long b,unsigned long c)
{
  unsigned result = 0;

  result = a<<4|b<<2|c;
  return result;
}

/*
 * Random number routines for a regular ANSI-C system
 */
FILE *randlog;
RandReg randReg;    /* The register used for generating the number */
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
 /* fprintf(randlog, "%lu\n", randReg);*/

 randReg = rand();
 return randReg;
}


void randseed(void)
{
	FILE *fp;
	time_t t;

	t = time(NULL);
	if(newseed) {
		fp=fopen("c:/tmp/seed.dat", "w");
		fprintf(fp, "%lu", t);
		randReg = t;
	} else {
		fp=fopen("c:/tmp/seed.dat", "r");
		fscanf(fp, "%ld", &randReg); 
	}
	fclose(fp);
	if(!tree) {
		printf("SEED=%ld\n", randReg);	
	}
	randlog=fopen("c:/tmp/c_randlog.dat", "w");
	srand(randReg);
}

PC randPC()
{
  return s_random() & (MAXPROGLEN-1);
}

Method randMethod()
{
  static const UINT8 mask1 = 0x1f;
  static const UINT8 mask2 = 0xfc;
  UINT8 mask3;
  UINT8 mask4;
  UINT8 v, v1, v2, v3, v4;

  PAR {
    v = adju(randReg,8) & 0xff;
    mask3 = ~mask1;
    mask4 = ~mask2;
  }

  PAR {
    v1 = v&mask1;
    v2 = v&mask2;
    v3 = v&mask3;
    v4 = v&mask4;
  }
  if(!v3&&v1)
    return MUTATE;
  else if(!v4&&v2)
    return COPY;
  else
    return XOVER;
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

UINT32 randBit()
{
  return rand();
}

void dooutdata(int v1, int v2)
{
  char * vs1 = "";
  char * vs2 = "";
  static  char buf[100];

  switch(v1) {
  case LEN:
    vs1 = "Length";
    vs2 = stoi(v2);
    break;
  case GEN:
    vs1 = "Generation";
    vs2 = stoi(v2);
    break;
  case IND:
    vs1 = "Individual";
    vs2 = stoi(v2);
    break;
  case FUNC:
    vs2 = "";
    switch(v2) {
    case AND:
      vs2="AND";
      break;
    case OR:
      vs2="OR";
      break;
    case NAND:
      vs2="NAND";
      break;
    case NOR:
      vs2="NOR";
      break;
    default:
      sprintf(buf, "Unkown Opcode");
      break;
    }
    vs1 = "FUNC";
    break;
 case EA1:
   vs1 = "Ea1";
   vs2 = stoi(v2);
   break;
 case EA2:
   vs1 = "Ea2";
   vs2 = stoi(v2);
   break;
 case K:
   vs1 = "K";
   vs2 = stoi(v2);
   break;
 case FIT:
   vs1 = "Fitness";
   vs2 = stoi(v2);
   break;
  case INIT:
    vs1 = "InitPop";
    vs2 = stoi(v2);
    break;
  case NMUTATE:
    vs1="Mutate";
    vs2=stoi(v2);
    break;
  case NXOVER:
    vs1="Crossover";
    vs2=stoi(v2);
    break;
  case NCOPY:
    vs1="Copy";
    vs2=stoi(v2);
    break;
 default:
   sprintf(buf,"Unknown op (%d)", v1);
   vs1 = buf;
   vs2 = stoi(v2);
   break;
  }
  printf("%s -> %s ",vs1, vs2);
}

/* iso-c debug function to print the entire set of programs in 
 * simulated SRAM */
void dumpProgs(void)
{
  int  i;
  int  j;

  printf("\n----------------------------\n");
  for (i=0; i < POPSIZE; i++ ) {
    j = i*MAXNODES;
    printf("Index %d Prog %ld Len %ld Fit %ld Ctrl %ld\n", i, sram[j+PROGN],
	   sram[j+PLEN], sram[j+FITN], sram[j+CONTRL]);
  }
}
#endif
