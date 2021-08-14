//////////////////////////////////////////////////////////////////////////
//
//   ####   #####    ####    ####            ####    ####
//  #    #  #    #  #       #    #          #    #  #    #
//  #       #    #   ####   #               #       #
//  #  ###  #####        #  #        ###    #       #
//  #    #  #       #    #  #    #   ###    #    #  #    #
//   ####   #        ####    ####    ###     ####    ####
//
//////////////////////////////////////////////////////////////////////////
// gpsc.cc
//
// This is the main GP program 
//
// Notes:
// ======
// This file is common to all experiments.
// The problem specific part is contained in nodeset.h which defines the
// nodeset for each problem
//
//////////////////////////////////////////////////////////////////////////
// HISTORY
// =======
// 27-Sept-97   Initial Version
// 04-Nov-97    Added parameter passing in messages
// 12 Nov 97    Changed filenames from gpsc to gpsc and scsm to scsm
// 19 Dec 97    Added generation report specialisation
// 20 Dec 97    Added support for multi-path support
// 29 Dec 97    Added support for reduced complexity functions
// 11 Apr 98    Removed unused functions and general tidy up
//////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////
// System header files
//////////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <unistd.h>
#include <new.h>
#include <fstream.h>
#include <strstream.h>

//////////////////////////////////////////////////////////////////////////
// Application specific header files
//////////////////////////////////////////////////////////////////////////
#include "gp.h"
#include "gpconfig.h"
#include <gpsc.h>
#include <scsm.h>

//////////////////////////////////////////////////////////////////////////
// Define some global flags that control debug behaviour
//////////////////////////////////////////////////////////////////////////
int debug       = 0;	// If 1 then emit run-time debug information
int thegen      = 0;
int check_child = 1;
int quiet       = 1;
int optim       = 0;

//////////////////////////////////////////////////////////////////////////
// Externals used for multi fitness case evaluation
//////////////////////////////////////////////////////////////////////////
extern const int  ntrials;    // The number of passes required by evaluate
extern int        trial;      // Current fitness case

//////////////////////////////////////////////////////////////////////////
// Define configuration parameters and the neccessary array to
// read/write the configuration to a file.  If you need more
// variables, just add them below and insert an entry in the
// configArray.
//////////////////////////////////////////////////////////////////////////
GPVariables cfg;
struct GPConfigVarInformation configArray[]=
{
  {"PopulationSize", DATAINT, &cfg.PopulationSize},
  {"NumberOfGenerations", DATAINT, &cfg.NumberOfGenerations},
  {"CreationType", DATAINT, &cfg.CreationType},
  {"CrossoverProbability", DATADOUBLE, &cfg.CrossoverProbability},
  {"CreationProbability", DATADOUBLE, &cfg.CreationProbability},
  {"MaximumDepthForCreation", DATAINT, &cfg.MaximumDepthForCreation},
  {"MaximumDepthForCrossover", DATAINT, &cfg.MaximumDepthForCrossover},
  {"SelectionType", DATAINT, &cfg.SelectionType},
  {"TournamentSize", DATAINT, &cfg.TournamentSize},
  {"DemeticGrouping", DATAINT, &cfg.DemeticGrouping},
  {"DemeSize", DATAINT, &cfg.DemeSize},
  {"DemeticMigProbability", DATADOUBLE, &cfg.DemeticMigProbability},
  {"SwapMutationProbability", DATADOUBLE, &cfg.SwapMutationProbability},
  {"ShrinkMutationProbability", DATADOUBLE, &cfg.ShrinkMutationProbability},
  {"AddBestToNewPopulation", DATAINT, &cfg.AddBestToNewPopulation},
  {"SteadyState", DATAINT, &cfg.SteadyState},
  {"Penalty", DATAINT, &cfg.Penalty},
  {"Reward",  DATAINT, &cfg.Reward},
  {"", DATAINT, NULL}
};

