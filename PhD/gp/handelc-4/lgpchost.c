/****************************************************************
 * Host control program for the FPGA based GP machine.
 * Pete Martin
 ****************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "pp1000.h"
/*
 * Tags for outputting the data from handlec
 */
typedef enum {
	LEN, GEN, IND, FUNC, EA1, EA2, K, FIT
} Tag;
	
/**************************************************************************
 * Function set members
 * This must match MAXFUNCS
 ***************************************************************************/
typedef enum {
  AND, OR, NAND, NOR
} FuncTypeE;

PP1000_HANDLE Handle;

static unsigned long frequency = (unsigned int )20e6;
static int           verbose = 1;
static int           interactive = 1;
static int			 dodump = 0;
static int			 doclear = 0;
static char        * fname;

PP1000_GetCards(unsigned long *n, PP1000_DEVICE_COUNT **present);
PP1000_GetCardInfo(PP1000_HANDLE *h, PP1000_CARD_INFO * i);
unsigned long time(unsigned long * t);

char * stoi(int v)
{
  static char b[10];
  sprintf(b, "%d", v);
  return b;
}

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


void dumpRunStats(unsigned long *bank1)
{
	unsigned long	gensize,
					generations,
					maxpar,
					maxproglen,
					problemid,
					cycles,
					popsize,
					good;
    double   fcycles, ffrequency, ptime;
	
    gensize		= bank1[1];
    generations = bank1[2];
    maxpar		= bank1[3];
    maxproglen	= bank1[4];
    problemid	= bank1[5];
    cycles		= bank1[6];
    popsize		= bank1[7];
    good		= bank1[8];

	if(verbose) {
		printf("PopSize = %lu\n",		popsize);
		printf("Gensize = %lu\n",		gensize);
		printf("Generations = %lu\n",	generations);
		printf("Maxpar = %lu\n",		maxpar);
		printf("Proglen = %lu\n",		maxproglen);
		printf("ProblemID = %lu\n",		problemid);
		printf("Cycles  = %lu\n",		cycles);
		// printf("100%% found at generation %lu\n", good);
		fcycles = cycles;
		ffrequency = frequency;
		ptime = fcycles/ffrequency;
		printf("Frequency = %g Hz\n", ffrequency);
		printf("Time    = %g S\n",  ptime);
	}
}

char readStatusByte()
{
    PP1000_STATUS stat;
	char value;
	int done = 0;
	int tcount = 0;


	value = 1;
	while(!done) {
		stat = PP1000ReadStatus(Handle, &value);
		if(stat != PP1000_SUCCESS) {
			if(verbose) { 
				printf("Timeout: %d\r", tcount++);
			}
		} else {
			done = 1;
		}
	}
	return value;
}

void printRamStatus()
{
    short  h,f;
    PP1000GetBankStatus(Handle, &h, &f);  
	if(verbose) {
		printf("Memory Bank Staus: Host = 0x%x, FPGA=0x%x\n", h,f);
		fflush(stdout);
	}
}

void printCards(void)
{
    PP1000_STATUS stat;
    unsigned long ncards, count;
    PP1000_DEVICE_COUNT *present;

    stat = PP1000_GetCards(&ncards, &present);
	if(verbose) {
		for(count = 0; ncards > 0; count++) {
			printf("Card id %d\n", present[count].CardID);
			ncards-=present[count].Count;
		}
	}
    free(present);

}

void printCardInfo(PP1000_CARD_INFO *info)
{
    unsigned int bankLenBytes, bankLenWords;

	if(verbose) {
		printf("Id:  %d\n", info->CardID);
		printf("Type: %d\n", info->FPGAType);
		bankLenBytes = info->RAMBankSpace[0];
		bankLenWords = bankLenBytes/4;
		printf("Ram size = %d bytes\n", bankLenBytes); 
		printf("RAM Base = 0x%x\n", info->MemoryBase);
	}
}

void setRandomSeed(PP1000_CARD_INFO *info)
{
	unsigned long seed;

	seed = time(NULL);
    PP1000RequestMemoryBank(Handle,1);
    *info->MemoryBase = seed;
    PP1000ReleaseMemoryBank(Handle, 1);
	printRamStatus();
	if(verbose) {
		printf("Random number seed set to %d (0x%x)\n", seed, seed);
	}
}

