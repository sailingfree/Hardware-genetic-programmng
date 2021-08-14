#ifndef LGPC_H
#define LGPC_H

#define VERSION "1.0"

typedef enum {PXOR, PANT, PBOOLEAPARITY} problemType ;
/*
 * Problem specific values
 */
#if defined XOR
#warning doing the XOR problem
#define PROBLEMTYPE PXOR
#define GENERATIONS    (64)                
#define POPSIZE    (64)
#define MAXPROGLEN (16)
#define MAXFITNESS (4) 
#define MAXFUNCS   (4)
#define MAXREGS    (4)
#define MAXFITW    4
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
  r0,r1,r2,r3
} RegisterE;

#define DEFAULT_FITNESS 4

/*
 * The layout of an 'instruction'
 */
#define EA2BITS 1:0
#define EA1BITS 3:2
#define OPCODEBITS 5:4

#elif defined BOOLPARITY
#warning Doing boolean parity

#define PROBLEMTYPE PBOOLEANPARITY
#define GENERATIONS    (1024)                
#define POPSIZE    (8192)
#define MAXPROGLEN (32)
#define MAXFITNESS (2048)
#define MAXFUNCS   (4)
#define MAXREGS    (16)
#define MAXFITW    12
/**************************************************************************
 * Function set members
 * This must match MAXFUNCS
 ***************************************************************************/
typedef enum {
  AND, OR, NOT, IF
} FuncTypeE;

/***************************************************************************
 * Registers (terminal set) for the processor
 * Must match MAXREGS
 ***************************************************************************/
typedef enum {
  r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,r10,r11,r12,r13,r14,r15
} RegisterE;

#elif defined ANT
/************ ANT *************/
#warning doing the ANT problem
#define PROBLEMTYPE PANT
#define GENERATIONS  (32)     /* Number of generation equivalents */
#define POPSIZE      (1024)
#define MAXPROGLEN   (32)
#define MAXFITNESS   (1)
#define GRIDX        (32)
#define GRIDY        (32)   
#define MAXFUNCS     (2)
#define MAXREGS      (4) 
#define FOOD         (89)
#define MAXFOOD      (128)
#define MAXTIME      (750)
#define MAXDIRECTION (4)
#define MAXFITW    7

typedef enum {
  IF_FOOD, PROGN2
} FuncTypeE;
typedef enum {
    t1,t2
} RegisterE;

#define DEFAULT_FITNESS FOOD

#if defined HANDELC
#define FOODW      (log2ceil(MAXFOOD)+1)
#define TIMEW      (log2ceil(MAXTIME)+1)
#define DIRW       (log2ceil(MAXDIRECTION))
#define POSW       (log2ceil(GRIDX))
#else
#define FOODW
#define TIMEW
#define DIRW
#define POSW
#endif

#define GRIDMASK   (GRIDX-1)

typedef unsigned int FOODW    Food;
typedef unsigned int TIMEW    Time;
typedef unsigned int DIRW     Direction;
typedef unsigned int POSW     Pos;
/*
 * Direction values. Arranged so that incrementing turns right,
 * and decrementing turns left
 */
#define EAST  0
#define SOUTH 1
#define WEST  2
#define NORTH 3	

/*
 * Terminals 
 */
#define LEFT  0
#define RIGHT 1
#define MOVE  2
#define NOP   3

/*
 * The layout of an 'instruction'
 */
#define EA2BITS 1:0
#define EA1BITS 3:2
#define OPCODEBITS 4

#else
#error Must specify problem type of XOR, ANT
#endif /* ANT */

#define GENSIZE      (GENERATIONS * (POPSIZE/(MAXPAR)))

#define MAXNODES   (MAXPROGLEN)       /* Maximum words per individual 
											including the control words at the start
                                           In the Virtex device being used
                                           the Block Select Rams are 4096 bits
                                           deep. To ensure that each individual
                                           is in it's own ram so that we can 
                                           use parallel evaluations, the depth
                                           of each individual should be maximal
                                           ie:128 words, even if this is not the 
                                           maximum program length! */

#define MAXPHASE   (2)           /* Two phases in the pipeline  */
#ifndef MAXPAR
#define MAXPAR     (2)           /* Number of individuals being evaluated
				  * in parallel. Must be at least 2 because
				  * this is also used to dimension workingPop
				  * which needs at least 2 individuals to do
				  * breeding with */
#endif
#define MAXINITLEN (MAXPROGLEN)       /* Max length for creation      */
#define MAXMETHODS (4)
#define WORDLEN    (16)               /* Size of RAM storage */

