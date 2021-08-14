/* Generate crossover program sizes */

#define MAXLEN 32


int xover(int l1, int l2, int x1, int x2)
{
  return x1+(l2-x2);
}

main()
{
  int i;
  int l1 = MAXLEN/2, l2=MAXLEN/2, x1, x2;

  for(i=0;i<100000;i++) {
    x1=rand()%l1;
    x2=rand()%l2;
    printf("%d\n", x1+(l2-x2));
    printf("%d\n", x2+(l1-x1));
  }
}
