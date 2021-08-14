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
	
void procline(char *buf)
{
  char *s1, *s2;
  char * vs1, *vs2;
  int v1, v2;
  s1 = strtok(buf," \t\n");
  if(!s1) {
    printf("Error: token 1\n");
    return;
  } else {
    s2 = strtok(NULL, " \t\n");
    if(!s2) {
      printf("Error: token 2\n");
      return;
    }
  }
  v1 = atoi(s1);
  v2 = atoi(s2);
  vs2 = s2;
  switch(v1) {
  case LEN:
    vs1 = "Length";
    break;
  case GEN:
    vs1 = "Generation";
    break;
  case IND:
    vs1 = "Individual";
    break;
  case FUNC:
    vs1 = "Func";
    break;
  case EA1:
    vs1 = "Ea1";
    break;
  case EA2:
    vs1 = "Ea2";
    break;
  case K:
    vs1 = "K";
    break;
  case FIT:
    vs1 = "Fitness";
    break;
  default:
    vs1 = "Unknown op";
    break;
  }

  printf("(%d %d)%s %s\n", v1, v2, vs1, vs2);
}


int main(int argc, char ** argv)
{
  FILE *fp;
  char  buf[BUFSIZE+1];

  if(argc == 1) {
    fp = stdin;
  } else {
    if((fp = fopen(argv[1], "r")) ==NULL ) {
      perror("Cannot open input file");
      exit(1);
    }
  }

  while(!feof(fp)) {
    fgets(buf, BUFSIZE, fp);
    procline(buf);
  }
}