//////////////////////////////////////////////////////////////////////////
// Define class identifiers
//////////////////////////////////////////////////////////////////////////
const int MyGeneID=GPUserID;
const int MyGPID=GPUserID+1;
const int MyPopulationID=GPUserID+2;

//////////////////////////////////////////////////////////////////////////
// Define a memory object
// This is the Automous Polymorphic Addressable Memory object that 
// holds a number of VarVal objects. It is pre-defined with a number of
// cells
//////////////////////////////////////////////////////////////////////////
Memory memory(10);

//////////////////////////////////////////////////////////////////////////
// Define a BCSM object
// This defines the call related functionality. It contains the details
// of the required call bahavour.
//////////////////////////////////////////////////////////////////////////
Scsm  myScsm;

//////////////////////////////////////////////////////////////////////////
//
// Name:       usage
//
// Parameters: cmd. A string containing the command name
// 
// Returns:    void function
// 
// Purpose:    Usage function. Prints the usage to stdout
//
//////////////////////////////////////////////////////////////////////////
void usage(const char * const cmd)    
{
  cout << "Usage: " << cmd << 
    "[-debug] [-v]" << endl;
  cout << "\t-debug turns on all run-time debugging" << endl;
  cout << "\t-v turns on a summary run-time status report" << endl;
  exit(1);
}

