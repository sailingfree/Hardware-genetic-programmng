#include <stdio.h>
#define MAXPROGLEN 256
#define BITS 4
#define REGS 4

char *func[] = {"AND", "OR ", "NOT", "XOR"};
int prog[MAXPROGLEN][3];
FILE *fp;
FILE *logp;
int   proglen;


void initProg()
{
  int i;
  
  i = 0;
  proglen = 0;
  fseek(fp, SEEK_SET, 0);
  while(!feof(fp)) {
    fscanf(fp, "%d %d %d", &prog[i][0], &prog[i][1], &prog[i][2]);
    i++;
    proglen++;
  }
  proglen--;
}

void printProg()
{
  int pc = 0;

  printf("Program length = %d\n", proglen);
  while(pc < proglen) {
    printf("%s %d %d\n", 
	   func[prog[pc][0]], 
	   prog[pc][1], 
	   prog[pc][2]);
    pc++;
  }
}

int execProg(int v)
{
  int pc = 0;
  int b;
  int regs[REGS];
  int bits;
  int res;
  int done;
  int tmp;

  for(b=0;b<REGS;b++) {
    regs[b]=0;
  }

  for(b=0;b<BITS;b++) {
    regs[b] = !!(v & (1<<b));
  }
  
  b = 0;
  bits = 0;
  tmp = v;
  do {
    if(tmp & 0x1) {
      bits++;
    } 
    tmp >>= 1;
    done = (b==BITS-1);
    b++;
    res = bits & 1;
  }while(!done);
  
  printf("v = %d (%d %d %d %d) res = %d ", v, regs[3], regs[2], regs[1], regs[0], res);

  while(pc < proglen) {
    int op,ea1,ea2;
    op = prog[pc][0];
    ea1 = prog[pc][1];
    ea2 = prog[pc][2];
    switch(op) {
    case 0:
      regs[ea1] &= regs[ea2]; break;
    case 1:
      regs[ea1] |= regs[ea2]; break;
    case 2:
      regs[ea1] = !regs[ea2]; break;
    case 3:
      regs[ea1] = (regs[ea1] ^ regs[ea2]); break;
    }
    pc++;
  }
  printf(" actual = %d (OK=%d)\n", regs[0], regs[0]==res);
  return regs[0] == res;
}

int main(int argc, char ** argv)
{
  int c;
  int b;
  int t;

  logp=fopen("log.out", "w");
  if(argc > 1) {
    if((fp=fopen(argv[1], "r")) == NULL ) {
      perror("Opening program");
      exit(1);
    }
  } else {
    fp = stdin;
  }

  initProg();
  printProg();

  t=0;
  for(b=0;b<(1<<BITS);b++) {
    int r;
    r = execProg(b);
    t += r;
  }
  printf("Fitness = %d\n", t);
}
