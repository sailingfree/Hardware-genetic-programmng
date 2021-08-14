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
 * -DDEBUG       for compliling for the handelc simulator
 *               if this is not defined but HANDELC is then it will compile
 *               for EDIF
 * 
 * -DPOPSIZE     Overrides the default population size
 * -DMAXPROGLEN  Overrides the default maximum progam length
 * -DPROBLEM=xxx Set the problem to compile for
 *               XOR
 *               ANT
 ***************************************************************************/

#define VERSION "1.0"


#ifndef HANDELC
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#else
#ifdef DEBUG

set clock = external "P35";

#else
/*
 * Include RC1000-PP support header file
 */
#define PP1000_BOARD_TYPE PP1000_V2_VIRTEX
#define PP1000_CLOCKRATE  80
#define PP1000_32BIT_RAMS
#define PP1000_DIVIDE1
#include <pp1000.h>

#endif  /* DEBUG */
#endif  /* !HANDELC */

#include <stdlib.h>

#include <hwgph.h>

/* Define the internal population storage
* this is a subset of the full population that is held in external
* static RAM. These are used for internal operations.
* There are 2 separate sets of individuals in ram here.
* Each one is used for a different phase of the pipeline 
* The working ram is arranged as WORDLEN bit words. The evaluation
* function will decode this into instruction sized chunks as needed.
*/
mpram {
    RAM Word ReadWriteA[MAXNODES];
    RAM Word ReadWriteB[MAXNODES];                                  
} workingPop  [MAXPHASE*MAXPAR] WITHBLOCK;

mpram {
    RAM Bool  ReadWriteA[POPSIZE];
    RAM Bool  ReadWriteB[POPSIZE];
}populationControl WITHBLOCK;

#if !defined HANDELC
int marked[POPSIZE];
#endif
mpram {
    RAM Word  ReadWriteA[POPSIZE];
    RAM Word  ReadWriteB[POPSIZE];
}populationFitness WITHBLOCK;

mpram {
    RAM Word  Read[POPSIZE];
    RAM Word  ReadWriteB[POPSIZE];
}populationLen WITHBLOCK;

/* Storage for the population control information
* This can be processed in parallel with the main population */
mpram {
    RAM Word   ReadWriteA[MAXPAR] ;
    RAM Word   ReadWriteB[MAXPAR] ;
} workingLen [MAXPHASE] WITHBLOCK;

mpram {
    RAM    PopIndex  ReadWriteA[MAXPAR];
    RAM    PopIndex  ReadWriteB[MAXPAR];
} workingprogNum[MAXPHASE] WITHBLOCK;

mpram {
    RAM Word      Read[MAXPAR];
    RAM Word      Write[MAXPAR];
}workingFitness      [MAXPHASE]  WITHBLOCK;


RAM Word      workingParentFitness[MAXPHASE] [MAXPAR] WITHBLOCK;

UINT32        cycles; /* Count of cycles executed in main program */
Bool          running; /* Control the measurement of cycles */

#if 1
#if DEBUG
/* Provide some storage for sram if we are using the simulator */
ram UINT32  sram[4][POPSIZE*MAXNODES] WITHBLOCK;
#define RAMW (log2ceil(POPSIZE*MAXNODES))

macro proc PP1000WriteBank0(C_UINT addr, C_UINT val)
{
    sram[0][adju(addr,RAMW)]=val;
}

macro proc PP1000WriteBank1(C_UINT addr, C_UINT val)
{
    sram[1][adju(addr,RAMW)]=val;
}


macro proc PP1000ReadBank0(C_UINT val, C_UINT addr)
{
    val = sram[0][adju(addr,RAMW)];
}

macro proc PP1000ReadControl(x)
{
    x=1;
}

macro proc PP1000WriteStatus(x)
{

}

#endif


#if defined ANT
static UINT32 initialMap[32] = {
  0x0000000e,
  0x00000008,
  0x0e000008,
  0x21000008,
  0x21000008,
  0x00601f78,
  0x20001000,
  0x00101000,
  0x00101000,
  0x20101000,
  0x00100000,
  0x00001000,
  0x20001000,
  0x00101000,
  0x1c101000,
  0x00820000,
  0x00000000,
  0x00001000,
  0x01011000,
  0x08011000,
  0x00011000,
  0x00011000,
  0x04001000,
  0x00801000,
  0x00010f98,
  0x00010002,
  0x00010002,
  0x00007f02,
  0x00000082,
  0x00000080,
  0x0000003c,
  0x00000000,
};

/* The active maps for the evalProgs to use */
RAM UINT32    map[MAXPAR][GRIDX];

/* Init the maps from the initialMap */
macro proc initMap(C_UINT i)
{
    unsigned int p;
    Bool     done;

    p = 0;
    do {
        map[i][p]=initialMap[p];
        PAR {
	        p++;
            done = (p == 31);
        }
    } while(!done);
}
#endif

/*
* Define some control variables
*/
#if !defined HANDELC
Bool tree   = 0;   /* If true then print program tree */
Bool newseed= 0;   /* If true then ANSI_C version will generate seed */
#endif
Bool stopon = 0;   /* If true then stop if 100% correct prog */

UINT8 nbreed, nxover, ncopy, nmutate;