//////////////////////////////////////////////////////////////////////////
//
// Name:       evaluate
//
// Member of:  MyGene
//
// Parameters: scsm    a reference to a simple call state machine 
//                     that defines a service
//             gp      a reference to a GP object defining the current
//                     individual
// 
// Returns:    A reference to a VarVal object that is the result of
//             this or a subtree.
//
// Purpose:    This function evaluates the fitness of a genetic tree.  
//             Each gene may either interact with the BCSM and change 
//             it's state, or it may alter the values of the current 
//             GP variable members
//
//////////////////////////////////////////////////////////////////////////
VarVal & MyGene::evaluate (Scsm & scsm, MyGP & gp)
{
  Msg    *inmsg;

  if(debug)
    {
      cout << "Evaluating gene <" << node->value() << ">" ;
      printOn(cout);
      cout << endl;
    }
  Msg msg;

  switch (node->value ())
    {
    case  FSTART:
      //////////////////////////////////////////////////////////////////////////
      // This node take two parameters and accepts an input message
      // The message contains the CallersDN and a flag parameter.
      // The calledDN and flag are placed into the location returned by the 
      // first parameter.
      // The result of the second parameter is returned from this function
      //////////////////////////////////////////////////////////////////////////
      {
	VarVal child0;

	inmsg = scsm.emitMsg();

	child0=NthMyChild(0)->evaluate(scsm, gp);
	if(debug) {
	  cout << " Child 0 = " << child0 << endl;
	  cout << "Got a message from the BCSM. Type = " << inmsg->_type << 
	    inmsg->p1() << endl;
	}
	if(debug)
	  cout << "ABC Assigning " << inmsg->p1() << 
	    " to child " << child0 << endl;
	memory.write(child0.index(), inmsg->p1());
	if(debug) cout << "Setting child 0 to " << child0 << endl;
	memory.print();
	// Go and evaluate the rest of the tree returning the value 
	return NthMyChild(1)->evaluate(scsm, gp);
	break;
      }
    case  FDBREAD:
      //////////////////////////////////////////////////////////////////////////
      // the first parameter is an input containing a key value
      // the second is the output containing the result.
      //////////////////////////////////////////////////////////////////////////
      {
	VarVal child0;
	VarVal child1;

	child0=NthMyChild(0)->evaluate(scsm, gp);

	msg._type = Dbreq ;
	if(debug) cout << "XYZ:Assigning value " << child0 << 
		    " to message p1 " <<endl;
	msg.p1() = child0;
	if(debug){
	  cout << "XYZ:Assigned value to message. Actual msg p1 = " << 
	    msg.p1() << endl;
	}

	scsm.acceptMsg(msg);	  
	inmsg=scsm.emitMsg();

	child1=NthMyChild(1)->evaluate(scsm, gp);

	memory.write(child1.index(), inmsg->p1());
	return NthMyChild(2)->evaluate(scsm, gp);
	break;
      }
    case  FROUTE:
      //////////////////////////////////////////////////////////////////////////
      // The first parameter is the number to route to so evaluate it first
      //////////////////////////////////////////////////////////////////////////
      {
	VarVal child0;

	child0=NthMyChild(0)->evaluate(scsm, gp);

	// Plug the value into the message and send it
	msg.p1() = child0;
	msg._type = Connect;
	scsm.acceptMsg(msg);

	// Evaluate the rest of the tree
	return NthMyChild(1)->evaluate(scsm, gp);
	break;
      }
    case  STRSUB:
      //////////////////////////////////////////////////////////////////////////
      // For now we will support a simple shift left 1 char operation
      // Child 0 is shifted left 1 character and copied to child1
      // returns child1
      //////////////////////////////////////////////////////////////////////////
      {
	VarVal child0, child1;
	char tmp[1024];

	child0 = NthMyChild(0)->evaluate(scsm, gp);
	child1 = NthMyChild(1)->evaluate(scsm, gp);
	
	if(strlen(child0.strval) > 1)
	  {
	    strcpy(tmp, &child0.strval[1]);
	    strcpy(child1.strval, tmp);
	    memory.write(child1.index(), child1);
	  }	
	// return the memory cell modified
	return memory[child1.index()];
	break;
      }
    case  FEND:
      //////////////////////////////////////////////////////////////////////////
      // Evaluates the child and sends a message to the  SCSM. 
      // The result of evaluating child 0 is returned.
      //////////////////////////////////////////////////////////////////////////
      {
	msg._type = End;
	scsm.acceptMsg(msg);
	return NthMyChild(0)->evaluate(scsm, gp);
	break;
      }
    case  FEQ:
      //////////////////////////////////////////////////////////////////////////
      // Child 0 is evaluated. 
      // If the integer part of the child is equal to 1
      //    then child1 is evaluated and returned 
      // else
      //    child 2 is evaluated and returned.
      //////////////////////////////////////////////////////////////////////////
      {
        if(debug)
          {
            cout << "Evaluating an FEQ node" << endl;
          }
        VarVal child0;
        
        child0 = NthMyChild(0)->evaluate(scsm, gp);
        
        if(child0.intval == 1)
          {
            if(debug) cout << "Got a TRUE in FEQ" << endl;
            return NthMyChild(1)->evaluate(scsm,gp);
          }
        else
          {
            if(debug) cout << "Got a FALSE in FEQ" << endl;
            return NthMyChild(2)->evaluate(scsm,gp);
          }
        break;
      }
    case  READMSG:
      //////////////////////////////////////////////////////////////////////////
      //
      // The message is accepted from the scsm.
      // Child 0 is evaluated, and the parameters from the message
      //   placed into the resulting location.
      // Child 1 is then returned 
      //
      //////////////////////////////////////////////////////////////////////////
      {
        VarVal child0;

        inmsg = scsm.emitMsg();

        child0=NthMyChild(0)->evaluate(scsm, gp);
        if(debug) {
          cout << " Child 0 = " << child0 << endl;
          cout << "Got a message from the BCSM. Type = " << inmsg->_type << 
            inmsg->p1() << endl;
        }
        if(debug)
          cout << "ABC Assigning " << inmsg->p1() << " to child " 
	       << child0 << endl;
        memory.write(child0.index(), inmsg->p1());
        if(debug) cout << "Setting child 0 to " << child0 << endl;
        memory.print();
       
	// Go and evaluate the rest of the tree returning the value 
        return NthMyChild(1)->evaluate(scsm, gp);
        break;
      }
    case  SENDMSG:
      //////////////////////////////////////////////////////////////////////////
      // Child 0 is evaluated to get the message type
      // Child 1 is evaluated to get the data value
      // Child 2 is evaluated to get the next tree
      //////////////////////////////////////////////////////////////////////////
      {
	VarVal child0;
	VarVal child1;
	
	child0=NthMyChild(0)->evaluate(scsm, gp);
	child1=NthMyChild(1)->evaluate(scsm, gp);
	
	msg._type =  child0.msgType;
	msg.p1()  =  child1;
	
	scsm.acceptMsg(msg);        
	
	return NthMyChild(2)->evaluate(scsm, gp);
	break;
      }
    case  TVAR1:
      //////////////////////////////////////////////////////////////////////////
      // Each TVARx simply returns a reference to a memory location.
      // These are all terminal nodes
      //////////////////////////////////////////////////////////////////////////
      {
	return memory[0];
	break;
      }
    case  TVAR2:
      {
	return memory[1];
	break;
      }
    case  TVAR3:
      {
	return memory[2];
	break;
      }
    case  TVAR4:
      {
	return memory[3];
	break;
      }
    case  TVAR5:
      {
	return memory[4];
	break;
      }
    case  TVAR6:
      {
	return memory[5];
	break;
      }
    case  TVAR7:
      {
	return memory[6];
	break;
      }
    case  TVAR8:
      {
	return memory[7];
	break;
      }
    case  TVAR9:
      {
	return memory[8];
	break;
      }
    case  TVAR10:
      {
	return memory[9];
	break;
      }
    default: 
      ////////////////////////////////////////////////////////////////////
      // A node value is unrecognised. Possibly a fault in the nodeset
      // The run is terminated after issuing an informational message
      ////////////////////////////////////////////////////////////////////
      {
	GPExitSystem ("MyGene::evaluate", "Undefined node value");
      }
    }
  GPExitSystem ("MyGene::evaluate", "Invalid node evaluation");
  exit(1);
}

