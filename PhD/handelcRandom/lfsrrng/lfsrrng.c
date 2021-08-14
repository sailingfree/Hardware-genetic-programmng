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
#define RANDWIDTH  32  /* Number of bits in the generator 
                 			This is greater than the biggest number
                 			wanted from the generator*/ 

typedef unsigned int RANDWIDTH RandReg;

#define TAP1       0
#define TAP2       5
#define TAP3       9
#define TAP4       20
#define TAP5       30
#define TAP6       31

 
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

void main(void)
{
    PP1000RequestMemoryBank(1);
    while(1) {
        par {
            random();
            PP1000WriteBank0(0,randReg);
        }
    }
    PP1000ReleaseMemoryBank(1);
}