void usage(char * prog)
{
	printf("%s [-q] [-b] bitfile\n", prog);
	printf("\t-b = batch mode no prompts\n");
	printf("\t-q = quiet mode\n");
}

/* Parse the command line. Return 1 if OK 0 otherwise */
int decodeArgs(int argc, char ** argv)
{
	int  curarg = 1;
	FILE * fp = NULL; 

    /*
     * Check if there is a supplied filename, otherwise exit with an error
     */
    if(argc < 2) {
		usage(argv[0]);
		return 0;
    }

	for(curarg; curarg <= argc; curarg++) {
		if(argv[curarg][0] == '-') {
			if(strcmp(argv[curarg],"-q")==0) {
				verbose = 0;
			}
			else if(strcmp(argv[curarg], "-b") == 0) {
				interactive = 0;
			}
			else if(strcmp(argv[curarg], "-f") == 0 && curarg+1 < argc) {
				frequency = (unsigned int) atoi(argv[curarg+1]) * 1000000;
				curarg++;
			}
			else if(strcmp(argv[curarg], "-z") == 0) {
				doclear = 1;
			}
			else if(strcmp(argv[curarg], "-d") == 0) {
				dodump = 1;
			}
			else {
				usage(argv[0]);
				return 0;
			}
		} else {
			fname = argv[curarg];
			if((fp= fopen(fname,"r")) == NULL ) {
				perror("Opening bitfile");
				return 0;
			}
			return 1;
		}
		
	}
	if(fp == NULL) {
		usage(argv[0]);
		printf("Please supply a bit file\n");
		return 0;
	}
	fclose(fp);
	return 1;
}

void dumpRam(int * r1, int * r2, unsigned int len)
{
	FILE *fp0, *fp1;
	unsigned int i, j;

	fp0 = fopen("bank0", "w");
	fp1 = fopen("bank1", "w");
	if(fp0 == 0 || fp1 == 0) {
		printf("Failed to create ram file(s)\n");
		return;
	}
	for(i = 0; i < len; i+=8) {
		fprintf(fp0, "0x%6.6x: ", i);
		fprintf(fp1, "0x%6.6x: ", i);
		for(j=0;j<8;j++) {
			fprintf(fp0, "%8.8x ", *r1++);
			fprintf(fp1, "%8.8x ", *r2++);
		}
		fprintf(fp0,"\n");
		fprintf(fp1,"\n");
	}
}

/*
 * Main program
 */
