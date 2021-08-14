#ifndef LGPC_H
#define LGPC_H

#define VERSION "1.0"

#ifndef GENSIZE 
#define GENSIZE    (510)                /* Max number of generations  */
#endif

/*
 * The following values must be powers of 2 so that the 
 * logic works correctly
 */
#ifndef POPSIZE
#define POPSIZE    (16)                /* Max populations size. Minimum is 4
                                          otherwise the tournament selection fails! 
                                          In this implementation, we use 2*8bits
                                          for the individual number so this limits
                                          the max population size to 65535 */
#endif

#define MAXPROGLEN 16
#ifndef MAXNODES
#define MAXNODES   (MAXPROGLEN+START)       /* Maximum words per individual 
											including the control words at the start
                                           In the Virtex device being used
                                           the Block Select Rams are 4096 bits
                                           deep. To ensure that each individual
                                           is in it's own ram so that we can 
                                           use parallel evaluations, the depth
                                           of each individual should be maximal
                                           ie:128 words, even if this is not the 
                                           maximum program length! */
#endif

#define MAXPHASE   (2)           /* Four phases in the pipeline  */
#ifndef MAXPAR
#define MAXPAR     (2)           /* Number of individuals being evaluated
				  * in parallel. Must be at least 2 because
				  * this is also used to dimension workingPop
				  * which needs at least 2 individuals to do
				  * breeding with */
#endif
#define MAXINITLEN (MAXPROGLEN)       /* Max length for creation      */
#define MAXREGS    (4)                /* Number of 'registers' */
#define MAXFUNCS   (4)                /* Number of 'opcodes' */
#define MAXLOOP    (8)                /* Maximum number of loops in prog */
#define MAXFITNESS (4)                /* Max fitness cases */
#define MAXMETHODS (4)

/*****************************************************************
 * Handle-c specific defines
 *****************************************************************/
#ifdef HANDELC
/* Define the widths of the various values */
#define FTW       		(log2ceil(MAXFUNCS))        		/* Bits needed for function     */
#define NTW       		(log2ceil(MAXNODETYPES))  	/* Bits to represent node types */
#define IDXW      		(log2ceil(MAXNODES))        	/* Width of index into nodes (words)   */
#define PROGW         (log2ceil(MAXPROGLEN))          /* Width of program counter */
#define GENW      		(log2ceil(GENSIZE))         		/* Width if generation index    */
#define GENW_1        (GENW+1)
#define POPW      		(log2ceil(POPSIZE))         		/* Width of population index    */

#define REGW      		(log2ceil(MAXREGS))
#define FUNCW     		(log2ceil(MAXFUNCS))
#define LOOPW     		(log2ceil(MAXLOOP))
#define MTHW      		(log2ceil(MAXMETHODS))
#define FCASEW    	(log2ceil(MAXFITNESS))
#define SHORTW    	8
#define BITW      		1 
#define PHASEW    	1
#define WORKW     	(log2ceil(MAXPAR))
#define VW        			1
#define SRAMW           21
#define BIT8             8
#define BIT16           16
#define BIT32           32
#define PCNW             2
#define RAM             ram
#define STARTW      (log2ceil(START))

#define BOOLW     		1
#define RANDWIDTH 32
#define MAINTYPE  	void
#define MAINARGS  	(void)
#define MAINRET
#define RETVAL
#define FORPAR     	par
#define PAR            	par
#define SEQ             seq
#define INLINE	  	inline
#define take      	<-
#define outstr(x)
#define outdata(x,y) 	dooutdata(x,(Short)adju(y,SHORTW))

/* Define some control bits */
#define INWORK (0x80000000)   /* Indicates individual is in workingPop */
#define MOD4(v)   
#define WITHBLOCK  with {block=1}  
#define TOGGLE(x)  x=!x
#define WAIT(x)    while(!x) delay
#else

/* Non-Handlec definitions to make this compile as normal ANSI-C */
#define FTW
#define NTW
#define AW
#define VW   
#define IDXW
#define PROGW
#define LENW
#define GENW
#define GENW_1
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
#define WORKW
#define PHASEW
#define SRAMW
#define BIT8
#define BIT16
#define BIT32
#define FUNCW

#define MAINTYPE  int
#define MAINARGS  (int argc, char ** argv)
#define MAINRET   return 0
#define FORPAR    for
#define PAR     
#define SEQ
#define BOOLW
#define SHORTW
#define delay     ;  
#define INLINE
#define adju(a,b) a
#define adjs(a,b) a
#define width(v)
#define take
#define RAM
#define WITHBLOCK
#define TOGGLE(x) (x = (x+1) & 0x1)
#define WAIT(x)
#define outstr(x) dooutstr(x)
#define outdata(x,y) dooutdata(x,y)
#endif

/* Define a type for the shift register */
#ifdef HANDELC
typedef unsigned int RANDWIDTH RandReg;  
#else
typedef unsigned long     RandReg;
#endif

/* Layout of the individual */
#define PROGN  (0)
#define FITN   (1)
#define PLEN   (2)
#define CONTRL (3)
#define START  (4)

/* Define the layout of the control parameters in SRAM
 * These are set up by the host before the run starts */
