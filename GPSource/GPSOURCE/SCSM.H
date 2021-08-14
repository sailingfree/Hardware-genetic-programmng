//////////////////////////////////////////////////////////////////////////
//
//   ####    ####    ####   #    #          #    #
//  #       #    #  #       ##  ##          #    #
//   ####   #        ####   # ## #          ######
//       #  #            #  #    #   ###    #    #
//  #    #  #    #  #    #  #    #   ###    #    #
//   ####    ####    ####   #    #   ###    #    #
//
//////////////////////////////////////////////////////////////////////////
// SCSM simulates a simple an external switch interface
// Pete Martin
// Revision History
// Sept 21 1997		Initial version
// 04-Nov-97    Added parameter passing in messages
// 19 Nov 97    Added message type member to VarVal
// 21 Apr 98    Tidy up
//////////////////////////////////////////////////////////////////////////

#ifndef _SCSM_H_
#define _SCSM_H_

#include <stream.h>
#include <gp.h>
//
// Some manifest constants
//
#define MAXMSGS    100
#define MAXSTATES   50

//
// General externals
//
extern int         debug;
extern GPVariables cfg;

//////////////////////////////////////////////////////////////////////////
// Msg Types. 
// Not all these get used!
//////////////////////////////////////////////////////////////////////////
enum   MsgType 
{
  None,    Any,      Idp,     Connect, Alarm,
  Dbreq,   Dbresp,   Dberr,   End,     Timeout
};

//////////////////////////////////////////////////////////////////////////
// Name:  VarVal
//
// Purpose:  This class is the type returned from each SLP function or terminal
//           It can represent a string value or an integral value
//////////////////////////////////////////////////////////////////////////
typedef   char   StrVal[24];    // Declare string type. 24 is ITU value

class VarVal
{
private:
  int    _index;
public:
  VarVal() 
  {
    strval[0]='\0'; intval = 0;
  }
  VarVal(const char *v)
  {
    strcpy(strval,v);
  }
  VarVal(const int v)
  {
    intval=v;
  }

  VarVal(const VarVal & v)
  {
    intval=v.intval;
    strcpy(strval, v.strval);
  }
  VarVal & operator=(const VarVal *);
  VarVal & operator=(const char * s);
  StrVal             strval;
  int                intval;  
  MsgType            msgType;
  int                index() { return _index;}
  void               setIndex(int i) { _index = i; }
  friend ostream & operator << (ostream &, VarVal);
};


//////////////////////////////////////////////////////////////////////////
// MsgTable. 
// A member class that holds the name and value of a message for
// translation from one to the other
//////////////////////////////////////////////////////////////////////////
class  MsgTable
{
public:
  MsgType    enumtype;
  char      *strtype;
};

//////////////////////////////////////////////////////////////////////////
// Msg class.
/// Defines the structure of a message
//////////////////////////////////////////////////////////////////////////
class Msg
{
private:
  VarVal        _p1;
  VarVal        _p2;

public:
  Msg() 
  {
    _type = None;
  }
  Msg(MsgType t) 
  {
    _type = t;
  }
  Msg(MsgType t, const char *p1, const char *p2)
  {
    _type = t;
    _p1=p1;
    _p2=p2;
  }

  Msg(MsgType t, const char *p1, const int p2)
  {
    _type = t;
    _p1=p1;
    _p1.intval=p2;
  }

  MsgType	_type;
  VarVal       &p1(void) {return _p1;}
  VarVal       &p2(void) {return _p2;}
  void          print() 
  {
    cout << "Message Type " << _type << " p1 strval = " 
	 << _p1.strval << " p1 intval = " << _p1.intval 
	 << " ps = " << _p2.strval << endl;
  }
};

//////////////////////////////////////////////////////////////////////////
// Class to hold the definitions of state information.
//////////////////////////////////////////////////////////////////////////
class State
{
public:
  State() 
  {
    cur=-1; outmsg._type = None; event._type = None; 
    next = -1; fitness = 0.0; 
  }
  void print() 
  {
    if(debug)
      cout << "State: cur = " << cur << " next = " << next
	   << endl; 
  }

  int   cur;           // This state. -1 if entry not used
  Msg   outmsg;        // Any message to output
  Msg   event;         // The event that gets us here
  int   next;          // The state to go to
  double fitness;      // How fit is this state?
};

//////////////////////////////////////////////////////////////////////////
// StateTable class
// This class defines the entire set of states for a run.
//////////////////////////////////////////////////////////////////////////
class StateTable
{
public:
  StateTable() {next = 0; current = 0; reset(); }
  void    insertState(int, 
		      const Msg &, 
		      const Msg &, 
		      int, 
		      double);
  void    print(void);
  int     state(int state, Msg & msg, State &, int);
  int     state(int state, State &);
  int     nState() {return next;}
  
private:
  int      next;
  int      current;
  State    table[MAXSTATES];
  void reset() {
    for (int i=0; i< MAXSTATES;i++) {
      table[i].cur = -1;
    }
  }
};

//////////////////////////////////////////////////////////////////////////
//
// Name:  St
//
// Purpose: State table entry object. Contains the description of a state
//
//////////////////////////////////////////////////////////////////////////
struct St                             // The state table
{
  int     c;
  MsgType o;
  char *  op1;
  int     op2;
  MsgType e; 
  char *  ip1;
  int     ip2;
  int     n;
  double  f;
};

//////////////////////////////////////////////////////////////////////////
//
// Name:  Scsm
//
// Purpose: A simple call state machine.
//          Represents the internal call processing states of the SSP
//
//////////////////////////////////////////////////////////////////////////
class Scsm 
{
private:
  int          state;                 // Current state
  double       fitness;
  StateTable   stateTable;
  int          ok;  

  void read_state_table(char *);

public:
  int          good;
  int          bad;
  int          goodparm;
  int          badparm;


  Scsm();
  ~Scsm();
  void  init(char *);
  void  reset(void) {
    fitness = 1300.0;   // Initial fitness value. This goes down as fitness goes up
    state = ok = good = bad = goodparm = badparm= 0;
  }
  void  printStates(void) {stateTable.print();}
  Msg   * emitMsg();
  void  acceptMsg(Msg &);
  int   curState();
  double finalStateFitness(void) {
    double f;
    f = fitness;
    f = f - (ok);
    if(debug)
      cout << "Scsm fitness = " << f << endl;
    return f;
  }
  void penalise(void)   { ok -= cfg.Penalty; }
  void reward(void)     { ok += cfg.Reward;}
  void summary()        { cout << "Good = " << good << " Bad = " << bad << 
			    "Goodparms = " << goodparm << " badparms = " 
			       << badparm << endl;}
};

#endif // _SCSM_H_





















