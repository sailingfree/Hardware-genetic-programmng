//////////////////////////////////////////////////////////////////////////
//
//   ####    ####    ####   #    #           ####    ####
//  #       #    #  #       ##  ##          #    #  #    #
//   ####   #        ####   # ## #          #       #
//       #  #            #  #    #   ###    #       #
//  #    #  #    #  #    #  #    #   ###    #    #  #    #
//   ####    ####    ####   #    #   ###     ####    ####
//
//////////////////////////////////////////////////////////////////////////
// 
// Simple SCSM to simulate an external switch interface
// Pete MArtin
// Revision History
// 
// Sept 21 1997		Initial version
// Nov  12 1997         Changed name to Simple Call State Model
// Dec  19 1997         Add support for multi fitness cases with multiple
//                      paths thro state machine.
//////////////////////////////////////////////////////////////////////////
 

#include <stream.h>
#include <scsm.h>
#include <stdio.h>

//////////////////////////////////////////////////////////////////////////
// Decalartions
//////////////////////////////////////////////////////////////////////////

extern int debug;
extern GPVariables cfg;
int    optimistic = 0; // If set then state transitions need not be strict

//////////////////////////////////////////////////////////////////////////
// 
// define the message text to type translation table
// 
//////////////////////////////////////////////////////////////////////////
MsgTable table[MAXMSGS] = 
{
  {None, "None"},
  {Any, "Any"},
  {Idp, "Idp"},
  {Connect, "Connect"},
  {Dbreq, "Dbreq"},
  {Dbresp, "Dbresp"},
  {Dberr, "Dberr"},
  {End, "End"},
  {Timeout, "Timeout"},
  {(MsgType)-1, ""}
};

//////////////////////////////////////////////////////////////////////////
// Include the problem description file
//////////////////////////////////////////////////////////////////////////
#include <problem.h>

//
// Globals used for controlling multi fitness case experiments
//
int        ntrials = NTRIALS;   // Defined in the problem file
int        trial;               // Current fitness case

//////////////////////////////////////////////////////////////////////////
//
// Name:         decode      
//
// Member of:    n/a
//
// Parameters:   A string containing a message type   
//
// Purpose:      Converts a text string to a message number
//               Used when initialising the state tables
//
//////////////////////////////////////////////////////////////////////////
MsgType decode(char *s)
{
  MsgType  result = None;

  for(int i=0;i<MAXMSGS; i++)
    {
      if(table[i].enumtype == -1)
	break;
      if(strcmp(s, table[i].strtype) == 0)
	result = table[i].enumtype;
    }
  if(debug)
    cout << "@@@@@ Decode of type " << s << " to value " << result << endl;
  return result;
}


