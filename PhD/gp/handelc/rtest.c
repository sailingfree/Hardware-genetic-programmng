#include <stdio.h>
#include <string.h>

main(int argc,char ** argv)
{
	int i;
	int v;
	int mask = 0x1;
	int total = 0;

	if(argc<2) {
		printf("Enter mask\n");
		exit(1);
	}
	mask = atoi(argv[1]);

	for (i=0;i<255;i++ ) {
		v = i & mask;
		if(v==mask) {
			total++;
		}
	}

	printf("Total for mask %d = %d\n", mask, total);

}