Phase phBreed;
Phase phEval;
Phase phWriteback;
unsigned char good = 0;

/* 
 * Generic GP  function prototypes 
 */
macro proc  initPop();
macro proc  writeBack();
macro proc writeBackInd(C_UINT phase, C_UINT ind);
macro proc readIn(C_UINT i, C_UINT ind);
macro proc findBest(C_UPTR best);
macro proc RandomGen();
macro proc evalProg(C_UINT indx);
macro proc CycleCount();

/*
 * output channel
 */
#ifdef HANDELC
/*chanout stdout;*/
chanout Short logout;
macro proc dooutdata(C_UINT c, C_UINT v)
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
macro proc random()
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

macro proc RandomGen()
{
  while(1) {
    random();
  }
}

macro proc CycleCount()
{
  while(1) {
    if(running) {
        cycles++;
    } else {
        delay;
    }
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
macro proc randseed()
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
macro expr randPC() = 0@randReg[PROGW-1:0];

macro expr randLen() = 0@randReg[PROGW-1:0]|1;

macro proc randMethod(method)
{
#define mask1 0x1f
#define mask2 0xfc
#define mask3 (~mask1)
#define mask4 (~mask2)

  UINT8 v, v1, v2, v3, v4;

  v = adju(randReg,8);
  PAR {
    v1 = v&mask1;
    v2 = v&mask2;
    v3 = v&mask3;
    v4 = v&mask4;
    method = XOVER;   /* Default method */
  }

  /* This long winded code generates shallow logic as 
     compared to a long if-then-else chain */

  /* Only override if we have the less probable cases */
  if(!v3&&v1)
    method = MUTATE;
  else 
    delay;
  if(!v4&&v2)
    method =  COPY;
  else 
    delay;
}

macro expr randPopIndex() = randReg[POPW-1:0];

macro expr randEa() = randReg[REGW-1:0];

macro expr randInstruction() = randReg[FTW-1:0];


macro expr randBit() = randReg;
#endif

macro proc mutate(C_UINT ind)
{
    Index           address;
    Phase           ph;

    ph = phBreed;
    /* Select an instruction to mutate */
    address = randPC() & adju(WorkingLenRead(ph,ind), IDXW);
    WorkingPopWrite(ph, ind, address, genNode());
}


/* Copy individual at work index w to work index w+1 
* w is used directly and is always even (bit 0 == 0) and
w+1 is always odd (bit 0 == 1) */
macro proc copyInd(C_UINT w)
{
  Word    val;
  Index_1     count;
  Index       i;
  Phase       ph;
  Bool        done;

  PAR {
    i  = 0;
    count = 0;
    ph = phBreed;
  }

  do {
    WorkingPopRead(ph,w, i, C_ADDR val);
    WorkingPopWrite(ph,w | 1, i, val);
    PAR {
        count++;
        i++;
        done = (count == MAXNODES-1);
    }
  }while(!done);
}

macro proc xover(C_UINT w)
{
  Word  val, val2;
  Word  len1;
  Word  len2;
  PC      x1, x2;
  PC      i1, i2;
  Index  idx1, idx2;
  Index  count1, count2;
  Phase    ph;

  ph = phBreed;
  /*
   * Choose two crossover points at random and get the program lengths
   */
  PAR {
    x1 = randPC();
    len1 = WorkingLenRead(ph,w);
  }
  PAR {
    x2 = randPC();
    len2 = WorkingLenRead(ph,w | 1);
  }

	/*
	* Crudely adjust the crossover points so that they lie within the 
	* individual
	*/
  PAR {
    x1 &= adju(len1, PROGW);
    x2 &= adju(len2, PROGW);
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
        idx1 = i1;
        idx2 = i2;
    }
    PAR {
        WorkingPopRead(ph, w, idx1, C_ADDR val);
        WorkingPopRead(ph,w | 1, idx2, C_ADDR val2);
    }
    PAR {
        WorkingPopWrite(ph,w,idx1, val2);
        WorkingPopWrite(ph, w | 1, idx2, val);
    }
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
   * Adjust the lengths - broken into 2 bits to speedup the logic
   */
   PAR {
        len1 = adju(x1 + (adju(len2,PROGW)), WORDW);
        len2 = adju(x2 + (adju(len1,PROGW)), WORDW);
   }
   PAR {
        len1 = len1 - adju(x2, WORDW);
        len2 = len2 - adju(x1, WORDW);
   }
    /* Guard against zero length programs whcih are no good at all */
    if(!len1) {
      len1 = randLen();
    }

    if(!len2) {
      len2 = randLen();
    }
    len1 &= MAXNODES-1;
    len2 &= MAXNODES-1;

    PAR {
        WorkingLenWrite(ph, w) =  len1;
        WorkingLenWrite(ph, w | 1) =  len2;
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
  Word         fit1,fit2;
  Phase        ph;
  Word         fit;

#if 0
#if defined HANDELC && !defined DEBUG
    interface fastlt(unsigned 1 A_LT_B)
        FastLt(Word A=fit1, Word B=fit2) with {busformat="B<I>"};
#endif
#endif

  PAR {
    w = 0;
    ph = phBreed;
  }

  do {
    /* 
     * Find 2 individuals that are not the same and that are not in 
     * workingPop
     */
    do {
      i1 = randPopIndex();
      fit1 = populationFitness.ReadWriteA[i1];
    } while(populationControl.ReadWriteA[i1]);

    do {
      i2 = randPopIndex();
      fit2 = populationFitness.ReadWriteA[i2];
    } while(populationControl.ReadWriteA[i2] || i1 == i2);
    /*
     * Choose the one with best fitness. 0 is best!
     */
    i = UnsignedLt(fit1, fit2, MAXFITW) ? i1 : i2;
    /*
     * Read it into workingPop and remember the fitness in the parent array
     */
    readIn(i,w);
    fit = adju(workingFitness[ph].Read[w], WORDW);
    workingParentFitness[ph][w] = fit;
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
macro proc breed()
{
  WorkIndex count1, count2;
  WorkIndex_1 loop;
  Method    method;

#if !defined PRESET
    /* Count1 and count2 get incremented twice in the do loop */
  PAR {
    count1 = 0;
    count2 = 0;
    loop   = 0;
  }

  do {
    /* 
     * Select breed method
     */
    PAR {
        randMethod(C_ADDR method);
        count2++;   /* Now count 2 = count1+1 */
    }

    xover(count1);
    switch(method) {
        case MUTATE:
            mutate(count1);
            PAR {
                mutate(count2);
                nmutate++;
            }
            break;
        case XOVER:
            PAR {
                xover(count1);
                nxover++;
            }
            break;
        default:
            PAR {
                copyInd(count1);
                ncopy++;
            }
            break;
    }
    loop++;
  }while(!BITSET(loop, MAXPAR));
#endif
}

/***************************************************************************
 * Name:     replacement
 *
 * Purpose:  Replaces an individual with the newly evaluated individual.
 *
 * Inputs:   The PAR number
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
macro proc replacement()
{
    /* Decide whether the evaluated individual will replace 
     * the corresponding w'th parent */
    WorkIndex w;
    Phase     ph;
    Word      myFit;
    Word      parentFit;
    Bool      better;

#if 0 
#if defined HANDELC && !defined DEBUG
    interface fastle(unsigned 1 A_LE_B)
        FastLe(Word A=myFit, Word B=parentFit) with {busformat="B<I>"};
#endif
#endif

    PAR {
      w = 0;
      ph = phEval;
    }

    do {
        /* See if new individual is better than or the same as it's parent */
        PAR {
            myFit = workingFitness[ph].Read[w];
            parentFit = workingParentFitness[ph][w];
        }
        better = UnsignedLe(myFit,parentFit, MAXFITW);
        if(better && myFit != 0) {
            delay;   /* 
                      * Yes it is so leave the indicator set 
                      * so it gets written back 
                      */
        } else {
                    /* 
                     * The new program is worse than the worst parent so discard it
                     * by clearing the control bit so it doesn't get written back 
                    */
            populationControl.ReadWriteB[WorkingprogNumWrite(ph,w)] = 0;
        }
        w++;
    } while(LIMIT(w,MAXPAR));
}

/***************************************************************************
 * Name:     evaluate
 *
 * Purpose:  Evaluates the fitness of all individuals in working ram pointed 
 *           to by phEval;
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
macro proc evaluate()
{
    unsigned work;
    
    evalProg(0);
    /*
    FORPAR(w=0; w<MAXPAR;w++) {
        evalProg(w);
    }*/
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
macro proc findBest(C_UPTR best)
{
    PopIndex_1      count;
    Word            fit, bestf;

    PAR {
        bestf = -1;
        count = 0;
    }

    do {
        fit = populationFitness.ReadWriteA[adju(count, POPW)];
        if(UnsignedLt(fit, bestf, MAXFITW)){
            bestf = fit;
            C_PTR best  = adju(count, POPW);
        } else {
	        delay;
        }
        count++;     
    } while(!BITSET(count,POPSIZE));
}


macro proc donl()
{
#if !defined HANDELC
  printf("\n");
#endif
}

/***************************************************************************
 * Name:     printInstruction
 *
 * Purpose:  Prints the given program to the output channel
 * 
 * Inputs:   Nothing
 *
 * Returns:  The individual number
 * 
 ***************************************************************************/
macro proc printInstruction(C_UINT word)
{
  dooutdata(FUNC,adju(GetOpcode(word),8));
  dooutdata(EA1,adju(GetEa1(word),8));
  dooutdata(EA2,adju(GetEa2(word),8));
  donl();
}

macro proc printProg(C_UINT idx)
{
  WorkIndex w;
  Index i;
  Word word;
  PopIndex prog;
  Index_1  len;
  Index_1 count;  /* We rely on the use of a carry into bit 
		     IDXW+1 to detect the end of the loop */

  PAR {
    w = 0;
    i = 0;
  }
  readIn(idx,w);

  prog = WorkingprogNumRead(phBreed,w);
  dooutdata(IND, adju(prog,8));
  donl();
  word = adju(WorkingFitnessRead(phBreed,w), WORDW);
  dooutdata(FIT, adju(word,8));
  donl();
  len = adju(WorkingLenRead(phBreed,w), IDXW+1);
  dooutdata(LEN, adju(len,8));
  donl();
  count = MAXNODES - len;

  while(!BITSET(count, MAXNODES)) {  /* Guard against zero length programs */
    WorkingPopRead(phBreed,w,i, C_ADDR word);
	i = i + 1;
    printInstruction(word);
    count++;
  }
#if defined ANT && !defined HANDELC
  for(i=0;i<len;i++) {
    WorkingPopRead(phBreed,w,i,C_ADDR word);
    printf("%d %d %d\n", GetOpcode(word), GetEa1(word), GetEa2(word));
  }
#endif
}

macro proc printStats()
{
  dooutdata(NMUTATE, nmutate);
  dooutdata(NXOVER, nxover);
  dooutdata(NCOPY, ncopy);
}

macro proc printGen(C_UINT gen)
{
  dooutdata(GEN, gen);
}


macro proc dumpResults()
{
    MainPopIndex   page0;
    MainPopIndex   page1;
    MainPopIndex   page2;
    PopIndex_1     idx;
    Word           fit, len;
    Index          i;

    PP1000RequestMemoryBank(2);
    PAR {
        idx      = 0;
        page0    = 0;
        page1    = POPSIZE;
        page2    = POPSIZE*2;
    }
    PP1000WriteBank1(page0 | 1, GENSIZE);
    PP1000WriteBank1(page0 | 2, GENERATIONS);
    PP1000WriteBank1(page0 | 3, MAXPAR);
    PP1000WriteBank1(page0 | 4, MAXPROGLEN);
    PP1000WriteBank1(page0 | 5, PROBLEMTYPE);
    PP1000WriteBank1(page0 | 6, cycles);
    PP1000WriteBank1(page0 | 7, POPSIZE);
    do { 
        PAR {
            fit = populationFitness.ReadWriteA[adju(idx,POPW)];
            len = populationLen.Read[adju(idx,POPW)];
        }
        PP1000WriteBank1(page1 | adju(idx, SRAMW), adju(fit, 32));
        PP1000WriteBank1(page2 | adju(idx, SRAMW), adju(len, 32));
#if DEBUG
        dooutdata(FIT, adju(fit,8));
        dooutdata(LEN, adju(len,8));
#endif
        idx++;        
    }while(!BITSET(idx, POPSIZE));
    PP1000ReleaseMemoryBank(2);
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
  Bool          doEval;
  Bool          selectionDone;
  Generation_w  generation;
  PopIndex      best;
  unsigned char ctrl;

#if !defined HANDELC && !defined PSIM
  if(argc >1) {
    if(strcmp(argv[1], "-s") == 0) {
    	newseed = 1;
    }
  }
  stopon=1;
#endif

  /* Wait for the host to tell us to start */
  PP1000ReadControl(ctrl);

  /* Initialise variables etc */
  PAR {
    phBreed     = 0;
    phEval      = 1;   /* Delayed by one pass so starts at 1 */
    doEval      = 0;
    generation  = 0;
    cycles      = 0;
    randseed();
  }

  PP1000RequestMemoryBank(1);
  PP1000WriteStatus(1);
  running = 1;
  PAR {

    /* Count cycles */
    /*CycleCount();*/

    /* Run the random number generator */
    RandomGen();

    SEQ {
      /* Build the initial population */
      initPop();   /* Uses phase 0 */  
    
/*      drawGraph(populationLen, POPSIZE);*/

      /* 
       * Run the main pipeline. This will process MAXPAR individuals per pass
       * A generation is done when POPSIZE/MAXPAR individuals have been done
       * so the total number of passes is GENSIZE = GENERATONS * (POPSIZE/MAXPAR) 
       */
        do {
             selectionDone = 0;
	         PAR {
 		        	/* The selection block */
	            SEQ {
                    phWriteback = phBreed;   /* Write back this phase before we overwrite it */
	                writeBack();   
	                selection();  
                    selectionDone = 1;      
		            breed();
	                doEval=1;
	            }


            	  /* The eval block (only starts when we have done the 1st breed) */
	            SEQ {
	                if(doEval) {
	                    evaluate();
                        /*
                         * Now perform the replacement
                         */
                        WAIT(selectionDone);
                        replacement();
	                } else delay;
	            } /* SEQ for eval block */
	        } /* PAR for main loop */
            PAR {
	            generation++;
                TOGGLE(phBreed);
                TOGGLE(phEval);
		findBest(C_ADDR best);
		printf("Best = %d -> %d\n", best, populationFitness.ReadWriteA[best]);
            }
      } while(!BITSET(generation, GENSIZE));
      phWriteback = phBreed;
      writeBack();    /* Write the last evaluated individuals */

      /* Tell the cycle counter to stop */
      running = 0;
#if !defined HANDELC
      findBest(C_ADDR best);
      printProg(best);
#endif
      PP1000ReleaseMemoryBank(1);

      /* Write the lengths and fitnesses to the sram */
      dumpResults();

      /*drawGraph(populationLen, POPSIZE);*/

      /* Release all banks and signal that we have finished */
      PP1000WriteStatus(good);
      
      /*
       * This marks the end of the GP algorithm.
       * The machine will still be running the random number
       * generator however until the machine is reset
       */        
    } /* SEQ */
  } /* par */
  MAINRET;
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
macro proc makeProg() 
{ 
    PC        proglen;
    Proglen_1 icount;
    Index     i;
    Phase     zero;
    static PopIndex progNum = 0;

#if defined PRESET
    zero = 0;
    WorkingLen(zero,0) = 12;
    WorkingFitness(zero,0) = DEFAULT_FITNESS;
    WorkingprogNum(zero,0) = progNum;
    populationControl[progNum]= 1;
    progNum++;
    WorkingPopWrite(zero,0,0,0x07);
    WorkingPopWrite(zero,0,1,0x1c);
    WorkingPopWrite(zero,0,2,0x11);
    WorkingPopWrite(zero,0,3,0x07);
    WorkingPopWrite(zero,0,4,0x14);
    WorkingPopWrite(zero,0,5,0x12);
    WorkingPopWrite(zero,0,6,0x0b);
    WorkingPopWrite(zero,0,7,0xc);
    WorkingPopWrite(zero,0,8,0xc);
    WorkingPopWrite(zero,0,9,0xe);
    WorkingPopWrite(zero,0,10,0x19);
    WorkingPopWrite(zero,0,11,0xe);
#else

    /* 
    * Determine initial program length. We ensure that this is greater than 0 
    */
    PAR {
        proglen = randLen();
        zero = 0;
    }
	/*
	* Initialise the program in block select memory 
    * Dont try to optimise the number of nodes to be the length
    * as this will add extra logic.
	*/
    PAR {
        WorkingLenWrite(zero,0)       = adju(proglen, WORDW);
        WorkingFitnessWrite(zero,0)   = DEFAULT_FITNESS;
	    WorkingprogNumWrite(zero,0)   = progNum;
    	i = 0;
	    icount = 0;
        populationControl.ReadWriteB[progNum]= 1;  /* Signal that this should 
		                    			   get written */
	    progNum++;
	}

    do  {
        WorkingPopWrite(zero, 0, i, genNode());
	    PAR {
	        i++;
	        icount++;
	    }
    } while(!BITSET(icount, MAXPROGLEN));
#endif
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
 *           The instructions are packed into WORDLEN bit words to make memory
 *           access more efficient.
 *           The individual is not written back if it does not have it's
 *           control bit set.
 ***************************************************************************/
macro proc writeBackInd(C_UINT phase, C_UINT ind)
{
    MainPopIndex address, addr;
    Index     j,k;
    PopIndex  num;
    Word f,n, word;
    signal UINT32  val;
    Bool   done, done2;

    num = adju(WorkingprogNumRead(phase,ind), POPW);

    if(!populationControl.ReadWriteA[num]) {
        delay;
    } else {          
	
        PAR {
            indexToAddr(num, address);
            j = 0;
            k = 0;
            done = 0;
        }
/*printf("Writing back prognum %d fitness = %d\n", num, WorkingFitnessRead(phase,ind));*/
            SEQ {
                populationControl.ReadWriteA[num] =0;
	            f = WorkingFitnessRead(phase, ind);
	            n = WorkingLenRead(phase, ind);
                populationFitness.ReadWriteA[num] = f;
                populationLen.ReadWriteB[num] = n;
            }


            do  {
                word = WorkingPopGet(phase,ind,j);
                val  = adju(word,BIT32);
                addr = address | adju(j, SRAMW);
                PP1000WriteBank0(addr , val);
                PAR {
                    done2 = (k == MAXNODES-1);
                    j++;
                    k++;
                }
            } while(!done2);
    }
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
macro proc readIn(C_UINT i, C_UINT ind)
{
    MainPopIndex  address;
    signal UINT32        val;
    Index_1       j;
    Word          f,n;
    Phase         ph;
    Bool          done;

    PAR {
        indexToAddr(i, address);
        j = 0;
	    ph = phBreed;
        done = 0;
    }

        SEQ {
            populationControl.ReadWriteA[i]=1;
            f = populationFitness.ReadWriteB[i];
            n = populationLen.Read[i];
	        WorkingFitnessWrite(ph, ind) = f;
	        WorkingLenWrite(ph, ind) = n;
	        WorkingprogNumWrite(ph, ind) = adju(i, POPW);
        }

        do {
            PAR {
                PP1000ReadBank0(val, address | adju(j, SRAMW));
                WorkingPopWrite(ph,ind,adju(j, IDXW), adju(val, WORDW));
                PAR {
                    j++;
                    done = (j == MAXNODES-1);
                }
            }
        } while(!done);
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
  PopIndex_1 idx;
    
  idx      = 0;
  
  do {
      makeProg();
      PAR {
	    writeBackInd(0, 0);
        idx++;
      }
  } while(!BITSET(idx, POPSIZE));
}

/***************************************************************************
 * Name:     writeBack
 *
 * Purpose:  Writes all individuals in working ram pointed to by phWriteback
 *           out to external RAM, and clears the inwork bit for all
 *           individuals still in workingPop.
 * 
 * Inputs:   Nothing
 *
 * Returns:  Nothing
 * 
 ***************************************************************************/
macro proc writeBack()
{
    WorkIndex w;
    
    w = 0;
    do {
        writeBackInd(phWriteback, w);
        w++;
    } while(LIMIT(w,MAXPAR));
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

Word sram[4][POPSIZE*MAXNODES]; /* 4 banks */
Word READRAM(unsigned bank, unsigned long addr)
{
  return sram[bank][addr];
}

void WRITERAM(unsigned bank, unsigned addr, unsigned val)
{
  sram[bank][addr] = val;
}

void MakeCombined(unsigned long a,unsigned long b,unsigned long c,unsigned long d, unsigned long *r)
{
  unsigned result = 0;

  result = a<<24|b<<16|c<<8|d;
  *r = result;
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
 static unsigned int oldbit0=0;
 RandReg  t1, t2, t3, t4, t5, t6;
 t1 = (randReg & (1LL<<TAP1)) >> TAP1;
 t2 = (randReg & (1LL<<TAP2)) >> TAP2;
 t3 = (randReg & (1LL<<TAP3)) >> TAP3;
 t4 = (randReg & (1LL<<TAP4)) >> TAP4;
 t5 = (randReg & (1LL<<TAP5)) >> TAP5;
 t6 = (randReg & (1LL<<TAP6)) >> TAP6;
 bit0 = t1^t2^t3^t4^t5^t6;
 randReg <<= 1;
 randReg |= oldbit0;
 oldbit0 = bit0;
 return randReg;
}

void RandomGen(void)
{
}

void CycleCount(void)
{
}

void randseed(void)
{
#if !defined PSIM
	FILE *fp;
	time_t t;

	t = time(NULL);
	if(newseed) {
		fp=fopen(RANDFILE, "w");
		if(fp) {
		  fprintf(fp, "%lu", t);
		  randReg = t;
		} else {
		  randReg=t;
		}
	} else {
		fp=fopen(RANDFILE, "r");
		if(fp) {
		  fscanf(fp, "%d", &randReg); 
		} else {
		  randReg = time(NULL);
		}
	}
	fclose(fp);
	if(!tree) {
		printf("SEED=%d\n", randReg);	
	}
	randlog=fopen(RANDLOG, "w");
	srand(randReg);
#endif
}

PC randPC()
{
  return s_random() & (MAXPROGLEN-1);
}

PC randLen()
{
  PC r = 0;
  do {
    r = s_random() & (MAXPROGLEN-1);
  }while(r==0);
  return r;
}
void randMethod(Method *method)
{
  static const UINT8 mask1 = 0x1f;
  static const UINT8 mask2 = 0xfc;
  UINT8 mask3;
  UINT8 mask4;
  UINT8 v, v1, v2, v3, v4;

  PAR {
    v = s_random() & 0xff;
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
    *method = MUTATE;
  else if(!v4&&v2)
    *method = COPY;
  else
    *method = XOVER;
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

Word randBit()
{
  return s_random() & 0xff;
}

/***************************************************************************
 * Name:     decodeTerm
 *
 * Purpose:  Print a term for the ant problem
 * 
 * Inputs:   The term number
 *
 * Returns:  a pointer to static data describing the term 
 *
 ***************************************************************************/
#if !defined HANDELC
char * decodeTerm(int t)
{
  static char * termTab[] = {
    "Left", 
    "Right",
    "Move", 
    "Nop",
  };

  if(t<0 || t>3)
    return "Unknown";
  else
    return termTab[t];
}
char * decodeDir(int t)
{
  static char * dirTab[] = {
    "EAST", 
    "SOUTH",
    "WEST", 
    "NORTH",
  };

  if(t<0 || t>3)
    return "Unknown";
  else
    return dirTab[t];
}

#endif

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
#if XOR
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
#endif
#if ANT
  case FUNC:
    vs2 = "";
    switch(v2) {
    case IF_FOOD:
      vs2 = "IF_FOOD";
      break;
    case PROGN2:
      vs2 = "PROGN";
      break;
    default:
      sprintf(buf, "Unknown opcode %d\n", v2);
      vs2=buf;
      vs1="Func";
    }
    break;
 case EA1:
   vs1 = "";
   vs2 = decodeTerm(v2);
   break;
 case EA2:
   vs1 = "";
   vs2 = decodeTerm(v2);
   break;
#endif
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
  printf("%s %s ",vs1, vs2);
}

void     WorkingPopWrite(unsigned int a, unsigned int b, unsigned int c, unsigned int v)
{
  workingPop[a*b].ReadWriteA[c]=v;
}

void     WorkingPopRead(unsigned int a, unsigned int b, unsigned int c, unsigned int *  v)
{
  *v = workingPop[a*b].ReadWriteA[c];
}

Word     WorkingPopGet(unsigned int a, unsigned int b, unsigned int c)
{
  return workingPop[a*b].ReadWriteA[c];
}
 
#endif

/*************************************************************************
 * fitness functions
 ************************************************************************/
#if defined XOR
/***************************************************************************
 * Name:     evalProg
 *
 * Purpose:  Runs a program for an individual
 * 
 * Inputs:   The phase index
 *           the population index (individual)
 *
 ***************************************************************************/
macro proc evalProg(C_UINT indx_in)
{
  Index       pc;   /* Index into words of instructions */
  Index_1     counter;
  Register    ea1, ea2,r;
  Bool        regs[MAXREGS]; 
  Register    i;
  Opcode      opcode;
  Bool        res;
  Word        fit;
  Bool        done;
  Word        word;
  WorkIndex   indx;
  Fcase       curFit;
  Bool        done;
  Phase       ph;



/*
* Per-run initialisation
*/

	WorkingFitnessWrite(phEval,indx) = DEFAULT_FITNESS;
    curFit = 0;

    do {
  /*
   * Per-fitness case initialisation.
   * All done in 1 cycle for Handelc
   * a) Zero the register set
   * b) copy the input parameters
   * c) Set up control variables
   */
  PAR {
    i=0;
    FORPAR (r=2; r < MAXREGS; r++ ) {
      regs[r] = 0;
    }
    regs[0] = BIT0(curFit);
    regs[1] = BIT1(curFit);
    res     = BIT0(curFit) ^ BIT1(curFit);
    pc      = 1;
    counter = MAXNODES - adju(WorkingLenRead(phEval,indx),IDXW_1);
    fit     = WorkingFitnessRead(phEval,indx);
    done    = 0;
    word    = WorkingPopGet(phEval, indx, 0);
    indx    = indx_in;
  }

    do {
      /* Decode the instruction and maintain the counters */
      PAR {
        counter++;
	    ea1 = GetEa1(word);
	    ea2 = GetEa2(word);
	    opcode = GetOpcode(word);
        word = WorkingPopGet(phEval, indx, pc);
        pc++;
        done = (counter == MAXNODES-1);
      }
  
      switch(opcode) {
      case AND:
	    regs[ea1] &= (regs[ea2]);
	    break;
      case OR:
	    regs[ea1] |= regs[ea2];
	    break;
      case NAND:
	    regs[ea1]  = !(regs[ea1] & regs[ea2]);
	    break;
      case NOR:
	    regs[ea1] = !(regs[ea1] | regs[ea2]);
	    break;
      }  /* switch */
    } while(!done);
    /*
     * Calculate the new raw fitness
     */
    if(regs[r0] == res ) {
      fit--;
      WorkingFitnessWrite(phEval,indx) = fit;
    } else {
      delay;
    }

    PAR {
        done = (curFit == MAXFITNESS-1);
        curFit++;
    }
    } while(!done);
}
#endif


#if defined ANT
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
macro proc evalProg(C_UINT indx)
{
  Index       pc;   /* Index into words of instructions */
  Index       len;
  Index_1     counter;
  Opcode      opcode;
  Direction   dir;
  Pos         x;
  Pos         y;
  Pos         ax, ay;
  Food        food;
  Food        eaten;
  Time        timeval;
  Register    ea1, ea2;
  Register    eas[2];
  Bool        flags[2];
  Bool        e;
  Bool        foodHere;
  Index       i;
  Word        word;
  Phase       ph;


    /* 
    * Per run initialisation
    */
   initMap(indx);

  /*
   * Initialisation.
   * All done in 1 cycle for Handelc
   * a) Zero the register set
   * b) copy the input parameters
   * c) Set up control variables
   */
  PAR {
    ph        = phEval;
    food      = MAXFOOD - FOOD;     /* Start all food to collect */
    eaten     = FOOD;
    dir       = EAST;        /* Pointing to the right */
    x         = 0;           /* At the first cell */
    y         = 0;
    timeval   = 0;
    pc        = 0;
    len       = adju(WorkingLenRead(phEval,indx),IDXW);
  }
  do {
      /* Get the 1st word and set up counter. pc is set to 1 for the next get */
      PAR {
        counter = MAXNODES - adju(len, IDXW+1);
	    pc = 1;
        word = WorkingPopGet(ph,indx,0);
      }
    do {
      /* Decode the instruction */
      PAR {
	ea1 = GetEa1(word);
	ea2 = GetEa2(word);
	opcode = GetOpcode(word);
	ax=x;
	ay=y;
	word = WorkingPopGet(ph,indx,pc);
	pc++;
	counter++;
      }
	
      switch(opcode) {
      case IF_FOOD:
	switch(dir) {
	case EAST:  ax++; break;
	case WEST:  ax--; break;
	case NORTH: ay--; break;
	case SOUTH: ay++; break;
	default: delay;   break;
	} /* Switch  dir */
	/* Now check the cell 'ahead' */
	if(MAP(map, indx, adju((ax&31), 6), ay&31)) {
	  PAR {
	    eas[0] = ea1;
	    flags[0]=1;
	    flags[1]=0;
	  }
	} else {
	  PAR {
	    eas[0] = ea2;
	    flags[0]=1;
	    flags[1]=0;
	  }
	}
	break;  /*if_food */
      case PROGN2:
	PAR {
	  eas[0]=ea1;
	  eas[1]=ea2;
	  flags[0]=1;
	  flags[1]=1;
	}
	break;
      }  /* switch */
      /* Now execute the DOTERM proc as many times as needed */
      e = 0;
      do {
	if(flags[e]) {
	  PAR {
	    timeval = BITSET(timeval, MAXTIME) ? timeval : timeval+1;  
	    switch(eas[e]) {
	    case LEFT:
	      dir = (dir-1) & 3; break;
	    case RIGHT:                      
	      dir = (dir+1) & 3; break;
	    case MOVE:                              
	      switch(dir) {                   
	      case EAST:  x++; break;
	      case WEST:  x--; break;
	      case SOUTH: y++; break;
	      case NORTH: y--; break;
	      default: delay;  break;
	      }   
#if !defined HANDELC                                      
	      PAR {                           
		y &= GRIDMASK;            
		x &= GRIDMASK;            
	      }  
#endif
	      foodHere = MAP(map, indx, adju(x,6),y);
	      if(foodHere && !BITSET(food, MAXFOOD)) {  
		PAR {
		  food++; 
		  eaten--;
		  /*		                timeval = 0;*/
		  CLRBIT(map, indx, adju(x,6), y);               
		}
	      } 
	      break;
	    default: delay; break;
	    } /* switch eas */  
	  } /* PAR */                                
	} else {
	  delay;
	}
	TOGGLE(e);
      }while(e);
    } while(!BITSET(counter, MAXNODES));
  } while(!BITSET(timeval, MAXTIME) && !BITSET(food, MAXFOOD));
  /*
   * Calculate the new raw fitness
   */
  WorkingFitnessWrite(ph, indx) = eaten;
#if !defined HANDELC
  if(eaten == 0) {
      printf("100%% prognum %d\n", workingprogNum[phEval].ReadWriteA[indx]);
      printf("--------------------------\n");
      printf("len=%d\n", len);
      for(i=0;i<len;i++) {
       WorkingPopRead(phEval, indx, i, C_ADDR word);
       printf("%d %d %d\n", GetOpcode(word), GetEa1(word), GetEa2(word));
      }
      marked[workingprogNum[phEval].ReadWriteA[indx]]=1;
      printf("--------------------------\n");
  }
#endif
}
#endif  /* ANT */


#if defined BOOLPARITY
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
macro proc evalProg(C_UINT indx, C_UINT curFit, C_UPTR stat)
{
  Index       pc;   /* Index into words of instructions */
  Index       len;
  Index_1     counter;
  Register    ea1, ea2,r;
  Bool        regs[MAXREGS]; 
  Register    i;
  Opcode      opcode;
  Word        word;
  Bool        res;
  Word        fit;

  /*
   * Initialisation.
   * All done in 1 cycle for Handelc
   * a) Zero the register set
   * b) copy the input parameters
   * c) Set up control variables
   */
  PAR {
    i=0;
    FORPAR (r=12; r < MAXREGS; r++ ) {
      regs[r] = 0;
    }
    FORPAR(r2=0; r2 < 12; r2++ ) {
      regs[r2] = BIT(r2,curFit);
    }
    res     = !!(curFit[10:3]&(1<<curFit[2:0]));
    pc      = 0;
    counter = MAXNODES - adju(WorkingLenRead(phEval,indx),IDXW_1);

  }

  /*
   * Guard against null programs that have appeared
   */
  if(!BITSET(counter,MAXNODES))  {
    do {
      /* Decode the instruction and maintain the counters */
      PAR {
        counter++;
	    ea1 = GetEa1(WorkingPopGet(phEval,indx,pc));
	    ea2 = GetEa2(WorkingPopGet(phEval,indx,pc));
	    opcode = GetOpcode(WorkingPopGet(phEval,indx,pc));
        pc++;
      }
  
      switch(opcode) {
      case AND:
	    regs[ea1] &= (regs[ea2]);
	    break;
      case OR:
	    regs[ea1] |= regs[ea2];
	    break;
      case NOT:
	    regs[ea1]  = !regs[ea1];
	    break;
      case IF:
	    regs[ea1] = !(regs[ea1] | regs[ea2]);
	    break;
      }  /* switch */
    } while(!BITSET(counter, MAXNODES));
    /*
     * Calculate the new raw fitness
     */
    if(regs[r0] == res ) {
      fit = WorkingFitnessRead(phEval,indx);
      fit--;
      WorkingFitnessWrite(phEval,indx) = fit;
    } else {
      delay;
    }
  }
}
#endif

#if defined PSIM
int _start()
{
        static char *argv[] = {"lgpc",NULL};
        return main(1, argv);
}
 
int printf(const char * fmt, ...)
{
        return 0;
}
 
int fprintf(FILE *f, const char * fmt, ...)
{
        return 0;
}
 
int sprintf(char *s, const char * fmt, ...)
{
        return 0;
}
 
int rand(void)
{
  int v;
  return v++;
}                        
#endif
#else

ram unsigned int 32 array[32];
void main(void)
{
    unsigned int 5 count;
    unsigned int 16 loop;
    count = 0;
    loop  = 0;
    PP1000RequestMemoryBank(1);
  
  /* Initialise */
    do {
        array[count]=adju(count,32);
        PP1000WriteBank0(adju(count,21), array[count]);
        count++;
    } while(count);

    do {
    /* Modify */
    count = 0;
    do{ 
        unsigned int 32 val;
        PP1000ReadBank0(val, adju(count,21));
        array[count] = val;
        val <<= 1;
        array[count] = val;
        PP1000WriteBank0(adju(count,21),array[count]);
        count++;
    } while(count);
    loop++;
    } while(loop);
    PP1000ReleaseMemoryBank(1);
    PP1000WriteStatus(1);
}
#endif

#if defined HANDELC && !defined DEBUG
#include <stdlib.c>
#endif