//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//
// Name:               Scsm
//
// Member of:          Scsm
//
// Parameters:         None
//
// Purpose:            Constructor for an SCSM object
//
//////////////////////////////////////////////////////////////////////////
Scsm::Scsm()
{
  if(debug)
    cout << "Constructing a Scsm " << endl;
  ok = 500;
  fitness = 3.0;
}
  
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//
// Name:               ~Scsm
//
// Member of:          Scsm
//
// Parameters:         None
//
// Purpose:            Destructor for an Scsm object
//
//////////////////////////////////////////////////////////////////////////
Scsm::~Scsm()
{
  if(debug)
    cout << "Destructor for SCSM\n";
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               init
//
// Member of:          Scsm
//
// Parameters:         None used
//
// Purpose:            Initilise on a per run basis the Scsm.
//
//////////////////////////////////////////////////////////////////////////
void  Scsm::init(char * )
{
  for(int i=0;i<MAXSTATES;i++)
    {                                             // Initialise the state table
      if(st[i].c == -1)
	break;  // All done
      stateTable.insertState(st[i].c, 
			     Msg(st[i].o, st[i].op1, st[i].op2),
			     Msg(st[i].e, st[i].ip1, st[i].ip2),
			     st[i].n,
			     st[i].f);
    }
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               print
//
// Member of:          StateTable
//
// Parameters:         None
//
// Purpose:            Prints the state table for information purposes
//                     to standard out
//
//////////////////////////////////////////////////////////////////////////
void  StateTable::print(void)   
{
  cout << "Index\tCur\tOutMsg\tp1\tp2\tInMsg\tp1\tp2\tNext\n";
  for(int i=0;i<next; i++ )
    {
      cout << i << '\t' << table[i].cur << '\t' 
	   << table[i].outmsg._type  << '\t'
	   << table[i].outmsg.p1().strval    << '\t'
	   << table[i].outmsg.p2().strval    << '\t'
	   << table[i].event._type   << '\t'
	   << table[i].event.p1().strval    << '\t'
	   << table[i].event.p2().strval    << '\t'
	   << table[i].next 
	   << table[i].fitness << endl;
    }
}  

//////////////////////////////////////////////////////////////////////////
//
// Name:               emitMsg
//
// Member of:          Scsm
//
// Parameters:         None
//
// Purpose:            called as part of the evaluation of fitness. 
//                     It locates an entry in the state table for the 
//                     current scsm state, and emits a message to the 
//                     evolving program
//
//////////////////////////////////////////////////////////////////////////
Msg  * Scsm::emitMsg()
{
  int    status;
  static Msg  thisMsg;
  State  next;


  status = stateTable.state(state, next);
  next.print();
  if(status == 0)
    {
      // still in the same state, so no message to output
      // return a timeout message to the service
      thisMsg._type = Timeout;
      if(debug)
	cout << "Did not get good transition\n";
      penalise();
      bad++;
    }
  else
    {
      thisMsg = next.outmsg;
      thisMsg.p1() = next.outmsg.p1();
      if(debug)
	cout << "Setting p1 to " << thisMsg.p1().strval << endl;
      thisMsg.p2() = next.outmsg.p2();
      if(debug)
	cout << "<<<Going from state " << state << " To " << next.next << endl;
      state = next.next;
      reward();  // We had a correct transition here
      if(debug)
	cout << "Got good transtion in accept\n";
      good++;
    }

  return &thisMsg;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               emitMsg
//
// Member of:          Scsm
//
// Parameters:         A message object reference
//
// Purpose:            called as part of the evaluation of fitness.
//                     It locates an entry in the state table for the current
//                     scsm state, and matches the recieved message.
//                     If Optimistic is set, then a transition is made even if the
//                     the current state is wrong. This is to try to maintain
//                     diversity in the population during early generations
//
//////////////////////////////////////////////////////////////////////////
void Scsm::acceptMsg (Msg & msg)
{
  State next;
  int status;
  int optimistic = 0;

  status = stateTable.state(state, msg, next, optimistic);
  if (status == 0)
    {
      // Did not get a transition out of the current state
      // do nothing
      if(debug)
	cout << ">>>Did not accept message type " << msg._type << 
	  " in state " << state << endl;
      penalise();
      bad++;
      return;
    }
  if(debug)
    cout << "Message parameter value = " << msg.p1() << endl;
  if(next.event.p1().strval[0] != '*')
    {
      if(debug)
	cout << "$$$$Expecting a parameter value of " 
	     << next.event.p1().strval << endl;
      if(strcmp(next.event.p1().strval, msg.p1().strval) == 0)
	{
	  if(debug)
	    cout << "Got good parameter " <<  msg.p1() << endl;
	  reward();
	  goodparm++;
	}
      else
	{
	  if(debug)
	    cout << "Bad parameter. Got " << msg.p1().strval << endl;
      	  penalise();
	  badparm++;
	}
    }

  if(debug)
    cout <<">>>Going from state " << state << " To " << next.next << endl;
  state = next.next;
  // Got a good transition
  reward();
  good++;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               insertState
//
// Member of:          StateTable
//
// Parameters:         c = state number
//                     o = output message type
//                     e = input message type
//                     n = next state
//                     f = weighting factor (not used)
//
// Purpose:            Insert a state entry into the table
//
//////////////////////////////////////////////////////////////////////////
void StateTable::insertState(int c, const Msg & o, 
			     const Msg & e, 
			     int n, double f)
{
  if(next > MAXSTATES) {
    cout << "Too many states\n";
    exit(1);
  }
  table[next].cur    = c;
  table[next].outmsg = o;
  table[next].event  = e;
  table[next].next   = n;
  table[next].fitness=f;
  next++;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               state
//
// Member of:          StateTable
//
// Parameters:         cur = current state
//                     msg = message to trigger transtition
//                     ret = ref to a return variable for next state
//                     optimistic. See below.
//
// Purpose:            Given a message and state, locate a state entry
//                     Returns the table entry if a match found, or current state if
//                     not found
//////////////////////////////////////////////////////////////////////////
int StateTable::state(int cur, Msg & msg,  State &ret, int optimistic)
{
  
  for(int i=0;i<next;i++)
    {
      if(table[i].event._type == msg._type)
	{
	  switch (optimistic)
	    {
	    case 0:
	      if(table[i].cur == cur)
		{
		  if(debug)
		    cout << "+++ACCEPT+++Got match in state "<< cur << 
		      " to goto state " << table[i].next << "Index = " << i 
			 << "cur = " << cur << endl;
		  current = i;
		  ret = table[i];
		  return 1;
		}
	      break;
	    case 1:
	      if(debug)
		cout << "+++ACCEPT-OPTIMIST+++Got match in state "<< cur << 
		  " to goto state " << table[i].next << "Index = " << i 
		     << "cur = " << cur << endl;
	      current = i;
	      ret = table[i];
	      return 0;
	      break;
	    }
	}
    }
  // Failed to find a valid event in this state, 
  ret = table[current];
  return 0;
}

//////////////////////////////////////////////////////////////////////////
// 

//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//
// Name:               state
//
// Member of:          StateTable
//
// Parameters:         cur = current state
//                     ret = return variable which will hold next state
//
// Purpose:            To loacte a state if an output message is required
//        
// Given a state, locate a state entry that has an outmsg
// Returns the table entry if a match found, or current state if
// not found
//
// If there are more than one possible states, then this function decides
// which one to select.
// To do this, the table is searched for the number of matching states
// If there are zero, then returns the same state
// If there is more than one say N , then for now we select 1 from N
// using the trial number. Contrast to random selection
// 
//////////////////////////////////////////////////////////////////////////
int StateTable::state(int cur,  State &ret )
{
  extern int trial;  // Holds the run number : 0 or 1
  int matches=0;

  // Find number of matching states
  for(int i=0;i<next;i++)
    {
      if(table[i].cur == cur && table[i].outmsg._type != None)
        {
          matches++;
        }
    }

  if(matches == 0)
    {
      // Failed to find a valid event in this state, 
      if(debug) cout << "+++ACCEPT(emit)+++Failed to find valid state\n";
      ret = table[current];
      return 0;
    }
  else if(matches == 1)
    {
      // Go back and find the match
      for(int i=0;i<next;i++)
        {
          if(table[i].cur == cur && table[i].outmsg._type != None)
            {
              if(debug)
                cout << "+++ACCEPT(Emit)+++Got match in state "<< cur << 
                  " to goto state " << table[i].next << "Index = " << i 
		     << "cur = " << cur << endl;
              current = i;
              ret = table[i];
              return 1;
            }
        }
    }
  else
    {
      // there were more than one match, so work out a probability that it was
      // the first or second (assuming here that there are only two states)
      
      long randval;
      int  count=0;

      randval = GPrand() % matches;
      if(debug)cout << "randval = " << randval << endl;
      for(int i=0;i<next;i++)
        {
          if(table[i].cur == cur && table[i].outmsg._type != None)
            {
              // Found a valid entry. If the random value == count then select
              // this entry else select second
              if(trial == count)
                {
                  if(debug) cout << "Selecting the entry number " << 
			      count << endl;
                  current = i;
                  ret = table[i];
                  return 1;
                }
              else
                {
                  if(debug)cout << "Incrementing the counter\n";
                  count ++;
                }
            }
        }
    }
  cout << "ERROR> DID NOT FIND VALID ENTRY BUT SHOULD HAVE\n";
  return 0;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               operator =
//
// Member of:          VarVal
//
// Parameters:         ref to a varval
//
// Purpose:            Assignment operator
//
//////////////////////////////////////////////////////////////////////////
VarVal & VarVal::operator=(const VarVal & v)
{
  if(debug) cout << "Ref assignment to VarVal with value " << v  << endl;


  strcpy (strval, v.strval);
  intval = v.intval;
  if(_index == -1)
    // Dont change if it will overide an esiting address
    _index  = v._index;

  return *this;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               operator =
//
// Member of:          VarVal
//
// Parameters:         s = a string
//
// Purpose:            Assignment for string values to a varval
//
//////////////////////////////////////////////////////////////////////////
VarVal & VarVal::operator=(const char * s)
{
  if(debug) cout << "String assignment to VarVal with value " << s  << endl;

  strcpy(strval, s);

  return *this;
}

//////////////////////////////////////////////////////////////////////////
//
// Name:               operator <<
//
// Member of:          VarVal
//
// Parameters:         stream and ref to varval
//
// Purpose:            To provide output for debugging
//
//////////////////////////////////////////////////////////////////////////
ostream & operator << (ostream & op, VarVal v)
{
  return op << "[String = " << v.strval << " Int = " << v.intval << " Index = " << v._index << "]" ;
}





















































































