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
unsigned int 32 randReg;    /* The register used for generating the number */

macro expr BIT_P1(b) = (b==31?0:b+1);
macro expr BIT_M1(b) = (b==0?31:b-1);
macro expr CABIT(ca,bit) = ((ca[BIT_P1(bit)]|ca[bit])^ca[BIT_M1(bit)]);

macro proc random()
{
    randReg = CABIT(randReg,31) @    
    CABIT(randReg,30) @    
    CABIT(randReg,29) @    
    CABIT(randReg,28) @    
    CABIT(randReg,27) @    
    CABIT(randReg,26) @    
    CABIT(randReg,25) @    
    CABIT(randReg,24) @    
    CABIT(randReg,23) @    
    CABIT(randReg,22) @    
    CABIT(randReg,21) @    
    CABIT(randReg,20) @    
    CABIT(randReg,19) @    
    CABIT(randReg,18) @    
    CABIT(randReg,17) @    
    CABIT(randReg,16) @    
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
}


void main(void)
{
    PP1000RequestMemoryBank(1);

    randReg = 0x00008000;
    while(1) {
        par {
                do{ random(); }while(1);
                PP1000WriteBank0(0, randReg);
        }
    } 
    PP1000ReleaseMemoryBank(1);   
}