/*****************************************************************
 * Handle-c specific defines
 *****************************************************************/
#ifdef HANDELC
/* Define the widths of the various values */
#define FTW       		(log2ceil(MAXFUNCS))        		/* Bits needed for function     */
#define NTW       		(log2ceil(MAXNODETYPES))  	/* Bits to represent node types */
#define IDXW      		(log2ceil(MAXNODES))        	/* Width of index into nodes (words)   */
#define IDXW_1          (IDXW+1)
#define PROGW           (log2ceil(MAXPROGLEN))          /* Width of program counter */
#define PROGW_1         (PROGW+1)
#define GENW      		(log2ceil(GENSIZE))         		/* Width if generation index    */
#define GENW_1          (GENW+1)
#define POPW      		(log2ceil(POPSIZE))         		/* Width of population index    */
#define POPW_1          (POPW+1)
#define REGW      		(log2ceil(MAXREGS))
#define FUNCW     		(log2ceil(MAXFUNCS))
#define MTHW      		(log2ceil(MAXMETHODS))
#define FCASEW    	    (log2ceil(MAXFITNESS))
#define FCASEW_1        (FCASEW+1)
#define SHORTW    	    8
#define BITW      		1 
#define PHASEW    	    1
#define WORKW     	    (log2ceil(MAXPAR))
#define WORKW_1         (WORKW+1)
#define VW        		1
#define SRAMW           21
#define BIT8             8
#define BIT16           16
#define BIT32           32
#define PCNW             2
#define RAM             ram
#define STARTW      (log2ceil(START))
#define WORDW       (WORDLEN)
#define CTRLW            2

#define BOOLW     		1
#define RANDWIDTH 32
#define MAINTYPE  	void
#define MAINARGS  	(void)
#define MAINRET
#define RETVAL
#define FORPAR     	par
#define PAR         par
#define PARX        
#define SEQ         seq
#define INLINE	  	inline
#define take      	<-
#define outstr(x)
#define outdata(x,y) 	dooutdata(x,(Short)adju(y,SHORTW))

/* Define some control bits */
#define INWORK (0)   /* Indicates individual is in workingPop */
#define MOD4(v)  
#define WITHBLOCK with {block=1}
#define WITHBLOCK4  with {block=1,rclkpos = {1.0},wclkpos = {3.5},clkpulselen = 0.5,westart = 3.0,welength = 1.0}  
#define TOGGLE(x)  x=!x
#define WAIT(x)    while(!x) delay

/* Define the types for iso-c that allow macros to be compiled */
#define C_UINT
#define C_UPTR
#define C_PTR
#define C_ADDR
#define C_U8PTR

/* Define some bit macros */
#define BIT0(x) x[0]
#define BIT1(x) x[1]

#else /* HANDELC */

/* Non-Handlec definitions to make this compile as normal ANSI-C */
#define FTW
#define NTW
#define AW
#define VW   
#define IDXW
#define IDXW_1
#define PROGW
#define PROGW_1
#define LENW
#define GENW
#define GENW_1
#define POPW
#define POPW_1
#define INDW 
#define REGW
#define MDW
#define LOOPW
#define MTHW
#define PCNW
#define BITW
#define FCASEW
#define FCASEW_1
#define SPOPW
#define WORKW
#define WORKW_1
#define PHASEW
#define SRAMW
#define BIT8
#define BIT16
#define BIT32
#define WORDW
#define FUNCW
#define CTRLW
#define RANDWIDTH

#define MAINTYPE  int
#define MAINARGS  (int argc, char ** argv)
#define MAINRET   return 0
#define FORPAR    for
#define PAR     
#define PARX     
#define SEQ
#define mpram union
#define signal
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
#define macro  
#define proc void

/* defines to allow macros to be compiled as thoughthey were C */
#define C_UINT unsigned int
#define C_UPTR unsigned int *
#define C_U8PTR UINT8 *
#define C_ADDR &
#define C_PTR  *
#define IncrIdx1(x) (x++)

/* Working pop prototypes */

#endif  /* HANDELC */

/* Layout of the individual */
#define PROGN  (0)
#define FITN   (1)
#define PLEN   (2)
#define CONTRL (3)

/* Define the layout of the control parameters in SRAM
 * These are set up by the host before the run starts */
