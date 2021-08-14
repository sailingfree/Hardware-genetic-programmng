#include <stdio.h>
#include <curses.h>

WINDOW *cmdwin;

#define MAXPROGLEN       128
#define MAXTIME          750

unsigned long initialMap[32] = {
0x0000000e,
0x00000008,
0x0e000008,
0x21000008,
0x21000008,
0x00601f78,
0x20001000,
0x00101000,
0x00101000,
0x20101000,
0x00100000,
0x00001000,
0x20001000,
0x00101000,
0x1c101000,
0x00820000,
0x00000000,
0x00001000,
0x01011000,
0x08011000,
0x00011000,
0x00011000,
0x04001000,
0x00801000,
0x00010f98,
0x00010002,
0x00010002,
0x00007f02,
0x00000082,
0x00000080,
0x0000003c,
0x00000000,
};

unsigned long map[32];
int timestep;
int food;
int antx, anty;
int dir;
int proglen;
int speed = 10000;

#define FOODCHAR  '#'
#define EMPTYCHAR ' '
#define BLANKCHAR '.'
#define VISITEDCHAR '*'
#define NORTHCHAR '^'
#define EASTCHAR '>'
#define WESTCHAR '<'
#define SOUTHCHAR 'v'

#define GMASK 31

#define EAST  0
#define SOUTH 1
#define WEST  2
#define NORTH 3

#define LEFT  0
#define RIGHT 1
#define MOVE  2
#define NOP   3

#define IF_FOOD 0
#define PROGN   1

int antchar[4] = {EASTCHAR, SOUTHCHAR, WESTCHAR, NORTHCHAR};
char *func[] = {"IF_FOOD", "PROGN"};
char *ops[]  = {"LEFT", "RIGHT", "MOVE", "NOP"};
int prog[MAXPROGLEN][3];
FILE *fp;
FILE *logp;

#define MAP(x,y) (!!(map[y]&(1<<x)))
#define CLRBIT(x,y) map[y] &= ~(1<<x)

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


void drawTrail(void)
{
  int x,y;
  int i;

  for(i=0;i<32;i++) {
    map[i]=initialMap[i];
  }

  for(x=0;x<32;x++) {
    for(y=0;y<32;y++) {
      switch(MAP(x,y)) {
      case 0:
	mvaddch(y,x, BLANKCHAR);
	break;
      case 1:
	mvaddch(y,x, FOODCHAR);
	break;
      }
    }
    initProg();
  }
  food = 89;
  timestep = 0;
  antx=0;
  anty=0;
  dir = EAST;
}

void displayStats(void)
{
  mvprintw(33,1,"Timestep %4.4d Food %2.2d\n", timestep, food);
}


void doterm(int t)
{
    chtype  tmp;
    timestep++;
    if(t==LEFT) {
        dir = (dir-1)&3;
	mvaddch(anty,antx,antchar[dir]);
	refresh();
	usleep(speed);
    }                   
    else if(t==RIGHT){  
        dir = (dir+1)&3;
	mvaddch(anty,antx,antchar[dir]);
	refresh();
	usleep(speed);
    }                   
    else if(t==MOVE) {  
      mvaddch(anty, antx, VISITEDCHAR);
      refresh();
        switch(dir) {   
           case EAST:       
              antx = antx+1; break;
           case WEST:        
              antx=antx-1; break;  
           case SOUTH:       
              anty=anty+1; break;  
           case NORTH:       
              anty=anty-1;break;              
        }                               
	anty &= 31;            
	antx &= 31; 
	tmp = MAP(antx,anty);
	mvaddch(anty,antx,antchar[dir]);
	refresh();
	usleep(speed);
        if(tmp) {             
           food = food ? food-1 : food; 
	   CLRBIT(antx,anty);
	   mvaddch(anty,antx,VISITEDCHAR);
	   refresh();
	   usleep(speed);
	}
    } else {
      usleep(speed);
    }
}

void executeTrail(void)
{
  int opcode, ea1, ea2, pc, ahead;
  int ax,ay;

  pc = 0;

  do {
    while(pc < proglen) {
      opcode = prog[pc][0];
      ea1    = prog[pc][1];
      ea2    = prog[pc][2];
      ax=antx;
      ay=anty;
      displayStats();
      mvprintw(34,1,"%d -> %s,(%s,%s)\n", pc, func[prog[pc][0]], ops[prog[pc][1]], ops[prog[pc][2]]);
      mvprintw(35,1,"X=%d y=%d dir=%d food=%d\n", antx, anty, dir, food);
      fprintf(logp, "dir=%d x=%d, y= %d pc = %d opcode = %d, "
		 "ea1 = %d, ea2 = %d food = %d\n", 
		 dir,antx,anty, pc, opcode, ea1, ea2, food);



      fflush(logp);
      refresh();
      
      switch(opcode) {
      case IF_FOOD:
	switch(dir) {
	case EAST:
	  ax++; break;
	case WEST:
	  ax--; break;
	case NORTH:
	  ay--; break;
	case SOUTH:
	  ay++; break;
	}
	ax &= 31;
	ay &= 31;
	ahead = MAP(ax,ay);
	if(ahead) {
	  doterm(ea1);
	} else {
	  doterm(ea2);
	}
	pc++;
	break;
      case PROGN:
	doterm(ea1);
	doterm(ea2);
	pc++;
	break;
      }
    }
    pc = 0;  /* back to the start */
  } while(food);
}

int main(int argc, char ** argv)
{
  int c;

  logp=fopen("log.out", "w");
  if(argc > 1) {
    if((fp=fopen(argv[1], "r")) == NULL ) {
      perror("Opening trail");
      exit(1);
    }
  } else {
    fp = stdin;
  }
  initscr();
  nonl();
  noecho();
  cbreak();
  cmdwin=newwin(34,33,0,0);
  drawTrail();
  while(1) {
    mvprintw(32,1,"q)uit e)execute r)eset f)ast s)low");
    displayStats();
    refresh();
    c = getch();
    switch(c) {
    case 'q':
      erase();
      endwin();
      exit(0);
    case 'r':
      erase();
      drawTrail();
      break;
    case 'e':
      executeTrail();
      break;
    case 'f':
      speed=10;
      break;
    case 's':
      speed=1000000;
      break;
    }
  }
}
