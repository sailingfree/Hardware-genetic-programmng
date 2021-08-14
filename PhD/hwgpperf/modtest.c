/**********************************************************
 * Fast modulus calculation using subtraction for use in
 * handel-c
 **********************************************************/

#include <stdio.h>

int main(int argc, char ** argv) 
{
	int a,b,r;
	if(argc!=3) {
		printf("Usage: %s n1, n2\n", argv[0]);
		exit(1);
	}
	a = atoi(argv[1]);
	b = atoi(argv[2]);

	printf("a(%d) %% b(%d) = %d\n", a,b,a%b);

	r = a;
	while(r > b) {
		r -= b;
	}
	printf("Result = %d\n", r);
}