//////////////////////////////////////////////////////////////////////////
//
// Load the problem specific node set
// This include file is different for each experiment.
// It includes in-line member definition code that initialises the node
// set objects.
//
//////////////////////////////////////////////////////////////////////////
#include "nodeset.h"

//////////////////////////////////////////////////////////////////////////
//
// Name:         evaluate
//
// Member of:    MyGP
// 
// Parameters:   None
//
// Returns:      void function
//
// Purpose:      Evaluate the fitness of a GP and save it into the 
//               class variable fitness.
// 
// Notes:
//               The external variable ntrials controls how many 
//               individual fitness trials are performed.
//               The external variable trial contains the current
//               fitness case being evaluated against.
//
//////////////////////////////////////////////////////////////////////////
void MyGP::evaluate ()
{
  double  tempfitness = 0.0;
  double  fitness;

  // Evaluate main tree
  if(debug)
    {
      cout << "===============================================\n";
      cout << "Evaluating a GP\n";
    }

  goodx=badx=goodm=badm=0;
  for(trial=0;trial < ntrials; trial++)
    {
      memory.reset();
      myScsm.reset();
      if(debug) cout << "Doing trial " << trial << endl;
      NthMyGene (0)->evaluate (myScsm, *this);
      
      fitness = myScsm.finalStateFitness();
      tempfitness += fitness;
      goodx += myScsm.good;
      badx  += myScsm.bad;
      goodm += myScsm.goodparm;
      badm  += myScsm.badparm;
    }

  fitness = tempfitness;



  if(debug)
    cout <<" STAT1 @ gen " << thegen << ' ' 
	 << '[' << goodx << ' ' 
	 << badx << ' ' 
	 << goodm << ' ' 
	 << badm << ']' << endl;
  stdFitness = fitness;
  if(optim && fitness == 0)
    {
      cout << "Got totally fit individual on generation " << thegen << endl;
      printOn(cout);
      exit(0);
    }
}