#define R_SEED  0  /* Random number seed */
#define R_GEN   1  /* Maximum number of generations to run for */

/**************************************************************************
 * Function set members
 * This must match MAXFUNCS
 ***************************************************************************/
typedef enum {
  AND, OR, NAND, NOR
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
 ***************************************************************/
typedef enum {
  COPY, XOVER, MUTATE 
} ReproMethod;

/*
 * typedef the commonly used types
 */
typedef unsigned int PROGW    PC;
typedef unsigned int IDXW     Index;
typedef unsigned int VW       Value;
typedef unsigned int VW       UValue;
typedef unsigned int GENW     Generation;
typedef unsigned int GENW_1   Generation_w;
typedef unsigned int POPW     PopIndex;
typedef unsigned int POPW     Depth;
typedef unsigned int REGW     Register;
typedef unsigned int FTW      FuncType;
typedef unsigned int LOOPW    LoopCount;
typedef unsigned int MTHW     Method;
typedef unsigned int FCASEW   Fcase;
typedef unsigned int BOOLW    Bool;
typedef unsigned int SHORTW   Ushort;
typedef signed   int SHORTW   Short;
typedef unsigned int WORKW    WorkIndex;
typedef unsigned int PHASEW   Phase;
typedef unsigned int SRAMW    MainPopIndex;
typedef unsigned int BIT8     UINT8;
typedef    signed  int  BIT8    INT8;
typedef unsigned int BIT16    ProgNum;
typedef unsigned int BIT32    UINT32;
typedef unsigned int FUNCW    Opcode;
/*
 * The layout of an 'instruction'
 */
#define EA1BITS 1:0
#define EA2BITS 2:1
#define OPCODEBITS 3:2

#if !defined HANDELC
typedef enum {FALSE=0, TRUE=1} TrueFalse;
#endif
/*
 * Tags for outputting the data from handlec
 */
typedef enum {
	LEN, GEN, IND, FUNC, EA1, EA2, K, FIT, BADOP, INIT, NMUTATE, NCOPY, NXOVER
} Tag;
#define EOL "\n"

/*
* Some macros
*/
extern RAM UINT32 workingPop  [MAXPHASE][MAXPAR][MAXNODES];

#if defined HANDELC
macro expr LIMIT(v,l)   = (v);
macro expr InWork(ctrl) = ctrl[INWORK];
macro expr GetOpcode(v) = v[OPCODEBITS];
macro expr GetEa1(v)    = v[EA1BITS];
macro expr GetEa2(v)    = v[EA2BITS];
macro expr MakeInstruction(f,e1,e2) =  0@f@e1@e2;
macro expr MakeCombined(n4,n3,n2,n1) = n4@n3@n2@n1;
macro  expr UnsignedGt(a,b,w)  =  (adju(a,w) > adju(b,w));
macro expr UnsignedLt(a,b,w) = (adju(a,w) < adju(b,w));


/* Convert an index into a SRAM address. This is a multiply by MAXNODES
 * which is not a power of 2 so this does long multiplication to avoid
 * the use of the multiply operator */
macro proc indexToAddr(idx, addr) 
{
  addr =(adju(idx, SRAMW) << PROGW)   +     /* Main nodes */
    (adju(idx, SRAMW) << STARTW);     /* Plus the control info */
}

#define WorkingPop(a,b,c) workingPop[a][b][c]

#define ProgLen(a,b) workingPop[a][b][0][22:16]
macro proc ProgLenSet(a,b,c,d) 
{
    
}

#if DEBUG
macro proc PP1000RequestMemoryBank(b) 
{
    bank=b;
}
macro proc PP1000ReleaseMemoryBank(b) 
{
    bank=b;
}


#endif

#define PP1000SetGPI(val)
#define PP1000ReadGPO() 1
#else
#warning using iso-c
UINT32 READRAM(unsigned long addr);
void WRITERAM(unsigned addr, unsigned val);
unsigned MakeCombined(unsigned long,unsigned long,unsigned long,unsigned long);
unsigned MakeInstruction(unsigned long,unsigned long,unsigned long);
RandReg   s_random(void);
void randseed(void);
PC       randPC();
Method   randMethod();
PopIndex randPopIndex();
Register randEa();
FuncType randInstruction();
void dooutdata(int,int);
#define WorkingPop(p,i,o) workingPop[p][i][o]
#define PP1000ReadBank0(val,addr) val=READRAM(addr)
#define PP1000WriteBank0(addr,val) WRITERAM(addr,val)
#define PP1000ReleaseMemoryBank(b)
#define PP1000RequestMemoryBank(b)
#define PP1000SetGPI(val)
#define PP1000ReadGPO() 1
#define PP1000WriteStatus(v)
#define GetOpcode(val) ((val&0x30)>>4)
#define GetEa1(val)    ((val&0x0c)>>2)
#define GetEa2(val)    ((val&3))
#define InWork(ctrl)   (ctrl&1)
#define indexToAddr(i,a) (a=i*MAXNODES)
#define LIMIT(v,l)     (v < l)
#define MOD4(v)        (v=v&0x3)
#endif

#endif
