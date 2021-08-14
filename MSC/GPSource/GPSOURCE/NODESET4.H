//////////////////////////////////////////////////////////////////////////
// Create function and terminal set
//////////////////////////////////////////////////////////////////////////
void createNodeSet (GPAdfNodeSet& adfNs)
{
  // Reserve space for the node sets
  adfNs.reserveSpace (1);
  
  // Now define the function and terminal set for each ADF and place
  // function/terminal sets into overall ADF container
  GPNodeSet& ns1=*new GPNodeSet (12);
  adfNs.put (0, ns1);
  
  // Define functions/terminals and place them into the appropriate
  // sets.  Terminals take two arguments, functions three (the third
  // parameter is the number of arguments the function has)

  ns1.putNode (*new GPNode(  FSTART,    "FSTART",   2));
  ns1.putNode (*new GPNode(  FROUTE,    "FROUTE",   2));
  ns1.putNode (*new GPNode(  FDBREAD,   "FDBREAD",  3));
  ns1.putNode (*new GPNode(  FEQ,       "FEQ",      3));
  ns1.putNode (*new GPNode(  STRSUB,    "STRSUB", 2));
  ns1.putNode (*new GPNode(  FEND,      "FEND", 1));
  ns1.putNode (*new GPNode(  TVAR1,     "TVAR1"));
  ns1.putNode (*new GPNode(  TVAR2,     "TVAR2"));
  ns1.putNode (*new GPNode(  TVAR3,     "TVAR3"));
  ns1.putNode (*new GPNode(  TVAR4,     "TVAR4"));
  ns1.putNode (*new GPNode(  TVAR5,     "TVAR5"));
  ns1.putNode (*new GPNode(  TVAR6,     "TVAR6"));
}