//////////////////////////////////////////////////////////////////////////
//
// Name:        checkForValidCreation
//
// Member of:   MyPopulation
//
// Paremeters:  MyGP & a ref to a created GP object
//
// Returns:     1 if indivudual is ok, 0 otherwise
//
// Purpose:     To perform per individual checks. In this application
//              this is a null function, since all individuals are deemed
//              to be OK by virtue of APAM which ensures closure.
//
//////////////////////////////////////////////////////////////////////////
int MyPopulation::checkForValidCreation(MyGP & )
{
  return 1;
}

//////////////////////////////////////////////////////////////////////////
//
// Name          newHandler
//
// Purpose:      To handle an out of memory situation. In this application
//               we just terminate the entire run since there is little
//               that can be done.
//
//////////////////////////////////////////////////////////////////////////
void newHandler ()
{
  cerr << "\nFatal error: Out of memory." << endl;
  exit (1);
}

//////////////////////////////////////////////////////////////////////////
//
// Name:         main
//
// Parameters:   int argc  a count of the number of arguments
//               char argv[] an array of pointers to strings. Each string
//               contains a command line argument.
//
// Purpose:      Standard C++ main function. This drives the entire 
//               program
//
//////////////////////////////////////////////////////////////////////////
int main (int argc, char *argv[])
{
  char * filename = NULL;

  if(argc > 1)
    {
      for(int i=1; i<argc; i++)
	{
	  if(argv[i][0] == '-')
	    {
	      if(strcmp(argv[i], "-debug") == 0)
		{
		  cout << "Setting debug = 1\n";
		  debug=1;
		}
	      else if(strcmp(argv[i], "-v") == 0)
		quiet = 0;
	      else
		usage(argv[0]);
	    }
	  else
	    filename = argv[i];
	}
    }

  // Set up a new-handler, because we might need a lot of memory, and
  // we don't know it's there.
  set_new_handler (newHandler);

  // Init GP system.
  GPInit (0, -1);

  myScsm.init(filename);

  // Read configuration file.
  GPConfiguration config (cout, "gpsc.ini", configArray);
  
  // Print the configuration
  if(!quiet)
    cout << cfg << endl;

  // Print state table
  if(!quiet)
    myScsm.printStates();

  // Create the adf function/terminal set and print it out.
  GPAdfNodeSet adfNs;
  createNodeSet (adfNs);
  if(!quiet)
    cout << adfNs << endl; 
  
  // Open the main output file for the data and statistics file.
  // First set up names for data file.  Remember we should delete the
  // string from the stream, well just a few bytes
  ostrstream strOutFile, strStatFile;
  strOutFile  << "data.dat" << ends;
  strStatFile << "data.stc" << ends;
  ofstream fout (strOutFile.str());
  ofstream bout (strStatFile.str());
  
  // Create a population with this configuration
  if(!quiet)
    cout << "Creating initial population ..." << endl;
  MyPopulation* pop=new MyPopulation (cfg, adfNs);
  pop->create ();
  pop->createGenerationReport (1, 0, fout, bout);

  // This next for statement is the actual genetic programming system
  // which is in essence just repeated reproduction and crossover loop
  // through all the generations ...
  MyPopulation* newPop=NULL;
  for (int gen=1; gen<=cfg.NumberOfGenerations; gen++)
    {
      thegen=gen;
      // Create a new generation from the old one by applying the
      // genetic operators
      if (!cfg.SteadyState)
	newPop=new MyPopulation (cfg, adfNs);
      pop->generate (*newPop);
      
      // Delete the old generation and make the new the old one
      if (!cfg.SteadyState)
	{
	  delete pop;
	  pop=newPop;
	}

      // Create a report of this generation and how well it is doing
      pop->createGenerationReport (0, gen, fout, bout);
    }
  return 0;
}


//////////////////////////////////////////////////////////////////////////
//
// Name:               printOn
//
// Member of:          MyGene
//
// Parameters:         ostream & a reference to an output stream on which 
//                     to write the information
//
// Purpose:            Print function to display and record the details of 
//                     an individual
//
//////////////////////////////////////////////////////////////////////////
void MyGene::printOn (ostream& os)
{
  if (node->isFunction ())
    os << "(";
  os << *node;

  // Print all children, if any
  for (int n=0; n<containerSize(); n++)
    {
      GPGene* current=NthChild (n);

      os << ' ';
      if (current)
        os << *current;
      else
        os << "(NULL)";
    }

  if (node->isFunction ())
    os << ")";
}


