/**************************************************************
 * Simple LFSR rng for Handel-C
 **************************************************************/

#define PP1000_BOARD_TYPE PP1000_V2_VIRTEX
#define PP1000_CLOCKRATE  200
#define PP1000_32BIT_RAMS
#define PP1000_CLOCK PP1000_MCLK
#define PP1000_DIVIDE1
#include <pp1000.h>


/********************************************************************
 * Random number generator for Handelc
 *
 * Uses a shift register with taps and feedback
 ********************************************************************/
#define BITW        1
#define RANDWIDTH  32  /* Number of bits in the generator 
                 			This is greater than the biggest number
                 			wanted from the generator*/ 

typedef unsigned int RANDWIDTH RandReg;

#define TAP1       0
#define TAP2       5
#define TAP3       9

RandReg randVal;

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
macro proc random(bit)
{
  static unsigned int 16 randReg = 26015;
  static unsigned int BITW  oldbit0;
  unsigned int BITW bit0;
  par {
    bit0 = randReg[TAP1] ^ 
      randReg[TAP2] ^ 
      randReg[TAP3];
    /* Shift by using all bits except top bit and adding bit 0 */
    randReg = randReg[16-2:0]@oldbit0; 
    oldbit0=bit0;
    bit    =oldbit0;
  }
}

macro proc RandomGen()
{
  unsigned int i;
  unsigned int 1 v[32];
  while(1) {
    par {
        par(i=0;i<32;i++) {
            random(v[i]);
        }
        randVal = 0@v[0]@v[1]@v[2]@v[3]@v[4]@v[5]@v[6]@v[7]@v[8]@v[9]@v[10]
                    @v[11]@v[12]@v[13]@v[14]@v[15]@v[16]@v[18]@v[19]@v[20]
                    @v[21]@v[22]@v[23]@v[24]@v[25]@v[26]@v[27]@v[28]@v[29]
                    @v[30]@v[31];
    }
  }
}

void main(void)
{
    PP1000RequestMemoryBank(1);
    while(1) {
        par {
            RandomGen();
            PP1000WriteBank0(0,randVal);
        }
    }
    PP1000ReleaseMemoryBank(1);
}