int main(int argc, char ** argv)
{
    PP1000_STATUS stat;
    PP1000_CARD_INFO info;
    int    count2=0;
    int    done=0;
    unsigned int *ptr;
    unsigned int    i;
    unsigned int bankLenBytes, bankLenWords, problemid;
    unsigned int popsize,maxproglen;
    unsigned int      besti, best, bestlen;
    unsigned int fit, len;
    PP1000_CHANNEL  Channel;
    unsigned int * bank0, * bank1;
    FILE *fout;
	int      done2 = 0;
	int		tcount = 1;
	int		printProgs = 0;
	char     stage, vallo;

	if (! decodeArgs(argc, argv)) {
		exit(1);
	}

    /*
     * Install error handler
     */
    //PP1000InstallErrorHandler(Handler);
	printCards();

    /*
     * Open the first card in the system
     */
    stat = PP1000OpenFirstCard(&Handle);
	PP1000SetTimeout(Handle, 1000);

    /*
     * Get the card information
     */
	stat = PP1000_GetCardInfo(Handle, &info);
    bankLenBytes = info.RAMBankSpace[0];
    bankLenWords = bankLenBytes/4;
	printCardInfo(&info);
    bank0 = (unsigned int *) malloc(bankLenBytes);
    bank1 = (unsigned int *) malloc(bankLenBytes);
	if(verbose) {
		printf("Bank0 @ 0x%x and bank1 @ 0x%x\n", bank0, bank1);
	}


	/* 
	* Clear both ram banks if wanted
	*/
	if(doclear) {
		memset(bank0,0,bankLenBytes);
		PP1000SetupDMAChannel(Handle,
			  bank0,
			0,
			bankLenBytes,
			PP1000_PCI2LOCAL,
			&Channel);
		PP1000RequestMemoryBank(Handle,1);
		PP1000DoDMA(Channel);
		PP1000ReleaseMemoryBank(Handle,1);
		PP1000CloseDMAChannel(Channel);

		PP1000SetupDMAChannel(Handle,
			  bank0,
			bankLenBytes,
			bankLenBytes,
			PP1000_PCI2LOCAL,
			&Channel);
		PP1000RequestMemoryBank(Handle,1);
		PP1000DoDMA(Channel);
		PP1000ReleaseMemoryBank(Handle,1);
		PP1000CloseDMAChannel(Channel);
	}
    /*
     * Set the clock rate on the card
     */
    stat = PP1000SetClockRate(Handle, PP1000_MCLK, frequency);

    /*
     * Configure the FPGA
     */
    stat = PP1000ConfigureFromFile(Handle, fname);
    
    /*
     * Set the random number seed
     */
	setRandomSeed(&info);
	if(interactive) {
		printf("Press <Enter> to start the run..."); fflush(stdout);
		getc(stdin);
	}
    /*
     * Set the code running
     */
    PP1000WriteControl(Handle, 54);
	readStatusByte();
    if(verbose) {
		printf("FPGA started\n");
	}

	/*
	* Read the status byte and report progress
	*/
	do {
		stage = readStatusByte();
		if(stage == 0) break;
		vallo = readStatusByte();
		printf("Generation %d\n", vallo);
	} while(stage != 0);
    /*
     * Now read the results from the board
     */
	printRamStatus();
//	readStatusByte();

	if(interactive) {
		printf("Press <Enter> to read the results of the run..."); fflush(stdout);
		getc(stdin);
	}

	if(verbose) {
		printf("----------Results of run:----------\n");
		printf("DMAing the programs ... \n");
		printRamStatus();
	}

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

	if(verbose) {
		printf("DMAing the lengths ... \n");
	}
    PP1000SetupDMAChannel(Handle,
			  bank1,
			  bankLenBytes,
			  bankLenBytes,
			  PP1000_LOCAL2PCI,
			  &Channel);
    PP1000RequestMemoryBank(Handle,2);
    PP1000DoDMA(Channel);
    PP1000ReleaseMemoryBank(Handle,2);
    PP1000CloseDMAChannel(Channel);

	dumpRunStats(bank1);
    best=-1;
    besti = 0;
    bestlen=0;
    popsize		= bank1[7];
    maxproglen	= bank1[4];
    problemid	= bank1[5];

    for(i=0;i<popsize;i++) {
      fit = bank1[popsize+i];
      len = bank1[(popsize*2)+i];
		if(printProgs) {
			printf("Prog %d: fit = %ld, len=%ld\n", i, fit, len);
		}
      if(fit <= best) {
	best = fit;
	besti = i;
	bestlen = len;
      }
    }

    ptr = bank0 + (maxproglen*besti);
	printf("$$$ 0x%x 0x%x 0x%x 0x%x\n", bank0, maxproglen, besti, ptr);
    len = bestlen;

    printf("Best program is number %d which has fitness %d, length %d start 0x%x\n", 
	   besti, best, bestlen, ptr);

    fout = fopen("x", "w");
	len = 16;
    for(i=0; i < len; i++ ) {
      unsigned int v = *ptr;
	  if(problemid == 1) {
		/* ANT */
		printf("%d %d %d\n", (v&0x10)>>4, (v&0xc)>>2, v & 3);
		fprintf(fout, "%d %d %d\n", (v&0x10)>>4, (v&0xc)>>2, v & 3);
	  }
	  if(problemid == 2) {
		printf("%d %d %d (0x%x)\n", (v&0x30)>>4, (v&0xc)>>2, v & 3, v&0x3f);
		fprintf(fout, "%d %d %d\n", (v&0x30)>>4, (v&0xc)>>2, v & 3);		
	  }
      ptr++;
    }
    fclose(fout);
	if(verbose) {
		printf("----------End of results----------\n");
	}
	if(dodump) {
		dumpRam(bank0, bank1, bankLenWords);
	}
    /*
     * Close the card
     */
    PP1000CloseCard(Handle);

    return 0;
}

