#include <stdio.h>
#include <string.h>
#include <stdlib.h>

main(int argc,char ** argv)
{
	int i;
	int v,v1,v2,v3,v4;
	int m1=0, m2=0, m3=0;
	int mask1=0x1f;
	int mask2=0xfc;

	for(i=0;i<1000;i++) {
		v = rand() & 255;

		v1=v&mask1;
		v2=v&mask2;
		v3=v&~mask1;
		v4=v&~mask2;

		if(!v3&&v1)
			m1++;
		else if(!v4&&v2)
			m2++;
		else
			m3++;
	}

	printf("m1=%d, m2 = %d, m3 = %d\n", m1,m2,m3);
}
