/////////////////////////////////////////////////////////////////////////////
// This problem is for experiment 1. A simple number translation service
// is to be created.
// The Initial DP carries the calledDN. The resultant DB request key is
// the CalledDN stripped of the first number.
// The connect is carries the result of the DBresponse stripped of the
// first digit.
/////////////////////////////////////////////////////////////////////////////

static struct St st[MAXSTATES] = {
	{0, Idp,   "123456", 0, None,    "*",      0, 1, 10.0},
	{1, None,  "*",      0, Dbreq,   "23456",  0, 2, 5.0},
	{2, Dbresp,"654321", 0, None,    "*",      0, 3, 1.0},
	{3, None,  "*",      0, Connect, "54321",  0, 4, 1.0},
	{4, None,  "*",      0, End,     "*",      0,-1, 1.0},
	{-1, None, "*",      0, None,    "*",      0,-1, 0.0}};

#define NTRIALS  1
