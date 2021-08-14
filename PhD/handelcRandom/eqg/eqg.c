/**************************************************************
 * Simple LFSR rng for Handel-C
 **************************************************************/

#define PP1000_BOARD_TYPE PP1000_V2_VIRTEX
#define PP1000_CLOCKRATE  50
#define PP1000_32BIT_RAMS
#define PP1000_CLOCK PP1000_MCLK
#define PP1000_DIVIDE1
#include <pp1000.h>

unsigned int 32 randVal = 212121;

void main(void)
{
    PP1000RequestMemoryBank(1);
    while(1) {
        par {
            randVal = 1664525L*randVal+1013904223;
            PP1000WriteBank0(0,randVal);
        }
    }
    PP1000ReleaseMemoryBank(1);
}