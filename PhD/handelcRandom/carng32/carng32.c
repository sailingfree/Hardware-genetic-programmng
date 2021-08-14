/* lfsr random number generator */

/*
 * Include RC1000-PP support header file
 */
#define PP1000_BOARD_TYPE PP1000_V2_VIRTEX
#define PP1000_CLOCKRATE  100
#define PP1000_CLOCK      PP1000_MCLK
#define PP1000_32BIT_RAMS
#define PP1000_DIVIDE1

#include <pp1000.h>



#define RANDWIDTH  32  /* Number of bits in the generator 
                 			This is greater than the biggest number
                 			wanted from the generator*/ 

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
unsigned int 32 randVal;    /* The register used for generating the number */

macro expr BIT_P1(b) = (b==15?0:b+1);
macro expr BIT_M1(b) = (b==0?15:b-1);
macro expr CABIT(ca,bit) = ((ca[BIT_P1(bit)]|ca[bit])^ca[BIT_M1(bit)]);

macro proc random(bit)
{
    static unsigned int 16 randReg = 0x00008000;
    par {
    randReg =    
    CABIT(randReg,15) @    
    CABIT(randReg,14) @    
    CABIT(randReg,13) @    
    CABIT(randReg,12) @    
    CABIT(randReg,11) @    
    CABIT(randReg,10) @    
    CABIT(randReg,9) @    
    CABIT(randReg,8) @    
    CABIT(randReg,7) @    
    CABIT(randReg,6) @    
    CABIT(randReg,5) @    
    CABIT(randReg,4) @    
    CABIT(randReg,3) @    
    CABIT(randReg,2) @    
    CABIT(randReg,1) @    
    CABIT(randReg,0);

    bit = randReg[8];
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
                PP1000WriteBank0(0, randVal);
        }
    } 
    PP1000ReleaseMemoryBank(1);   
}