#define R_SEED  0  /* Random number seed */
#define R_GEN   1  /* Maximum number of generations to run for */

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
typedef unsigned int PROGW_1  Proglen_1;
typedef unsigned int IDXW     Index;
typedef unsigned int IDXW_1   Index_1;
typedef unsigned int VW       Value;
typedef unsigned int VW       UValue;
typedef unsigned int GENW     Generation;
typedef unsigned int GENW_1   Generation_w;
typedef unsigned int POPW     PopIndex;
typedef unsigned int POPW_1   PopIndex_1;
typedef unsigned int POPW     Depth;
typedef unsigned int REGW     Register;
typedef unsigned int FTW      FuncType;
typedef unsigned int MTHW     Method;
typedef unsigned int FCASEW   Fcase;
typedef unsigned int FCASEW_1 Fcase_1;
typedef unsigned int BOOLW    Bool;
typedef unsigned int SHORTW   Ushort;
typedef signed   int SHORTW   Short;
typedef unsigned int WORKW    WorkIndex;
typedef unsigned int WORKW_1  WorkIndex_1;
typedef unsigned int PHASEW   Phase;
typedef unsigned int SRAMW    MainPopIndex;
typedef unsigned int SRAMW    ControlIndex;
typedef unsigned int BIT8     UINT8;
typedef   signed int BIT8     INT8;
typedef unsigned int BIT16    ProgNum;
typedef unsigned int BIT32    UINT32;
typedef unsigned int FUNCW    Opcode;
typedef unsigned int CTRLW    Ctrl;
typedef unsigned int WORDW    Word;
typedef unsigned int RANDWIDTH RandReg;  



/*
 * Tags for outputting the data from handlec
 */
typedef enum {
	LEN, GEN, IND, FUNC, EA1, EA2, K, FIT, BADOP, INIT, NMUTATE, NCOPY, NXOVER
} Tag;
#define EOL "\n"

#if defined HANDELC
/*
* Some macros
*/
extern RAM Word     workingPop  [MAXPHASE*MAXPAR][MAXNODES];
extern RAM Word     workingFitness   [MAXPHASE] [MAXPAR];
extern RAM Word     workingLen       [MAXPHASE] [MAXPAR];
extern RAM PopIndex workingprogNum   [MAXPHASE] [MAXPAR];


macro expr LIMIT(v,l)   = (v);
macro expr BITSET(v,l)  = (v[log2ceil(l)]);
macro expr InWork(ctrl) = ctrl[INWORK];
macro expr GetOpcode(v) = v[OPCODEBITS];
macro expr GetEa1(v)    = v[EA1BITS];
macro expr GetEa2(v)    = v[EA2BITS];
macro expr MakeInstruction(f,e1,e2) =  0@f@e1@e2;
macro expr MakeCombined(n4,n3,n2,n1) = n4@n3@n2@n1;
macro  expr UnsignedGt(a,b,w)  =  (adju(a,w) > adju(b,w));

#if 0
macro expr UnsignedLt(a,b,w) = (adju(a,w) < adju(b,w));
macro expr UnsignedLe(a,b,w) = (adju(a,w) <= adju(b,w));
#else
#define UnsignedLt(a,b,w)  FastLt.A_LT_B
#define UnsignedLe(a,b,w)  FastLe.A_LE_B
#define UnsignedGt(a,b,w)  FastGt.A_LE_B
#endif
#define IDXW1_2 ((IDXW_1+1)/2)

/* Fast(er) increment. Requires less gate delays since there is less
* carry bits, but requires two clock cycles as compared to one for the
* iso-c x++ operator */
macro proc IncrIdx1(x)
{
    static const unsigned IDXW_1 y = 1;
    unsigned (IDXW1_2+1) temp1;
    unsigned (IDXW1_2)   temp2;

    par  {
        temp1 = (0@(x<-IDXW1_2)) + (0@(y<-IDXW1_2));
        temp2 = (x \\ IDXW1_2) + (y \\ IDXW1_2);
    }
    x = (temp2+(0@temp1[IDXW1_2])) @ temp1[(IDXW1_2-1):0];
}

/* Convert an index into a SRAM address. */
macro proc indexToAddr(idx, addr) 
{
  addr =(adju(idx, SRAMW) << PROGW);
}

/* Convert an index into a control ram address */
macro proc indexToCtrl(idx, addr) 
{
  addr =(adju(idx, SRAMW) << 2);
}

macro proc WorkingPopRead(a,b,c,v)
{
    v = workingPop[a@b].ReadWriteA[c];
}

macro expr WorkingPopGet(a,b,c) = workingPop[a@b].ReadWriteA[c];

macro proc WorkingPopWrite(a,b,c,v)
{
    workingPop[a@b].ReadWriteB[c]=v;
}