//////////////////////////////////////////////////////////////////////////
//
// Name:               createGenerationReport  
//
// Member of:          MyPopulation
//
// Parameters:         printLegend. A flag to indicate whether to print
//                                  a legend
//                     generation   The generation number
//                     fout         a stream reference to a file
//                     bout         a stream reference to the console
//
// Purpose:            Output all the data found in a generation....
//
//////////////////////////////////////////////////////////////////////////
void MyPopulation::createGenerationReport (int printLegend, int generation, 
					   ostream& fout, ostream& bout)
{
  if (printLegend)
    {
      if(!quiet)
	cout << "Gen|       Fitness     |      Length       |   Depth\n"
	     << "   |  Best|Avg.|Worst  |  Best|Avg.|Worst  |  Best|Avg.|Worst\n";
      bout << "#Gen|       Fitness     |      Length       |   Depth\n"
	   << "#   |  Best|Avg.|Worst  |  Best|Avg.|Worst  |  Best|Avg.|Worst\n";
    }
  bout << generation 
       << ' ' << NthMyGP(bestOfPopulation)->getFitness()
       << ' ' << avgFitness
       << ' ' << NthMyGP(worstOfPopulation)->getFitness()
       << "    "
       << ' ' << NthMyGP(bestOfPopulation)->length ()
       << ' ' << avgLength
       << ' ' << NthMyGP(worstOfPopulation)->length ()
       << "    "
       << ' ' << NthMyGP(bestOfPopulation)->depth ()
       << ' ' << avgDepth
       << ' ' << NthMyGP(worstOfPopulation)->depth ();
  if(!quiet)
    bout << "\t[ " << NthMyGP(bestOfPopulation)->goodx 
	 << ' ' << NthMyGP(bestOfPopulation)->badx 
	 << ' ' << NthMyGP(bestOfPopulation)->goodm << ' ' 
	 << NthMyGP(bestOfPopulation)->badm << " ]"
	 << endl;
  else
    bout << "\n";

  if(debug) 
    cout << "Best of population = " << bestOfPopulation << endl;
  if(!quiet)
    cout << generation 
	 << ' ' << NthMyGP(bestOfPopulation)->getFitness ()
	 << ' ' << avgFitness
	 << ' ' << NthMyGP(worstOfPopulation)->getFitness ()
	 << "    "
	 << ' ' << NthMyGP(bestOfPopulation)->length ()
	 << ' ' << avgLength
	 << ' ' << NthMyGP(worstOfPopulation)->length ()
	 << "    "
	 << ' ' << NthMyGP(bestOfPopulation)->depth ()
	 << ' ' << avgDepth
	 << ' ' << NthMyGP(worstOfPopulation)->depth ()
      ;
  if(!quiet)
    cout << "\t[ " << NthMyGP(bestOfPopulation)->goodx 
	 << ' ' << NthMyGP(bestOfPopulation)->badx 
	 << ' ' << NthMyGP(bestOfPopulation)->goodm << ' ' 
	 << NthMyGP(bestOfPopulation)->badm << " ]" 
	 << endl;

  // Place the best of generation in output files
  fout << "Best of generation " << generation 
       << " (Fitness = " << NthMyGP (bestOfPopulation)->getFitness ()
       << ", Structural Complexity = " << NthMyGP (bestOfPopulation)->length () 
       << ")" << endl 
       << NthMyGP(bestOfPopulation)->goodx 
       << ' ' << NthMyGP(bestOfPopulation)->badx 
       << ' ' << NthMyGP(bestOfPopulation)->goodm << ' ' 
       << NthMyGP(bestOfPopulation)->badm << ' ' 
       << endl
       << *NthMyGP (bestOfPopulation)
       << endl;
}














