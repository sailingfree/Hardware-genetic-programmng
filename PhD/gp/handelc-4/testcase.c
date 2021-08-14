/****************************************************************
 ****************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pp1000.h"

PP1000_HANDLE Handle;

/****************************************************************
* Function  :   Handler                                         *
*                                                               *
* Arguments                                                     *
*   FnName              Name of function that caused the error  *
*   Status              Error status number                     *
*                                                               *
* Description                                                   *
*   Error handler callback function for RC1000-PP host library  *
*                                                               *
* Return values                                                 *
*   None.  Function calls exit to terminate program             *
****************************************************************/
void Handler(char *FnName, PP1000_STATUS Status)
{
    unsigned char Buffer[1024];

    PP1000StatusToString(Status, Buffer, sizeof(Buffer));
    printf("\nlgpchost - %s %s\n", FnName, Buffer);
}

/*
 * Main program
 */
int main(int argc, char ** argv)
{
    char Buffer[256];
    unsigned char Number;
    unsigned char ReturnVal;
    unsigned char value, value2, value3, value4;
    PP1000_STATUS stat;
    unsigned long ncards, count, seed;
    PP1000_DEVICE_COUNT *present;
    PP1000_CARD_INFO info;
    char * fname;
    FILE * fp;
    int    count2=0;
    int    done=0;
    unsigned int *ptr, *ptr2;
    int    i;
    short  h,f;
    unsigned int bankLenBytes, bankLenWords;
    unsigned int popsize,gensize,maxproglen,problemid,cycles;
    unsigned int generations, maxpar;
    unsigned long frequency = 80e6;
    double   fcycles, ffrequency, ptime;
    int      besti, best, bestlen;
    int fit, len;
    int prog;
    PP1000_CHANNEL  Channel;
    unsigned int * bank0, * bank1;

    /*
     * Check if there is a supplied filename, otherwise exit with an error
     */
    if(argc < 2 || (fp= fopen(argv[1],"r")) == NULL ) {
      printf("Please supply a bit file\n");
      exit(1);
    }
    fclose(fp);
    fname = argv[1];
    /*
     * Install error handler
     */
    PP1000InstallErrorHandler(Handler);

    stat = PP1000_GetCards(&ncards, &present);
    for(count = 0; ncards > 0; count++) {
      printf("Card id %d\n", present[count].CardID);
      ncards-=present[count].Count;
    }
    free(present);

    /*
     * Open the first card in the system
     */
    stat = PP1000OpenFirstCard(&Handle);

    /*
     * Get the card information
     */
    PP1000_GetCardInfo(Handle, &info);
    printf("Id:  %d\n", info.CardID);
    printf("Type: %d\n", info.FPGAType);
    bankLenBytes = info.RAMBankSpace[0];
    bankLenWords = bankLenBytes/4;
    printf("Ram size = %d bytes\n", bankLenBytes); 
    printf("RAM Base = 0x%x\n", info.MemoryBase);
    bank0 = (unsigned int *) malloc(bankLenBytes);
    bank1 = (unsigned int *) malloc(bankLenBytes);


    /*
     * Set the clock rate on the card
     */
    stat = PP1000SetClockRate(Handle, PP1000_MCLK, frequency);

    /*
     * Configure the FPGA
     */
    stat = PP1000ConfigureFromFile(Handle, fname);
    
    fflush(stdout);

    /*
     * Now read the results from the board
     */
    PP1000SetTimeout(Handle, 30000);

    stat = PP1000ReadStatus(Handle, &value);
    printf("Value1 = %d\n", value);
    fflush(stdout);

    PP1000GetBankStatus(Handle, &h, &f);  
    printf("Memory Bank Staus: Host = 0x%x, FPGA=0x%x\n", h,f);
    fflush(stdout);

    PP1000SetupDMAChannel(Handle,
			  bank0,
			  0,
			  bankLenBytes,
			  PP1000_LOCAL2PCI,
			  &Channel);
    PP1000RequestMemoryBank(Handle,1);
    PP1000DoDMA(Channel);
    PP1000ReleaseMemoryBank(Handle,1);
    PP1000CloseDMAChannel(Channel);

    for(i=0;i<32;i++) {
	printf("%d = 0x%x\n", i, bank0[i]);
    }

    printf("----------End of results----------\n");

    /*
     * Close the card
     */
    PP1000CloseCard(Handle);

    return 0;
}