macro expr WorkingControl(a,b) = workingControl[a][b];
macro expr WorkingFitnessRead(a,b) = workingFitness[a].Read[b];
macro expr WorkingFitnessWrite(a,b) = workingFitness[a].Write[b];
macro expr WorkingprogNum(a,b) = workingprogNum[a].ReadWriteA[b];

macro expr WorkingprogNumRead(a,b) = workingprogNum[a].ReadWriteA[b];
macro expr WorkingprogNumWrite(a,b) = workingprogNum[a].ReadWriteB[b];

macro expr WorkingLenRead(a,b)     = workingLen[a].ReadWriteA[b];
macro expr WorkingLenWrite(a,b)     = workingLen[a].ReadWriteB[b];

extern UINT32 randReg;
macro expr genNode() = 0@randReg[7:0];

#if DEBUG
macro proc PP1000RequestMemoryBank(b) 
{
    unsigned int 2 bank;
    bank=b;
}
macro proc PP1000ReleaseMemoryBank(b) 
{
    unsigned int 2 bank;
    bank=b;
}
#endif

#else
/* ISO-C definitions and macro replacements */
#warning using iso-c
typedef enum {FALSE=0, TRUE=1} TrueFalse;
UINT32 READRAM(unsigned bank, unsigned long addr);
void WRITERAM(unsigned bank, unsigned addr, unsigned val);
UINT8 MakeInstruction(unsigned long,unsigned long, unsigned long);
RandReg   s_random(void);
void randseed(void);
PC       randPC();
void     randMethod(Method *);
PopIndex randPopIndex();
Register randEa();
FuncType randInstruction();
void     WorkingPopWrite(unsigned int a, unsigned int b, unsigned int c, unsigned int v);
void     WorkingPopRead(unsigned int a, unsigned int b, unsigned int c, unsigned int *  v);
Word     WorkingPopGet(unsigned int a, unsigned int b, unsigned int c);
void dooutdata(int,int);
#define WorkingPop(p,i,o) workingPop[p][i][o]

#define WorkingLenWrite(p,i)   workingLen[p].ReadWriteA[i]
#define WorkingLenRead(p,i)   workingLen[p].ReadWriteA[i]
#define WorkingFitnessWrite(p,i)   workingFitness[p].Write[i]
#define WorkingFitnessRead(p,i)   workingFitness[p].Read[i]
#define WorkingprogNumWrite(p,i)   workingprogNum[p].ReadWriteA[i]
#define WorkingprogNumRead(p,i)   workingprogNum[p].ReadWriteA[i]
#define WorkingControl(p,i)   workingControl[p][i]
#define PP1000ReadBank0(val,addr)  val=READRAM(0, addr)
#define PP1000WriteBank0(addr,val) WRITERAM(0, addr,val)
#define PP1000ReadBank1(val,addr)  val=READRAM(1, addr)
#define PP1000WriteBank1(addr,val) WRITERAM(1, addr,val)
#define PP1000ReleaseMemoryBank(b)
#define PP1000RequestMemoryBank(b)
#define PP1000SetGPI(val)
#define PP1000ReadGPO() 1
#define PP1000WriteStatus(v)
#define PP1000ReadControl(v)
#define GetOpcode(val) (((val&0x30)>>4)&(MAXFUNCS-1))
#define GetEa1(val)    ((val&0x0c)>>2)
#define GetEa2(val)    ((val&3))
#define InWork(ctrl)   (ctrl&1)
#define indexToAddr(i,a) (a=i*MAXNODES)
#define LIMIT(v,l)     (v < l)
#define BITSET(v,l)    (v & l)
#define MOD4(v)        (v=v&0x3)
#define BIT0(x)        (x&1)
#define BIT1(x)        (!!(x&2))

#define UnsignedGt(a,b,w) (a > b)
#define UnsignedLt(a,b,w) (a < b)
#define UnsignedLe(a,b,w) (a <= b)
#define genNode() rand() & 0xff
#define RANDFILE   "randseed"
#define RANDLOG    "randlog"
PC randLen();
#endif

#if defined ANT
#if defined HANDELC
#define ANDGRIDMASK 
#define ANDDIRMASK 
macro expr MAP(map,t,x,y) = (!!((map[t][y])&(1<<x)));
#define CLRBIT(map,t,x,y)  map[t][y] &= ~(1<<x)
#else
#define ANDGRIDMASK &(GRIDX-1)
#define ANDDIRMASK  &3
#define MAP(map,t,x,y) !!(map[t][y]&(1<<x))
#define CLRBIT(map,t,x,y) map[t][y] &= ~(1<<x)
#endif

#endif

#endif
