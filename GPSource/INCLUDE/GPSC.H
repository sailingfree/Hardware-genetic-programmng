//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//
//   ####   #####    ####    ####           #    #
//  #    #  #    #  #       #    #          #    #
//  #       #    #   ####   #               ######
//  #  ###  #####        #  #        ###    #    #
//  #    #  #       #    #  #    #   ###    #    #
//   ####   #        ####    ####    ###    #    #
//
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
// gpsc.h
// Class definitions for the GP service creation system
// 
// Revision history
// 30  Sept 1997   Initial version using standard gp kernel
// 04  Nov  97     Added parameter passing in messages
// 12  Nov  97	   Changed name to gpsc and scsm
// 11  Apr  98     Removed unused functions and general tidy up
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

#ifndef GPSC_H
#define GPSC_H

#include "gp.h"
#include "gpconfig.h"
#include <scsm.h>


// Define function and terminal identifiers
enum  FTids 
{
  FSTART  = 0,
  FDBREAD,
  FROUTE,
  STRSUB, 
  FEND,
  TVAR1,  TVAR2,  
  TVAR3,  TVAR4,  TVAR5,  
  TVAR6,  TVAR7,  TVAR8,  
  TVAR9,  TVAR10,
  
  FEQ,                            // For multi path experiments

  READMSG, SENDMSG,               // For reduced complexity functions

  LastID
};

#define MAXMEM 100

//////////////////////////////////////////////////////////////////////////
// A memory object. This is used as indexed memory for the GP
// It stores an array of VarVal objects
//////////////////////////////////////////////////////////////////////////
class Memory
{
private:
  int        size;

public:
  VarVal     varVal[MAXMEM]; // A global array of variables

//
// Constructor with default size
//
  Memory()                   
  {
    size = MAXMEM;
    reset();
  }

//
// Constructor with required size
//
  Memory(int wanted)         
  {
    if(wanted > MAXMEM)
      {
	cout << "Max memory size is " << MAXMEM << " elements." << endl;
	exit(1);
      }
    else
      {
	size=wanted;
	reset();
      }
  }

//
// Reset the memory to empty
//
  void reset()  
  {
    if(debug) cout << "Resetting memory \n";
    for (int cnt=0;cnt<MAXMEM;cnt++)
      {
	varVal[cnt].strval[0] = '\0';
	varVal[cnt].intval    = cnt;
	varVal[cnt].setIndex(cnt);
        varVal[cnt].msgType   = (MsgType)cnt;
      }
  }

//
// Overload the [] operator to allow indexing
// 
  VarVal & operator[](int index) 
  {
    if(index < 0 || index >= size)
      {
	cout << "Illegal index into memory array <" << index << ">" << endl;
	exit(1);
      }
    if(debug)  cout << "Returning memory index " << index << " value = " <<
		 varVal[index] << endl;
    return varVal[index];
  }

//
// print function. Displays the memory object contents, primarily for
// debugging purposes
//
  void print(void)
  {
    if(debug) {
      for(int i=0;i<size;i++)
	{
	  cout << "Memory location " << i <<  " => " 
	       << varVal[i] << endl;
	}
    }
  }
//
// Write function. This is used when we dont want to 
// destroy the index value of the memory cell
//
  void write(int i, VarVal &v)
  {
    varVal[i].intval=v.intval;
    strcpy(varVal[i].strval, v.strval);
  }
};

class MyGP;   // Forward declaration
//////////////////////////////////////////////////////////////////////////
// Inherit the three GP classes GPGene, GP and GPPopulation
// These classes define the problem specific details of GP
//////////////////////////////////////////////////////////////////////////
//
// Class:         MyGene
//
// Derived From:  GPGene
//
// Purpose:       Defines the individual genes
//
//////////////////////////////////////////////////////////////////////////
class MyGene : public GPGene
{
public:
// Duplication (mandatory)
  MyGene (const MyGene& gpo) : GPGene (gpo) { }
  virtual GPObject& duplicate () { return *(new MyGene(*this)); }

// Creation of own class objects (mandatory)
  MyGene (GPNode& gpo) : GPGene (gpo) {}
  virtual GPGene* createChild (GPNode& gpo) {
    return new MyGene (gpo); }

// Tree evaluation 
  VarVal & evaluate (Scsm & scsm, MyGP & gp);

// Load and save 
  MyGene () {}

  virtual GPObject* createObject() { return new MyGene; }

// Print 
  virtual void printOn (ostream& os);

// Access children 
  MyGene* NthMyChild (int n) {
    return (MyGene*) GPContainer::Nth (n); }
};

//////////////////////////////////////////////////////////////////////////
//
// Class:         MyGP
//
// Derived From:  GP
//
// Purpose:       Defines an individual program
//
//////////////////////////////////////////////////////////////////////////
class MyGP : public GP 
{
public:
// Counters for good and bad transtitions and message parameters
  int   goodx, badx, goodm, badm;

// Duplication (mandatory)
  MyGP (MyGP& gpo) : GP (gpo) 
  { 
    goodx=gpo.goodx;
    badx=gpo.badx;
    goodm=gpo.goodm;
    badm=gpo.badm;
  }
  virtual GPObject& duplicate () { return *(new MyGP(*this)); }

// Creation of own class objects (mandatory)
  MyGP (int genes) : GP (genes) {}
  virtual GPGene* createGene (GPNode& gpo) {
    return new MyGene (gpo); }

// Tree evaluation (mandatory)
  virtual void evaluate ();

// Load and save (not mandatory)
  MyGP () {}
  virtual GPObject* createObject() { return new MyGP; }

// Access trees (not mandatory)
  MyGene* NthMyGene (int n) 
  {
    return (MyGene*) GPContainer::Nth (n); 
  }
};


//////////////////////////////////////////////////////////////////////////
//
// Class:         MyPopulation
//
// Derived From:  GPPopulation
//
// Purpose:       Defines a complete population of programs
//
//////////////////////////////////////////////////////////////////////////
class MyPopulation : public GPPopulation
{
public:
// Constructor (mandatory)
  MyPopulation (GPVariables& GPVar_, GPAdfNodeSet& adfNs_) : 
    GPPopulation (GPVar_, adfNs_) {}

// Duplication (mandatory)
  MyPopulation (MyPopulation& gpo) : GPPopulation(gpo) {}
  virtual GPObject& duplicate () { return *(new MyPopulation(*this)); }

// Creation of own class objects (mandatory)
  virtual GP* createGP (int numOfTrees) { return new MyGP (numOfTrees); }

// Load and save (not mandatory)
  MyPopulation () {}
  virtual GPObject* createObject() { return new MyPopulation; }
  
// Access genetic programs (not mandatory)
  MyGP* NthMyGP (int n) {
    return (MyGP*) GPContainer::Nth (n); }
  virtual void createGenerationReport (int printLegend, int generation,
				       ostream& fout, ostream& bout);

// Check for valid trees
  virtual int  checkForValidCreation(MyGP &gpo);
};

#endif // GPSC_H



























