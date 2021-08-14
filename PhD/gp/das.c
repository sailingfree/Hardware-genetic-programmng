/**********************************************************************
 * Disassembler for HANDEL-C gp
 *
 * Reads a file or stdin
 * Outputs a human readable program list
 **********************************************************************/
#include <stdio.h>
#define  BUFSIZE 100
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
  ADD, SUB, JMPIFZ, LDIM, SHL, SHR, NOP, HALT
} FuncTypeE;


char * stoi(int v)
{
  static char b[10];
  sprintf(b, "%d", v);
  return b;
}

int gettok(FILE *fp)
{
  char * p;
  static char  buf[BUFSIZE+1];
  p = fgets(buf, BUFSIZE, fp);
  if(p == NULL ) {
    return -1;
  } else {
    return atoi(buf);
  }
}


int getnext(FILE *fp)
{
  int v;
  gettok(fp);
  return gettok(fp);
}

void procline(FILE *fp, int v1, int v2)
{
  char * vs1 = "";
  char * vs2 = "";
  int    ea1, ea2, k;
  static  char buf[100];

  switch(v1) {
  case LEN:
    vs1 = "Length";
    vs2 = stoi(v2);
    break;
  case GEN:
    vs1 = "Generation";
    vs2 = stoi(v2);
    break;
  case IND:
    vs1 = "Individual";
    vs2 = stoi(v2);
    break;
  case FUNC:
    vs2 = "";
    ea1 = getnext(fp);
    ea2 = getnext(fp);
    k   = getnext(fp);
    switch(v2) {
    case ADD:
      sprintf(buf, "ADD(r%d,r%d) ", ea1, ea2);
      break;
    case SUB:
      sprintf(buf, "SUB(r%d,r%d) ", ea1, ea2);
      break;
    case SHL:
      sprintf(buf, "SHL(r%d) ", ea1);
      break;
    case SHR:
      sprintf(buf, "SHR(r%d) ", ea1);
      break;
    case JMPIFZ:
      sprintf(buf, "JMPIFZ(r%d,r%d) ", ea1, ea2);
      break;
    case LDIM:
      sprintf(buf, "LDIM (r%d, %d) ", ea1, k);
      break;
    case HALT:
      sprintf(buf, "HALT (r%d)", ea1);
      break;
    case NOP:
      sprintf(buf, "NOP");
      break;
    default:
      sprintf(buf, "Unkown Opcode");
      break;
    }
    vs1 = buf;
    break;
 case EA1:
   vs1 = "Ea1";
   break;
 case EA2:
   vs1 = "Ea2";
   break;
 case K:
   vs1 = "K";
   vs2 = stoi(v2);
   break;
 case FIT:
   vs1 = "Fitness";
   vs2 = stoi(v2);
   break;
 default:
   vs1 = "Unknown op";
   break;
}

  printf("%s %s\n",vs1, vs2);
}

int main(int argc, char ** argv)
{
  FILE *fp;
  int   tok1, tok2;

  if(argc == 1) {
    fp = stdin;
  } else {
    if((fp = fopen(argv[1], "r")) ==NULL ) {
      perror("Cannot open input file");
      exit(1);
    }
  }

  while(!feof(fp)) {
    tok1 = gettok(fp);
    tok2 = gettok(fp);
    if(tok1 != -1 && tok2 != -1) {
      procline(fp, tok1, tok2);
    }
  }
}

